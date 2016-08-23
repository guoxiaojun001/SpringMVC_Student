<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据更新页面</title>

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

	<h1>数据更新结果：</h1>

	<div id="main">
			<form name="mainForm"
				action="<%=request.getContextPath()%>/student/updateItem"	method="post">
				<div>
					<span>用户id:</span><input type="text" id="user_id" name="user_id">
				</div>
				
				<div>
					<span>用户名:</span><input type="text" id="user_name" name="user_name">
				</div>
				
				<div>
					<span>用户密码:</span><input type="text" id="password" name="password">
				</div>

				<div>
					<span>用户年龄:</span><input type="text" id="age" name="age">
				</div>

				<div>
					<input type="submit" id="btnPass" value="更新数据" />
				</div>
			</form>
	</div>
</body>
</html>