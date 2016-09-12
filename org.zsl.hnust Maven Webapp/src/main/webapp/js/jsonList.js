function testJs()
{
	alert("进入调用外部js 成功 ");
	
	
	return "1000";

//	$.ajax({
//		type : "post",
//		url : '<%=request.getContextPath()%>/student/jqueryList',
//		dataType : 'json',
//		cache : false,
//		async : false,
//		success : function(json) {
//			var msg = eval("("+json+")");  //如果接受的是文本格式 将接收的文本用解析成Json格式 
//
//			alert("json == " + msg );
//
//			var str = "";
//
//			for (i in msg) {
//				str += "<tr><td>" + msg[i].id + "</td><td>" + msg[i].name + "</td><td>" + msg[i].cla + "</td><td>" + msg[i].sex + "</td><td>" + msg[i].tel + "</td></tr>";
//			}
//			$("tbody").append(str);
//		},
//		error : function(error) {  
//			alert("error == " + error );
//		}
//	});

}
