<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.PatientVO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
PatientVO vo=(PatientVO)request.getAttribute("patientVO");
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
	   $.ajax({
           //提交数据的类型 POST GET
           type:"POST",
           //提交的网址
           url:"patient.do?method=updatePatient",
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
    <form id="form1" action="patient.do?method=addPatient" method="post">
     <input  type="hidden"  id="userid" name="userid" value="${patientVO.userid}" />
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">帐  号:</label></div>
            <div class="field-widget"><input name="username" id="username" value="${patientVO.username}" class="optional" /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="password" value="${patientVO.password}" id="password" class="optional"/></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>患者信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="name" id="name" value="${patientVO.name}" class="optional"  /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age" value="${patientVO.age}" class="optional" /></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field6">性  别 :</label></div>
            <div class="field-widget">
                <select id="sex" name="sex" class="validate-selection" >
                    <% if(vo.getSex()==null){  %>
                    		<option selected = "selected" value="">请选择...</option>
							<option value="男">男</option>
							<option value="女">女</option>
                    <% }else if("男".equals(vo.getSex())){%>
                    		<option value="">请选择...</option>
							<option value="男" selected = "selected">男</option>
							<option value="女">女</option>
                    
					<% }else if("女".equals(vo.getSex())){%>
                    		<option value="">请选择...</option>
							<option value="男" >男</option>
							<option value="女" selected = "selected">女</option>
                    <%} %>
                    
                </select>
            </div>
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field6">婚姻状况 :</label></div>
            <div class="field-widget">
                <select id="marry" name="marry" class="validate-selection"  >
					<% if(vo.getMarry()==null){  %>
                    		<option selected = "selected" value="">请选择...</option>
                    		<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
                    <% }else if("未婚".equals(vo.getMarry())){%>
                    		<option value="">请选择...</option>
                    		<option value="未婚" selected = "selected">未婚</option>
							<option value="已婚">已婚</option>
                    
					<% }else if("已婚".equals(vo.getMarry())){%>
                    		<option value="">请选择...</option>
                    		<option value="未婚" >未婚</option>
							<option value="已婚" selected = "selected">已婚</option>
                    <%} %>
                </select>
            </div>
        </div>
           
        <div class="form-row">
            <div class="field-label"><label for="field5">籍  贯 :</label></div>
            <div class="field-widget"><input name="jg" id="jg" class="optional" value="${patientVO.jg}"   /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">职  业 :</label></div>
            <div class="field-widget"><input name="job" id="job" class="optional"  value="${patientVO.job}" /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">地址或单位 :</label></div>
            <div class="field-widget"><input name="address" id="address" class="optional" value="${patientVO.address}" /></div>
        </div> 
      
      
    </fieldset>  
    <fieldset>
        <legend class="optional">患者情况</legend>
      
        <div class="form-row">
            <div class="field-label"><label for="field12">既 往 史 :</label></div>
            <div class="field-widget"><textarea name="jws" id="jws" class="optional" >${patientVO.jws}</textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">过 敏 史 :</label></div>
            <div class="field-widget"><textarea name="gms" id="gms" class="optional" >${patientVO.gms}</textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">病情症状 :</label></div>
            <div class="field-widget"><textarea  name="bqzz" id="bqzz" class="optional">${patientVO.bqzz}</textarea></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field12">病情分析 :</label></div>
            <div class="field-widget"><textarea name="bqfx" id="bqfx" class="optional" >${patientVO.bqfx}</textarea></div>
        </div>
        
    </fieldset>
		<% if(operator!=null && operator.equals("update")){ %>
				<input type="button" class="submit" onclick="ajaxUpdate()" value="提     交" /> 
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