package com.study.restaurant.controller;

import cn.hutool.core.convert.Convert;
import com.study.common.annotation.Log;
import com.study.common.core.base.BaseController;
import com.study.common.core.domain.AjaxResult;
import com.study.common.core.page.TableDataInfo;
import com.study.common.enums.BusinessType;
import com.study.common.util.DateUtils;
import com.study.restaurant.entity.*;
import com.study.restaurant.service.DinnerTableService;
import com.study.restaurant.service.FoodBindService;
import com.study.restaurant.service.FoodService;
import com.study.restaurant.service.OrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/restaurant/order")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private DinnerTableService tableService;
    @Autowired
    private FoodBindService foodBindService;
    @Autowired
    private FoodService foodService;

    private static String prefix = "restaurant/order";

    @RequiresPermissions("rest:order:view")
    @GetMapping()
    public String index() {
        return prefix + "/order";
    }

    @RequiresPermissions("rest:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Order order) {
        startPage();
        List<Order> list = orderService.list(order);
        return getDataTable(list);
    }


    /**
     * 点餐桌页面
     * @param mmap
     * @return
     */
    @GetMapping("/hall")
    public String index(ModelMap mmap) {
    	// 空闲餐桌
        DinnerTable d0 = new DinnerTable();
        d0.setStatus(0);
        List<DinnerTable> freeList = tableService.list(d0);

        // 已用餐桌
        DinnerTable d1 = new DinnerTable();
        d1.setStatus(1);
        List<DinnerTable> usedList = tableService.list(d1);
        // 查询每个桌子对应的订单
        List<Map<String, Object>> mapList = new ArrayList<>();
        String date = DateUtils.getDate();
        for(DinnerTable table : usedList) {
        	Map<String, Object> map = new HashMap<>();
        	Order order = new Order();
        	order.setTable(table);
        	order.setDate(date);
        	Order lastOrder = orderService.getLastOrder(order);
        	map.put("order", lastOrder);
        	map.put("tableId", table.getTableId());
        	map.put("tableName", table.getTableName());
        	mapList.add(map);
        }
        System.out.println("已用：" + mapList);
        mmap.addAttribute("freeList", freeList);
        mmap.addAttribute("freeSize", freeList.size());
        mmap.addAttribute("usedList", mapList);
        mmap.addAttribute("usedSize", mapList.size());
        return prefix + "/hall";
    }

    /**
     * 开始点餐
     * 1 新增一条点餐记录
     * 2 桌子变成已用状态
     * 3 进入订单列表，然后在里面加减菜
     * @param tableId
     * @return
     */
    @Transactional
    @RequiresPermissions("rest:order:add")
    @RequestMapping("add/{tableId}")
    public String add(@PathVariable Long tableId){
        // 构造order对象
        String date = DateUtils.getDate();
        DinnerTable table = new DinnerTable();
        table.setTableId(tableId);
        Order order = new Order();
        order.setStartTime(DateUtils.getTime());
        order.setNo(System.currentTimeMillis()+"");
        order.setTable(table);
        order.setDate(date);
        order.setMoney(0f);
        order.setType(1);

        // 查看翻台
        Integer maxRockover = Convert.toInt(orderService.selectMaxRockover(order), 0);
        order.setRockover(maxRockover + 1);
        // 插入数据库
        int r = orderService.add(order);
        if (r > 0) {
            table.setStatus(1);
            tableService.updateStatus(table);
        }
        return prefix + "/order";
    }

    /**
     * 取消或结账
     * 同时将桌子状态置位可用
     */
    @RequiresPermissions("rest:order:edit")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @Transactional
    public AjaxResult editSave(@Validated Order order) {
        DinnerTable table = order.getTable();
        order.setEndTime(DateUtils.getTime());
        table.setStatus(0);
        int r = tableService.updateStatus(table);
        if (r > 0) {
            orderService.updateStatus(order);
        }
        return toAjax(r);
    }



    /**
     * 进入菜品绑定页面
     * @param mainId
     * @param mmap
     * @return
     */
    @RequestMapping("bind/{mainId}")
    public String bindIndex(@PathVariable Long mainId,ModelMap mmap) {
        mmap.addAttribute("mainId", mainId);
        return prefix + "/bindIndex";
    }

    /**
     * 已绑定菜品列表
     * @param mainId
     * @return
     */
    @RequestMapping("bind/list/{mainId}")
    @ResponseBody
    public TableDataInfo bindList(@PathVariable Long mainId) {
        FoodBind bind = new FoodBind();
        bind.setMainId(mainId);
        bind.setType(2);
        List<FoodBind> list = foodBindService.list(bind);
        return getDataTable(list);
    }


    /**
     * 进入绑定新菜品页面
     */
    @GetMapping("bind/add/{mainId}")
    public String bindAdd(@PathVariable Long mainId,ModelMap mmap) {
        mmap.addAttribute("mainId", mainId);
        return prefix + "/bindAdd";
    }

    /**
     * 查看未绑定的菜品列表
     * @param mainId
     * @return
     */
    @RequestMapping("bind/unadd/list/{mainId}")
    @ResponseBody
    public TableDataInfo unaddList(@PathVariable Long mainId) {
        // 查询所有已经绑定的菜品
        FoodBind bind = new FoodBind();
        bind.setMainId(mainId);
        bind.setType(2);
        List<FoodBind> list = foodBindService.list(bind);
        Map<Long, Object> existMap = new HashMap<>();
        list.forEach(b -> {
            existMap.put(b.getFood().getFoodId(), true);
        });

        // 查询所有的菜品，并过滤掉已绑定的
        Food searchFood = new Food();
        searchFood.setStatus(0);
        List<Food> foodList = foodService.list(searchFood);
        List<Food> newFoodList = new ArrayList<>();
        for(Food food : foodList) {
            Object object = existMap.get(food.getFoodId());
            if (object == null) {
                newFoodList.add(food);
            }
        }
        return getDataTable(newFoodList);
    }


    /**
     * 新菜品绑定保存
     */
    @Log(title = "预定管理", businessType = BusinessType.INSERT)
    @PostMapping("/bind/save/{mainId}")
    @ResponseBody
    public AjaxResult bindAddSave(@PathVariable Long mainId,String foodIds,String prices) {
        String[] foodIdss = Convert.toStrArray(foodIds);
        Float[] pricess = Convert.toFloatArray(prices);
        int r = 0;
        for(int i = 0; i<foodIdss.length; i++) {
            Food food = new Food();food.setFoodId(Long.valueOf(foodIdss[i]));
            FoodBind foodBind = new FoodBind();
            foodBind.setFood(food);
            foodBind.setMainId(mainId);
            foodBind.setType(2);
            foodBind.setPrice(pricess[i]);
            foodBind.setNum(1);
            r += foodBindService.add(foodBind);
        }
        FoodBind fb = new FoodBind();
        fb.setMainId(mainId);
        fb.setType(2);
        if (r > 0) {
            // 计算总价
            adjust(fb);
        }
        return toAjax(r);
    }

    /**
     * 菜品绑定删除
     * @param ids
     * @return
     */
    @PostMapping("bind/remove")
    @ResponseBody
    public AjaxResult bindDelete(Long ids) {
        FoodBind bind = foodBindService.getById(ids);
        int r = foodBindService.deleteById(ids);
        if (r > 0) {
            adjust(bind);
        }
        return toAjax(r);
    }



    /**
     * 核算订餐时候的总价
     * @param foodBind
     */
    private void adjust(FoodBind foodBind) {
        List<FoodBind> bindList = foodBindService.list(foodBind);
        Float total = 0f;
        for(FoodBind fb : bindList) {
            total += (fb.getPrice() * fb.getNum());
        }
        Order order = new Order();
        order.setId(foodBind.getMainId());
        order.setMoney(total);
        orderService.updateMoney(order);
    }

    
    
    
    /**
     * 进入营业额页面
     * 默认本月第一天到今天
     */
    @RequestMapping("quota")
    public String quota(ModelMap mmap) {
    	mmap.put("end", DateUtils.getDate());
    	mmap.put("start", DateUtils.getFirstDayOfMonth());
    	return prefix + "/quota";
    }
    
    
    /**
     * 营业额数据加载
     */
    @PostMapping("/quotaList")
    @ResponseBody
    public TableDataInfo quotaList(HttpServletRequest request) {
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        Order order = new Order();
        order.setSearchStart(start);
        order.setSearchEnd(end);
        List<Order> list = orderService.listGroupMoney(order);
        Float money = 0f;
        for(Order o : list) {
        	money += o.getMoney();
        }
        
        Order firstOrder = new Order();
        firstOrder.setDate("汇总");
        firstOrder.setMoney(money);
        list.add(0, firstOrder);
        
        return getDataTable(list);
    }
    
    
    
    
    
    

}
