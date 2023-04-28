package com.study.restaurant.controller;

import com.study.common.annotation.Log;
import com.study.common.config.Global;
import com.study.common.core.base.BaseController;
import com.study.common.core.domain.AjaxResult;
import com.study.common.core.page.TableDataInfo;
import com.study.common.enums.BusinessType;
import com.study.common.util.file.FileUploadUtils;
import com.study.restaurant.entity.Food;
import com.study.restaurant.service.FoodService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/restaurant/food")
public class FoodController extends BaseController {

    private static String prefix = "restaurant/food";

    @Autowired
    private FoodService foodService;

    @RequiresPermissions("rest:food:view")
    @GetMapping()
    public String index() {
        return prefix + "/food";
    }

    @RequiresPermissions("rest:food:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Food food) {
        startPage();
        List<Food> list = foodService.list(food);
        return getDataTable(list);
    }


    @RequiresPermissions("rest:food:remove")
    @Log(title = "菜品管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(foodService.deleteByIds(ids));
    }

    /**
     * 新增菜品
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存菜品
     */
    @RequiresPermissions("rest:food:add")
    @Log(title = "菜品管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated Food food) {
        return toAjax(foodService.add(food));
    }

    /**
     * 修改菜品
     */
    @GetMapping("/edit/{foodId}")
    public String edit(@PathVariable("foodId") Long foodId, ModelMap mmap) {
        mmap.put("food", foodService.getById(foodId));
        return prefix + "/edit";
    }

    /**
     * 修改保存菜品
     */
    @RequiresPermissions("rest:food:edit")
    @Log(title = "菜品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated Food food) {
        return toAjax(foodService.update(food));
    }

    /**
     * 上传照片
     * @param file
     * @return
     */
    @PostMapping("/uploadPhoto")
    @ResponseBody
    public AjaxResult uploadPhoto(@RequestParam("file") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String path = FileUploadUtils.upload(Global.getUploadPath(), file);
                Map<String, Object> map = new HashMap<>();
                map.put("path", path);
                return AjaxResult.success(map);
            }
            return error();
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }

    /**
     * 上下架菜品
     * @param food
     * @return
     */
    @RequiresPermissions("rest:food:edit")
    @Log(title = "菜品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(@Validated Food food) {
        return toAjax(foodService.update(food));
    }


}
