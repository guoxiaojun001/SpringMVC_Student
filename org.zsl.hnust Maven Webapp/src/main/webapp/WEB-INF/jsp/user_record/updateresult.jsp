<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息录入页面</title>

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

	<h1>数据更新</h1>
	
	<h2> 更新前的数据 </h2>
	<br>
	<h3> ${before.id} ${before.userName} ${before.password} ${before.age}</h3>
	
	<p>
	
	<h2> 更新后的数据 </h2>
	<br>
	<h3> ${after.id} ${after.userName} ${after.password} ${after.age}</h3>
	
</body>
</html>