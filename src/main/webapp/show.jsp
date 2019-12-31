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
		
		$.post("queryType",function(data){
			
			var str = "";
			for(var i in data){
				str+="<option value='"+data[i].tid+"'>"+data[i].tname+"</option>";
			}
			
			$("#tid").append(str);
			$("#tid").val("${goods.type.tid}")
			
		},"json");
		
	})
</script>
</head>
<body>
	
	<form action="#">
		编号:<input type="text" name="id" value="${goods.id }"><br><br>
		名称:<input type="text" name="name" value="${goods.name }"><br><br>
		分类:<select id="tid" name="type.tid">
				<option>请选择分类</option>
			</select><br><br>
		价格:<input type="text" name="price" value="${goods.price }"><br><br>
		日期:<input type="text" value="${goods.datea }"><br><br>
	</form>
	
	
	
</body>
</html>