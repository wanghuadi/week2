package com.whd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whd.bean.Goods;
import com.whd.bean.Type;
import com.whd.service.GoodsService;

@Controller
public class GoodsController {
	
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("queryGoods")
	public String query(Model model,@RequestParam(defaultValue="1")Integer pageNum,String name){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name",name);
		PageHelper.startPage(pageNum, 2);
		List<Goods> list = goodsService.queryGoods(map );
		PageInfo<Goods> page = new PageInfo<Goods>(list);
		model.addAttribute("page", page);
		return "list";
	}
	
	@RequestMapping("queryType")
	@ResponseBody
	public List<Type> queryType(){
		List<Type> list = goodsService.queryType();
		return list;
	}
	
	
	@RequestMapping("deleteGoods")
	@ResponseBody
	public boolean deleteGoods(String ids){
		
		try {
			goodsService.deleteGoods(ids);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping("queryGoodsById")
	public String queryGoodsById(Integer id,Model model){
		Goods goods = goodsService.queryGoodsById(id);
		model.addAttribute("goods",goods);
		return "show";
	}
	
	@RequestMapping("addGoods")
	@ResponseBody
	public boolean addGoods(Goods goods){
		try {
			/*Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(date);
			goods.setDatea(format);*/
			goods.setStatus(0);
			goodsService.addGoods(goods);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
