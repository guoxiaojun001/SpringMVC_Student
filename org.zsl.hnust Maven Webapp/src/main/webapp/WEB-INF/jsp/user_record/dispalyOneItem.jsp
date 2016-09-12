<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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


<!-- jquery引入路径解释：jquery/jquery-3.0.0.min.js以当前页面test.jsp为坐标在当前文件夹中查找，
由于test.jsp和jquery文件夹都在webroot目录下所以不需要 -->
<script src="<%=request.getContextPath()%>/jquery/jquery-3.0.0.min.js">
</script>

<%-- <script type="text/javascript" src="<%=basePath%>/jquery/jquery-3.0.0.min.js"> </script> --%>

<script type="text/javascript">
   function testjquery()
   {
	   alert("参数testjquery");
    var user_name=$("#test").attr("value");
    alert("参数testjquery == " + user_name);
    }
  </script>

<body>
	<input id="test" value="jquery">
	<input type="button" value="click me!" onclick="testjquery();">


	<div align="center">
		<h1>查询结果</h1>

		<c:out value="${userItem.id}" />
		<c:out value="${userItem.userName}" />
		<c:out value="${userItem.password}" />
		<c:out value="${userItem.age}" />

	</div>


</body>
</html>