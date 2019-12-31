package com.whd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.whd.bean.Goods;
import com.whd.bean.Type;

public interface GoodsMapper {
	public List<Goods> queryGoods(Map<String,Object> map);

	public List<Type> queryType();

	public void addGoods(Goods goods);

	public void deleteGoods(@Param("id")String ids);

	public Goods queryGoodsById(@Param("id")Integer id);
}
