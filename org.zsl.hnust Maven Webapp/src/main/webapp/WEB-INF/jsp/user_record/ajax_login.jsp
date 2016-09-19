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

<script src="<%=request.getContextPath()%>/jquery/jquery-3.0.0.min.js">
</script>

<script type="text/javascript">			
				
function ajaxLogin()
{
    alert("参数user_name = " );
	
	 $.ajax({
	    type : "post",
	    url : '<%=request.getContextPath()%>/student/loginAjax',
		dataType : 'json',
		data : $('#ffid').serialize(),
		cache : false,
		async : true,
		success : function(data) {
			var result = data;
			if(result == 1){
				var pathd = "<%=request.getContextPath()%>"  +"/student/ajaxSuccess/";
		    	window.location.href = pathd;
			}
			alert("aToStr == " + data);
		},
		error : function(error) {
			alert("error == " + error);
		}
	});
}
</script>

<body>
	<h1>登录页面</h1>

	<div id="main">
		<span>用户名称:</span><input type="text" id="user_name" name="user_name">
		<span>用户密码:</span><input type="text" id="password" name="password">

		<input type="button" id="btnPass" value="登录" onclick="ajaxLogin();">
	</div>
</body>
</html>