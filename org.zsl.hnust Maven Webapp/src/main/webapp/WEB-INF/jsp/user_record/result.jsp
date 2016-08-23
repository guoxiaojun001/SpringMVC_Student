<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
</head>
<body>
	<div align="center">
		<h1>录入信息成功</h1>
		<form name="mainForm"
			action="<%=request.getContextPath()%>/student/dispalyAll" method="post">
			<div>
				<input type="submit" id="btnPass" value="查询所有" />
			</div>
		</form>
		
	</div>
</body>
</html>