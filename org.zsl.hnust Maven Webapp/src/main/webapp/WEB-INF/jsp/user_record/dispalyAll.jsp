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
<title>查询所有用户信息</title>
</head>
<body>
	<div align="center">
		<h1>所有用户信息</h1>

		<table>

			<tr>
				<td align="center">用户id</td>
				<td align="center">用户姓名</td>
				<td align="center">用户密码</td>
				<td align="center">用户密码</td>
				<!-- 自定义标签 -->
			</tr>

			<c:forEach items="${userList}" var="user" varStatus="vs">
				<tr>
					<td><s:property value="#vs.index+1" /></td>
					<td align="center">${user.id}</td>
					<td align="center">${user.userName}</td>
					<td align="center">${user.password}</td>
					<td align="center">${user.age}</td>
					<!-- 自定义标签 -->
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>