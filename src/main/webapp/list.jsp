<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$("#qx").toggle(function(){
			$("[name='id']").attr("checked",true);
		},function(){
			$("[name='id']").attr("checked",false);
		})
		
	})

</script>
<script type="text/javascript">
	function deleteAll(){
		var ids = $("[name='id']:checked").map(function(){
			return $(this).val();
		}).get().join(",");
		
		$.post("deleteGoods",{"ids":ids},function(data){
			if(data){
				alert("批删成功！");
				location.href="queryGoods";
			}
		},"json");
		
	}
</script>
</head>
<body>
	
	<form action="queryGoods" method="post">
		商品名称:<input type="text" name="name">
		<input type="submit" value="搜索">
	</form>
	
	<table>
		<tr>
			<td colspan="10">
				<a href="add.jsp"><input type="button" value="添加"></a>
				<input type="button" value="批删" onclick="deleteAll()">
			</td>
		</tr>
	
		<tr>
			<td>
				<input type="checkbox" id="qx">
			</td>
			<td>编号</td>
			<td>品牌</td>
			<td>分类</td>
			<td>发布时间</td>
			<td>操作</td>
		</tr>
		
	<c:forEach items="${page.list }" var="g">
		<tr>
			<td>
				<input type="checkbox" name="id" value="${g.id }">
			</td>
			<td>${g.id }</td>
			<td>${g.name }</td>
			<td>${g.type.tname }</td>
			<td>${g.datea }</td>
			<td>
				<a href="queryGoodsById?id=${g.id }"><input type="button" value="详情"></a>
				<input type="button" value="编辑">
			</td>
		</tr>
	</c:forEach>
		
	<tr>
		<td colspan="10">
			<a href="?pageNum=1">首页</a>
			<a href="?pageNum=${page.pageNum-1 < 1 ?page.pageNum:page.pageNum-1}">上一页</a>
			<a href="?pageNum=${page.pageNum+1 >page.pages ? page.pageNum:page.pageNum+1 }">下一页</a>
			<a href="?pageNum=${page.pages }">尾页</a>
			当前第${page.pageNum }页/${page.pages }页
		</td>
	</tr>
	</table>
	
</body>
</html>