<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询单条数据</title>
</head>
<body>
	<div align="center">
		<h1>查询结果</h1>

		<c:out value="${userItem.id}" />
		<c:out value="${userItem.userName}" />
		<c:out value="${userItem.password}" />
		<c:out value="${userItem.age}" />


	</div>
	
	
</body>
</html>