function testjqueryList()
{
	var user_name=$("#test").attr("value");
	alert("参数test == " + user_name);

	$.ajax({
		type : "post",
		url : '<%=request.getContextPath()%>/student/jquery',
		dataType : 'json',
		cache : false,
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
			$("tbody").append(str);
		},
		error : function(error) {  
			alert("error == " + error );
		}
	});

}
