<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String errorMessage=(String)request.getAttribute("errorMessage");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>远程电子医疗诊断系统-登陆</title>
<link href="images/login.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id="wrap">
	<div id="header"><img src="images/1428906892_831341.png" /> </div>
    <div id="content-wrap">
    	<div class="space"> </div>
   	  <form action="login.do?method=doLogin" method="post"><div class="content">
        <div class="field"><label>账　户：</label><input class="username" name="username" type="text" /></div>
		<div class="field"><label>密　码：</label><input class="password" name="password" type="password" /><br /></div>
        <div class="field"><label>用户类型：</label><select name="userType" style="width:140px;height:25px;"><option value="doctor">医生用户</option><option value="patient">患者用户</option> </select><br />
		<%
            if(errorMessage!=null){  %>
            <font color="red">	<%=errorMessage %></font>
           <%  }
         %>

</div>
        <div class="btn"><input name="" type="submit" class="login-btn" value="" /></div>
         
      </div></form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>
