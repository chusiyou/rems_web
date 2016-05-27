<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.Subject" %>
<%@ page import="com.rems.vo.DoctorVO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List subList=(List)request.getAttribute("subList");
DoctorVO vo=(DoctorVO)request.getAttribute("doctorVO");
String operator=(String)request.getAttribute("operator");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript" src="javascript/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="javascript/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="javascript/jquery.form.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background:#E6F4FA;
}
</style>


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


function ajaxUpdate(){
	$("#form1").ajaxSubmit({
	     type: "post",
	     dataType: "json",
	     success: function(result){
		parent.document.getElementById('webox').style.display='none'; 
       	parent.document.getElementById('background').style.display='none'; 
     	   //$('.webox').css({display:'none'});
			   //$('.background').css({display:'none'});   
			   parent.document.location.reload();   
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
    <form id="form1" name="form1" action="doctor.do?method=updateDoctor" method="post" enctype="multipart/form-data">
     <input  type="hidden"  id="userid" name="userid" value="${doctorVO.userid}" />
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">帐  号:</label></div>
            <div class="field-widget"><input name="sysname" id="sysname" class="optional"  value="${doctorVO.sysname }"/></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="syspass" name="syspass" id="syspass" value="${doctorVO.syspass }" class="optional"/></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>医生信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="username" id="username" value="${doctorVO.username }" class="optional"  /></div>
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field5">身份证号 :</label></div>
            <div class="field-widget"><input name="num" id="num" value="${doctorVO.num }" class="optional" /></div>
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">联系电话:</label></div>
            <div class="field-widget"><input name="cel" id="cel"  value="${doctorVO.cel }" class="optional" /></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field5">电子邮箱:</label></div>
            <div class="field-widget"><input name="mail" id="mail"  value="${doctorVO.mail }"  class="optional" /></div>
        </div>

        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age"  value="${doctorVO.age }"  class="optional" /></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field6">性  别 :</label></div>
            <div class="field-widget">
                <select id="sex" name="sex" class="validate-selection"   >
                    <% if(vo.getSex()==null || "".equals(vo.getSex())){  %>
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
            <div class="field-label"><label for="field5">民  族:</label></div>
            <div class="field-widget"><input name="mz" id="mz" value="${doctorVO.mz }" class="optional"  /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field6">婚姻状况 :</label></div>
            <div class="field-widget">
                <select id="marry" name="marry" class="validate-selection"  >
                   <% if(vo.getMarry()==null || "".equals(vo.getSex())){  %>
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
            <div class="field-label"><label for="field6">所属科室 :</label></div>
            <div class="field-widget">
                <select id="pro" name="pro" class="validate-selection"  >
                    
                    <%   if(subList!=null && subList.size()>0){
                    	      for(int i=0;i<subList.size();i++){
                    	    	  Subject sj=(Subject)subList.get(i);
                    	    	    if(vo.getPro().equals(sj.getId().toString())){  %>
                    	    	    	<option value="<%=sj.getId() %>" selected = "selected"><%=sj.getSubjectName() %></option>
                    	    	   <% }else{ %>
                    	    	    	<option value="<%=sj.getId() %>"><%=sj.getSubjectName() %></option>
                    	    <%   }
                    	      }
                    	
                    }  %>
                </select>
            </div>
        </div>
        
		<div class="form-row">
            <div class="field-label"><label for="field5">所属医院:</label></div>
            <div class="field-widget"><input name="col" id="col" value="${doctorVO.col }" class="optional"  /></div>
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
            <div class="field-widget"><input name="rynf" id="rynf" value="${doctorVO.rynf }"  class="optional"  /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">出生日期 :</label></div>
            <div class="field-widget"><input name="birth" id="birth" value="${doctorVO.birth }" class="optional" /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭地址 :</label></div>
            <div class="field-widget"><input name="addr" id="addr" value="${doctorVO.addr }" class="optional" /></div>
        </div> 
    </fieldset>  
      <fieldset>
        <legend class="optional">图片上传</legend>

		<div class="form-row">
            <div class="field-label"><label for="field5">医生照片 :</label></div>
            <div class="field-widget">
					<% if(operator!=null && operator.equals("update")){ %>
				<input type="file" name="doc" id="doc" value="浏览..." onchange="javascript:setImagePreview();" /> 
				<% } %>
   					
				</div>
            <div class="field-widget">
		<div id="localImag">
			<img id="preview"   src="photo/${doctorVO.userimage }"/></div> 
            </div>
        </div> 
  	 </fieldset>
      

		<% if(operator!=null && operator.equals("update")){ %>
				<input type="button" class="submit" onclick="ajaxUpdate()" value="提     交" /> 
		<% } %>
    </form>
    </div>
   
</body>
</html>