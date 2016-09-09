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
<title>结果页面</title>

<script type="text/javascript">
function loadXMLDoc() {
	
var xmlhttp;
if (window.XMLHttpRequest)  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }else  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  
xmlhttp.onreadystatechange=function()  {
	alert("参数3333 == " + xmlhttp.readyState + "    " + xmlhttp.status);
  if (xmlhttp.readyState==4 && xmlhttp.status==200)   {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
//xmlhttp.open("POST","http://localhost:8080/HNUST/student/test",true);
xmlhttp.open("POST","<%=request.getContextPath()%>/student/test",true);
xmlhttp.send();
}
</script>


<!-- 10秒定时刷新 -->
<!-- <meta http-equiv="refresh" content="10"> -->
</head>
<body>
	<div align="center">
		<h1>录入信息成功</h1>
		<form name="mainForm"
			action="<%=request.getContextPath()%>/student/disResult"
			method="post">
			<div>
				<input type="submit" id="btnPass" value="查询所有" />
			</div>
		</form>

		<h1>所有用户信息</h1>

		<button class="btn" name="btnGet" id="btnGet" onclick="loadXMLDoc();">
			<span class="icon icon-ok">&nbsp;</span>详情
		</button>
		<div id="myDiv"></div>

		<table>
			<tr>
				<td align="center">用户id</td>
				<td align="center">用户姓名</td>
				<td align="center">用户密码</td>
				<td align="center">用户密码</td>
			</tr>

			<c:forEach items="${resultList}" var="user" varStatus="vs">
				<tr>
					<td><s:property value="#vs.index+1" /></td>
					<td align="center">${user.id}</td>
					<td align="center">${user.userName}</td>
					<td align="center">${user.password}</td>
					<td align="center">${user.age}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>