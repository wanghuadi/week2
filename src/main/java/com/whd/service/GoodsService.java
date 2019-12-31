package com.whd.service;

import java.util.List;
import java.util.Map;

import com.whd.bean.Goods;
import com.whd.bean.Type;

public interface GoodsService {
	public List<Goods> queryGoods(Map<String,Object> map);

	public List<Type> queryType();

	public void addGoods(Goods goods);

	public void deleteGoods(String ids);

	public Goods queryGoodsById(Integer id);
}
