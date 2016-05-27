<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message1=(String)request.getAttribute("message1");
String message2=(String)request.getAttribute("message2");
String url=(String)request.getAttribute("url");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<style type="text/css">
body {
	background:#FFF;
	text-align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script type="text/javascript">     
function countDown(secs,surl){     
 //alert(surl);     
 var jumpTo = document.getElementById('jumpTo');
 jumpTo.innerHTML=secs;  
 if(--secs>0){     
     setTimeout("countDown("+secs+",'"+surl+"')",1000);     
     }     
 else{       
     location.href=surl;     
     }     
 }  

function alertMsg(){
	alert("<%=message1%>");
	countDown(5,'<%=url%>');
}
</script> 
</head>

<body onload="alertMsg()">
   <div style="margin:50 auto; width:400px; height:50px; border:1px solid black">
  <%=message1 %>  <span id="jumpTo">5</span>秒后自动跳转到<%=message2 %>
   <div>

</body>
</html>