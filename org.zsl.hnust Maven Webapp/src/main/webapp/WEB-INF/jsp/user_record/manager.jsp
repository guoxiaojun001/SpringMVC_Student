<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
</head>

<!-- <script language="javascript">
function s(){
var d=document.form1.text1.value;
alert(d);
}
</script> -->

<body>

	<!-- <form action="target.jsp"> <input type=text name="usename" value="tom"></form> -->

	<h1>登录成功,欢迎来到学生系统管理页面</h1>

	<div id="main">
		<form name="mainForm"
			action="<%=request.getContextPath()%>/student/itemInsert"
			method="post">
			<input type="submit" id="item_record" value=" 信息录入 " />
		</form>
		
		<br>

		<form action="<%=request.getContextPath()%>/student/queryById"
			method="post">
			<input type=submit  name="item_querybyid" value="根据id查询">
		</form>

		<br>

		<form action="<%=request.getContextPath()%>/student/dispalyAll"
			method="post">
			<input type=submit name="item_queryall" value="查询所有">
		</form>

		<br>

		<form action="<%=request.getContextPath()%>/student/deleteById">
			<input type=submit name="item_deletebyid" value="根据id删除">
		</form>

		<br>
		
		<form action="<%=request.getContextPath()%>/student/updateById">
			<input type=submit name="item_updatebyid" value="根据id更新">
		</form>

	</div>
</body>
</html>