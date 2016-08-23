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

	<h1>开始录入信息</h1>

	<div id="main">
		<div class="newcontainer" id="user_record">
			<form name="mainForm"
				action="<%=request.getContextPath()%>/student/saveItem" method="post">
				<div>
					<span>用户名称:</span><input type="text" id="user_name"
						name="user_name">
				</div>
				<div>
					<span>用户密码:</span><input type="text" id="password" name="password">
				</div>

				<div>
					<span>用户年龄:</span><input type="text" id="age" name="age">
				</div>

				<div>
					<input type="submit" id="btnPass" value="保存" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>