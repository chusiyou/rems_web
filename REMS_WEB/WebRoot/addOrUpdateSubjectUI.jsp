<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.Subject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Subject subject=(Subject)request.getAttribute("Subject");
String operator=(String)request.getAttribute("operator");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="scriptaculous/lib/prototype.js" type="text/javascript"></script>
<script src="scriptaculous/src/effects.js" type="text/javascript"></script>
<script type="text/javascript" src="javascript/validation.js"></script>
<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background:#E6F4FA;
}
</style>
<script type="text/javascript">
//<![CDATA[
<!--
// Alternative Style: Working With Alternate Style Sheets
// http://www.alistapart.com/articles/alternate/
function setActiveStyleSheet(title) {
var i, a, main;
for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
a.disabled = true;
if(a.getAttribute("title") == title) a.disabled = false;
}
}
}
//-->
//]]>


   function ajaxUpdate(){

	var operator=document.getElementById('operator').value;
	 var urlStr="";
	 if(operator =="add"){
		 urlStr="subject.do?method=addSubject";
	 }else if(operator =="update"){
		 urlStr="subject.do?method=updateSubject";
	}
	   $.ajax({
           //提交数据的类型 POST GET
           type:"POST",
           //提交的网址
           url:urlStr,
           //提交的数据
           data:$('#form1').serialize(),
           //返回数据的格式
           datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
           //成功返回之后调用的函数             
           success:function(data){
    
          	parent.document.getElementById('webox').style.display='none'; 
          	parent.document.getElementById('background').style.display='none'; 
        	   //$('.webox').css({display:'none'});
			   //$('.background').css({display:'none'});   
			   parent.document.location.reload();   
           } ,
           //调用出错执行的函数
           error: function(){
               //请求出错处理
           }         
        });
	}

</script>

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="form1" action="subject.do?method=addPatient" method="post">
     <input  type="hidden"  id="subjectId" name="subjectId" value="${subject.id}" />
	 <input  type="hidden"  id="operator" name="operator" value="<%=operator %>" />
    <fieldset>
        <legend>科目信息</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">科目代码 :</label></div>
            <div class="field-widget"><input name="subjectCode" id="subjectCode" value="${subject.subjectCode}" class="optional" /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">科目名称:</label></div>
            <div class="field-widget"><input id="subjectName" name="subjectName" value="${subject.subjectName}" class="optional"/></div>
        </div>
        
        
    </fieldset>


		<% if(operator!=null && operator.equals("update")){ %>
				<input type="button" class="submit" onclick="ajaxUpdate()" value="修     改" /> 
		<% } %>
    	<% if(operator!=null && operator.equals("add")){ %>
				<input type="button" class="submit" onclick="ajaxUpdate()" value="增      加 " /> 
		<% } %>

    </form>
    </div>
    <script type="text/javascript">
        function formCallback(result, form) {
            window.status = "valiation callback for form '" + form.id + "': result = " + result;
        }
        
        var valid = new Validation('test', {immediate : true, onFormValidate : formCallback});
        Validation.addAllThese([
            ['validate-password', '> 6 characters', {
                minLength : 7,
                notOneOf : ['password','PASSWORD','1234567','0123456'],
                notEqualToField : 'field1'
            }],
            ['validate-password-confirm', 'please try again.', {
                equalToField : 'field8'
            }]
        ]);
    </script>

</body>
</html>