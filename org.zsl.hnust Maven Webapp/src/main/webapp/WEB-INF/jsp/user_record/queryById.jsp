<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息查询页面</title>

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

	<h1>请输入id 来查询用户信息</h1>

	<div id="main">
			<form name="mainForm"
				action="<%=request.getContextPath()%>/student/dispalyOneItem"	method="post">
				<div>
					<span>用户id:</span><input type="text" id="user_id" name="user_id">
				</div>

				<div>
					<input type="submit" id="btnPass" value="查询" />
				</div>
			</form>
	</div>
</body>
</html>