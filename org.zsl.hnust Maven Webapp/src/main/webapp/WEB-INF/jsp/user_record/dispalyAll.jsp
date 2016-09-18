<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript">
function myEffect(){  
	
    var tab=document.getElementById('mytab'); 
    
    var trs=tab.getElementsByTagName('tr'); 
    
    for(var i=0;i<trs.length;i++){
    	trs[i].onclick=doclick;
    }
    
    function doclick(){
    	var data = this;
    	var pathd = "<%=request.getContextPath()%>"  +"/student/detail/"+ data.cells[0].innerText;
    	alert(this.innerHTML + " == " +  pathd);
    	window.location.href = pathd;
    	}
    
}
</script>



<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有用户信息</title>
</head>
<body
	onload="myEffect()">
	<div align="center">
		<h1>所有用户信息</h1>
		<table id="mytab" border="1">
			<tr>
				<td align="center">用户id</td>
				<td align="center">用户姓名</td>
				<td align="center">用户密码</td>
				<td align="center">用户密码</td>
				<!-- 自定义标签 -->
			</tr>

			<c:forEach items="${userList}" var="user" varStatus="vs">
				<tr>
					<!-- <td><s:property value="#vs.index+1" /></td> -->
					<td align="center" fid="${user.id}">${user.id}</td>
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