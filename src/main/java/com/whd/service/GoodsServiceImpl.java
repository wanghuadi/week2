package com.whd.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whd.bean.Goods;
import com.whd.bean.Type;
import com.whd.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Resource
	private GoodsMapper goodsMapper;
	
	public List<Goods> queryGoods(Map<String, Object> map) {
		return goodsMapper.queryGoods(map);
	}

	public List<Type> queryType() {
		return goodsMapper.queryType();
	}

	public void addGoods(Goods goods) {
		goodsMapper.addGoods(goods);
	}

	public void deleteGoods(String ids) {
		goodsMapper.deleteGoods(ids);
	}

	public Goods queryGoodsById(Integer id) {
		return goodsMapper.queryGoodsById(id);
	}

}
