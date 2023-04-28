package com.study.restaurant.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.study.restaurant.entity.DinnerTable;
import com.study.restaurant.service.DinnerTableService;

@Controller
@RequestMapping("/restaurant/dinnertable")
public class DinnerTableController extends BaseController{
	
    private static String prefix = "restaurant/dinnertable";

	@Autowired
	private DinnerTableService tableService;

	@RequiresPermissions("rest:dinnertable:view")
	@GetMapping()
	public String index() {
		return prefix + "/dinnertable";
	}

	@RequiresPermissions("rest:dinnertable:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(DinnerTable table) {
		startPage();
		List<DinnerTable> list = tableService.list(table);
		return getDataTable(list);
	}


	@RequiresPermissions("rest:dinnertable:remove")
	@Log(title = "餐桌管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(tableService.deleteByIds(ids));
	}

	/**
	 * 新增餐桌
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存餐桌
	 */
	@RequiresPermissions("rest:dinnertable:add")
	@Log(title = "餐桌管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated DinnerTable table) {
		return toAjax(tableService.add(table));
	}

	/**
	 * 修改餐桌
	 */
	@GetMapping("/edit/{tableId}")
	public String edit(@PathVariable("tableId") Long tableId, ModelMap mmap) {
		mmap.put("table", tableService.getById(tableId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存餐桌
	 */
	@RequiresPermissions("rest:dinnertable:edit")
	@Log(title = "餐桌管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated DinnerTable table) {
		return toAjax(tableService.update(table));
	}


	

}
