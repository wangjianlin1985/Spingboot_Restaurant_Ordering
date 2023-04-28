package com.study.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.common.annotation.Log;
import com.study.common.core.base.BaseController;
import com.study.common.core.domain.AjaxResult;
import com.study.common.core.page.TableDataInfo;
import com.study.common.enums.BusinessType;
import com.study.common.util.DateUtils;
import com.study.restaurant.entity.DinnerTable;
import com.study.restaurant.entity.Food;
import com.study.restaurant.entity.FoodBind;
import com.study.restaurant.entity.Order;
import com.study.restaurant.entity.Reserve;
import com.study.restaurant.service.DinnerTableService;
import com.study.restaurant.service.FoodBindService;
import com.study.restaurant.service.FoodService;
import com.study.restaurant.service.OrderService;
import com.study.restaurant.service.ReserveService;

import cn.hutool.core.convert.Convert;

@Controller
@RequestMapping("/restaurant/reserve")
public class ReserveController extends BaseController{

	@Autowired
	private ReserveService reserveService;
	@Autowired
	private FoodBindService foodBindService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private OrderService orderService;
	@Resource
	private DinnerTableService dinnerTableService;
	
	
	private static String prefix = "restaurant/reserve";


    @RequiresPermissions("rest:reserve:view")
    @GetMapping()
    public String index() {
        return prefix + "/reserve";
    }

    @RequiresPermissions("rest:reserve:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Reserve reserve) {
        startPage();
        List<Reserve> list = reserveService.list(reserve);
        return getDataTable(list);
    }


    @RequiresPermissions("rest:reserve:remove")
    @Log(title = "预定管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(reserveService.deleteByIds(ids));
    }

    /**
     * 新增预定
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存预定
     */
    @RequiresPermissions("rest:reserve:add")
    @Log(title = "预定管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated Reserve reserve) {
        return toAjax(reserveService.add(reserve));
    }

    /**
     * 修改预定
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        mmap.put("reserve", reserveService.getById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存预定
     */
    @RequiresPermissions("rest:reserve:edit")
    @Log(title = "预定管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated Reserve reserve) {
        return toAjax(reserveService.update(reserve));
    }

    /**
     * 取消
     * @param reserve
     * @return
     */
    @RequiresPermissions("rest:reserve:edit")
    @Log(title = "预定管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updateStatus")
    @ResponseBody
    public AjaxResult updateStatus(@Validated Reserve reserve) {
        return toAjax(reserveService.updateStatus(reserve));
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
    	bind.setType(1);
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
    	bind.setType(1);
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
    //@RequiresPermissions("rest:reserve:add")
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
    		foodBind.setType(1);
    		foodBind.setPrice(pricess[i]);
    		foodBind.setNum(1);
    		r += foodBindService.add(foodBind);
    	}
    	FoodBind fb = new FoodBind();
    	fb.setMainId(mainId);
    	fb.setType(1);
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
    	Reserve reserve = new Reserve();
    	reserve.setId(foodBind.getMainId());
    	reserve.setTotal(total);
    	reserveService.updateTotal(reserve);
    }
    
    
    /**
     *  进入安排桌子界面
     * @param id
     * @param mmap
     * @return
     */
    @RequestMapping("bindFreeTable/{id}")
    public String bindFreeTable(@PathVariable Long id,ModelMap mmap) {
    	// 空闲餐桌
        DinnerTable d0 = new DinnerTable();
        d0.setStatus(0);
        List<DinnerTable> freeList = dinnerTableService.list(d0);
        mmap.addAttribute("freeList", freeList);
        mmap.addAttribute("id", id);
    	return prefix + "/selectTable";
    }
    
    
    /**
     * 保存绑定桌子
     * @param id
     * @param tableId
     * @return
     */
    @RequestMapping("bind/{id}/{tableId}")
    @ResponseBody
    @Transactional
    public AjaxResult bind(@PathVariable Long id,@PathVariable Long tableId) {
    	// 获取所有的餐品
    	FoodBind bind = new FoodBind();
    	bind.setMainId(id);
    	bind.setType(1);
    	List<FoodBind> list = foodBindService.list(bind);
    	
    	Reserve reserve = reserveService.getById(id);
    	
    	// 构造order对象
        String date = DateUtils.getDate();
        DinnerTable table = new DinnerTable();
        table.setTableId(tableId);
        Order order = new Order();
        order.setStartTime(DateUtils.getTime());
        order.setNo(System.currentTimeMillis()+"");
        order.setTable(table);
        order.setDate(date);
        order.setMoney(reserve.getTotal());
        order.setType(2);

        // 查看翻台
        Integer maxRockover = Convert.toInt(orderService.selectMaxRockover(order), 0);
        order.setRockover(maxRockover + 1);
        // 插入数据库
        int r = orderService.add(order);
        if (r > 0) {
        	// 改变桌子的状态
            table.setStatus(1);
            dinnerTableService.updateStatus(table);
            // 插入order-food绑定
            for(FoodBind fb : list) {
            	Food food = fb.getFood();
                FoodBind foodBind = new FoodBind();
                foodBind.setFood(food);
                foodBind.setMainId(order.getId());
                foodBind.setType(2);
                foodBind.setPrice(fb.getFood().getPrice());
                foodBind.setNum(1);
                r += foodBindService.add(foodBind);
            }
            // 改变reserve的状态

            reserve.setStatus(1);
            reserveService.updateStatus(reserve);
        }
    	return success();
    }
    
    
	
}
