<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.Subject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List subList=(List)request.getAttribute("subList");
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
</script>

<script> 
function setImagePreview() { 
var docObj=document.getElementById("doc"); 
var imgObjPreview=document.getElementById("preview"); 
if(docObj.files && docObj.files[0]){ 
//火狐下，直接设img属性 
imgObjPreview.style.display = 'block'; 
//imgObjPreview.style.width = '300px'; 
//imgObjPreview.style.height = '220px'; 
//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
}else{ 
//IE下，使用滤镜 
docObj.select(); 
var imgSrc = document.selection.createRange().text; 
var localImagId = document.getElementById("localImag"); 
//必须设置初始大小 
localImagId.style.width = "500px"; 
localImagId.style.height = "500px"; 
//图片异常的捕捉，防止用户修改后缀来伪造图片 
try{ 
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
}catch(e){ 
alert("您上传的图片格式不正确，请重新选择!"); 
return false; 
} 
imgObjPreview.style.display = 'none'; 
document.selection.empty(); 
} 
return true; 
} 


 function validate_form(thisform){
	 var sysname=document.getElementById("sysname");
	 var syspass=document.getElementById("syspass");
	 var username=document.getElementById("username");
	 var num=document.getElementById("num");
	 var cel=document.getElementById("cel");
	 var mail=document.getElementById("mail");
	 var age=document.getElementById("age");
	 var sex=document.getElementById("sex");
	 var mz=document.getElementById("mz");
	 var marry=document.getElementById("marry");
	 var pro=document.getElementById("pro");
	 if(sysname.value==""){
		 alert("账号不能为空！");
		 sysname.focus();
		 return false;
	 }else if(syspass.value == ""){
		 alert("密码不能为空！");
		 syspass.focus();
		 return false;
	 }else if(username.value == ""){
		 alert("姓名不能为空！");
		 username.focus();
		 return false;
	 }else if(num.value == ""){
		 alert("身份证号不能为空！");
		 num.focus();
		 return false;
	 }else if(cel.value == ""){
		 alert("联系电话不能为空！");
		 cel.focus();
		 return false;
	 }else if(mail.value == ""){
		 alert("邮箱不能为空！");
		 mail.focus();
		 return false;
	 }else if(age.value == ""){
		 alert("年龄不能为空！");
		 age.focus();
		 return false;
	 }else if(sex.value == ""){
		 alert("性别不能为空！");
		 sex.focus();
		 return false;
	 }else if(mz.value == ""){
		 alert("民族不能为空！");
		 mz.focus();
		 return false;
	 }else if(marry.value == ""){
		 alert("婚姻状况不能为空！");
		 marry.focus();
		 return false;
	 }else if(pro.value == ""){
		 alert("科室不能为空！");
		 pro.focus();
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
    <form id="test" action="doctor.do?method=addDoctor" onsubmit="return validate_form(this)"  method="post" enctype="multipart/form-data">
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">账  号:</label></div>
            <div class="field-widget"><input name="sysname" id="sysname" class="optional" /><font color="red">*</font></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="syspass" id="syspass" class="optional"/><font color="red">*</font></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>医生信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="username" id="username" class="optional"  /><font color="red">*</font></div>
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field5">身份证号 :</label></div>
            <div class="field-widget"><input name="num" id="num" class="optional" /><font color="red">*</font></div>
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">联系电话:</label></div>
            <div class="field-widget"><input name="cel" id="cel" class="optional" /><font color="red">*</font></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field5">电子邮箱:</label></div>
            <div class="field-widget"><input name="mail" id="mail" class="optional" /><font color="red">*</font></div>
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
            <div class="field-label"><label for="field5">民  族:</label></div>
            <div class="field-widget">
			<select id="mz" name="mz" class="validate-selection"  >
                    <option value="">请选择...</option>
                    <option value="汉族">汉族</option>
					<option value="回族">回族</option>
					<option value="壮族">壮族</option>
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
            <div class="field-label"><label for="field6">所属科室 :</label></div>
            <div class="field-widget">
                <select id="pro" name="pro" class="validate-selection"  >
                    <option value="">请选择...</option>
                    <%   if(subList!=null && subList.size()>0){
                    	      for(int i=0;i<subList.size();i++){
                    	    	  Subject sj=(Subject)subList.get(i);%>
	
									<option value="<%=sj.getId() %>"><%=sj.getSubjectName() %></option>
                    	    	  
                    	    <%   }
                    	
                    }  %>
                </select>
			<font color="red">*</font>
            </div>
        </div>
        
		<div class="form-row">
            <div class="field-label"><label for="field5">所属医院:</label></div>
            <div class="field-widget"><input name="col" id="col" class="optional"  /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field6">编制状态 :</label></div>
            <div class="field-widget">
                <select id="bzzt" name="bzzt" class="validate-selection"  >
                    <option>请选择...</option>
                    <option value="正式编制">正式编制</option>
					<option value="实习编制">实习编制</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field5">入院年份:</label></div>
            <div class="field-widget"><input name="rynf" id="rynf" class="optional"  /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">出生日期 :</label></div>
            <div class="field-widget"><input name="birth" id="birth" class="optional" /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭地址 :</label></div>
            <div class="field-widget"><input name="addr" id="addr" class="optional" /></div>
        </div> 
    </fieldset>  
      <fieldset>
        <legend class="optional">图片上传</legend>

		<div class="form-row">
            <div class="field-label"><label for="field5">医生照片 :</label></div>
            <div class="field-widget"><input type="file" name="doc" id="doc" value="浏览..." onchange="javascript:setImagePreview();" /> </div>
            <div class="field-widget">
		<div id="localImag"><img id="preview" width=-1 height=-1 style="diplay:none" /></div> 
            </div>
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