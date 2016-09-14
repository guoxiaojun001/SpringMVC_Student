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
	href="<%=request.getContextPath()%>/css/main.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询单条数据</title>
</head>


<!-- jquery引入路径解释：jquery/jquery-3.0.0.min.js以当前页面test.jsp为坐标在当前文件夹中查找，
由于test.jsp和jquery文件夹都在webroot目录下所以不需要 -->
<script src="<%=request.getContextPath()%>/jquery/jquery-3.0.0.min.js">
</script>


<script type="text/javascript">
   function testjquery()
   {
    var user_name=$("#test").attr("value");
    alert("参数test == " + user_name);
    
    $.ajax({
        type : "post",
        url : '<%=request.getContextPath()%>/student/jquery',
        dataType : 'json',
        cache : false,
        async : true,
        success : function(json) {
        	//var objJson = msg.responseText.evalJSON(); //此方法不行 
        	//var aToStr=JSON.stringify(json); //次方法不行
        	var aToStr = eval("("+json+")");  //如果接受的是文本格式 将接收的文本用解析成Json格式 
        	
        	alert("json == " + aToStr );
        	   var str = "";
                   str += "<tr><td>" + aToStr.name + "</td><td>" + aToStr.url + "</td><td>" + aToStr.page + "</td><td>" 
                   + aToStr.isNonProfit + "</td><td>" + aToStr.address.street + "</td></tr>";
               //$("tbody").append(str);
               $("#tt1").append(str);
        },
        error : function(error) {  
        	alert("error == " + error );
        }
    });
    
    }
  </script>

<body>

	<div align="center">
		<h1>查询结果</h1>

		<c:out value="${userItem.id}" />
		<c:out value="${userItem.userName}" />
		<c:out value="${userItem.password}" />
		<c:out value="${userItem.age}" />

	</div>


<div align="center">
<table>

	<h1>单一json对象</h1>
    <thead>
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>班别</td>
            <td>性别</td>
            <td>电话</td>
        </tr>
    </thead>
    <tbody id = "tt1"></tbody>
</table>

<input id="test" value="jquery">
<input type="button" value="click me!" onclick="testjquery();">

</div>


<script src="<%=request.getContextPath()%>/js/jsonList.js">
</script> 


<script type="text/javascript">
function testjqueryList()
{
	var user_name=$("#testList").attr("value");
	alert("参数test == " + user_name);

	$.ajax({
		type : "post",
		url : '<%=request.getContextPath()%>/student/jqueryList',
		dataType : 'json',
		cache : true,
		async : false,
		success : function(json) {
			//var objJson = msg.responseText.evalJSON(); //此方法不行 
			//var aToStr=JSON.stringify(json); //次方法不行
			var msg = eval("("+json+")");  //如果接受的是文本格式 将接收的文本用解析成Json格式 

			alert("json == " + msg );

			var str = "";

			for (i in msg) {
				str += "<tr><td>" + msg[i].id + "</td><td>" + msg[i].name + "</td><td>" + msg[i].cla + "</td><td>" + msg[i].sex + "</td><td>" + msg[i].tel + "</td></tr>";
			}
			//$("tbody").append(str);
			$(".demo22").append(str);
		},
		error : function(error) {  
			alert("error == " + error );
		}
	});

}
</script>



<div align="center">
<table>

	<h1>json数组</h1>
    <thead>
        <tr>
            <td>公司</td>
            <td>地址</td>
            <td>班别</td>
            <td>性别</td>
            <td>电话</td>
        </tr>
    </thead>
    <tbody class = "demo22"></tbody>
</table>

<input id="testList" value="jquery2">
<input type="button" value="获取列表" onclick="testjqueryList();">

</div>



<input type="button" value="测试调用外部js" onclick="testJs();" align="center">



</body>
</html>