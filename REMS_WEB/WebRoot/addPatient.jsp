<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="scriptaculous/lib/prototype.js" type="text/javascript"></script>
<script src="scriptaculous/src/effects.js" type="text/javascript"></script>
<script type="text/javascript" src="javascript/validation.js"></script>
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

function validate_form(thisform){
	var username=document.getElementById("username");
	 var password=document.getElementById("password");
	 var name=document.getElementById("name");
	 var age=document.getElementById("age");
	 var sex=document.getElementById("sex");
	 var marry=document.getElementById("marry");
	 if(username.value==""){
		 alert("账号不能为空！");
		 username.focus();
		 return false;
	 }else if(password.value == ""){
		 alert("密码不能为空！");
		 password.focus();
		 return false;
	 }else if(name.value == ""){
		 alert("姓名不能为空！");
		 name.focus();
		 return false;
	 }else if(age.value == ""){
		 alert("年龄不能为空！");
		 age.focus();
		 return false;
	 }else if(sex.value == ""){
		 alert("性别不能为空！");
		 sex.focus();
		 return false;
	 }else if(marry.value == ""){
		 alert("婚姻状况不能为空！");
		 marry.focus();
		 return false;
	 }else{
		 return true;
	 }
}
</script>

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="test" action="patient.do?method=addPatient" onsubmit="return validate_form(this)"  method="post">
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">账   号:</label></div>
            <div class="field-widget"><input name="username" id="username" class="optional" /><font color="red">*</font></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="password" id="password" class="optional"/><font color="red">*</font></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>患者信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="name" id="name" class="optional"  /><font color="red">*</font></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age" class="optional" /><font color="red">*</font></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field6">性  别 :</label></div>
            <div class="field-widget">
                <select id="sex" name="sex" class="validate-selection"   >
                    <option value="">请选择...</option>
                    <option value="男">男</option>
					<option value="女">女</option>
                </select>
				<font color="red">*</font>
            </div>
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field6">婚姻状况 :</label></div>
            <div class="field-widget">
                <select id="marry" name="marry" class="validate-selection"  >
                    <option value="">请选择...</option>
                    <option value="未婚">未婚</option>
					<option value="已婚">已婚</option>
                </select>
				<font color="red">*</font>
            </div>
        </div>
           
        <div class="form-row">
            <div class="field-label"><label for="field5">籍  贯 :</label></div>
            <div class="field-widget"><input name="jg" id="jg" class="optional"  /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">职  业 :</label></div>
            <div class="field-widget"><input name="job" id="job" class="optional" /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">地址或单位 :</label></div>
            <div class="field-widget"><input name="address" id="address" class="optional" /></div>
        </div> 
      
      
    </fieldset>  
    <fieldset>
        <legend class="optional">患者情况</legend>
      
        <div class="form-row">
            <div class="field-label"><label for="field12">既 往 史 :</label></div>
            <div class="field-widget"><textarea name="jws" id="jws" class="optional"></textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">过 敏 史 :</label></div>
            <div class="field-widget"><textarea name="gms" id="gms" class="optional"></textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">病情症状 :</label></div>
            <div class="field-widget"><textarea  name="bqzz" id="bqzz" class="optional"></textarea></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field12">病情分析 :</label></div>
            <div class="field-widget"><textarea name="bqfx" id="bqfx" class="optional"></textarea></div>
        </div>
        
    </fieldset>
    	<input type="submit" class="submit" value="提     交" /> 
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