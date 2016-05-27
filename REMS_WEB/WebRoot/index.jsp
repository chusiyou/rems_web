<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.DoctorVO" %>
<%@ page import="com.rems.vo.PatientVO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userType=(String)request.getSession().getAttribute("userType");
DoctorVO doctorVO=null;
PatientVO patientVO=null;
String mainUrl="";
if("doctor".equals(userType)){
	doctorVO =(DoctorVO)request.getSession().getAttribute("doctorVO");
	mainUrl="question.do?method=questionListUI";
}else if("patient".equals(userType)){
	patientVO =(PatientVO)request.getSession().getAttribute("patientVO");
	mainUrl="question.do?method=questionAddUI";
	
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>远程电子医疗诊断系统-首页</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="javascript/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//setMenuHeight
	$('.menu').height($(window).height()-51-27-26);
	$('.sidebar').height($(window).height()-51-27-26);
	$('.page').height($(window).height()-51-27-26);
	$('.page iframe').width($(window).width()-15-168);
	
	//menu on and off
	$('.btn').click(function(){
		$('.menu').toggle();
		
		if($(".menu").is(":hidden")){
			$('.page iframe').width($(window).width()-15+5);
			}else{
			$('.page iframe').width($(window).width()-15-168);
				}
		});
		
	//
	$('.subMenu a[href="#"]').click(function(){
		$(this).next('ul').toggle();
		return false;
		});
})
</script>


</head>

<body>
<div id="wrap">
	<div id="header">
    <div class="logo fleft">
    <img src="images/1428906955_674322.png" style="height:60px;margin-left:20px"/>
	</div>
    <a class="logout fright" href="login.do?method=logout" alt="注销退出"> </a>
    
    <div class="clear"></div>
    <div class="subnav">
    	<div class="subnavLeft fleft"></div>
        <div class="fleft"><font style="font-weight:bold;">${sessionScope.doctorVO==null ? "尊敬的患者" : "尊敬的医生"},${sessionScope.doctorVO==null ? sessionScope.patientVO.name : sessionScope.doctorVO.username}</font>,欢迎您！</div>
        <div class="subnavRight fright"></div>
    </div>
    </div><!--#header -->
    <div id="content">
    <div class="space"></div>
    <div class="menu fleft">
    	<ul>
        	<li class="subMenuTitle">电子医疗诊断系统</li>
            
            <li class="subMenu"><a href="#" target="right">用户模块</a>
			   <ul>
                	<li><a href="patient.do?method=patientListView" target="right">患者查询</a></li>
                    <li><a href="doctor.do?method=doctorListView" target="right">医生查询</a></li>
					<li><a href="question.do?method=questionListUI" target="right">问题列表</a></li>
					<%  if(patientVO!=null){   %>
							<li><a href="question.do?method=questionAddUI" target="right">患者提问</a></li>
					<%  } %>
					
                </ul>
            </li>

			<li class="subMenu"><a href="#" target="right">管理模块</a>
			   <ul>
					<li><a href="patient.do?method=addPatientUI" target="right">患者增加</a></li>
                    <li><a href="doctor.do?method=addDoctorUI" target="right">医生增加</a></li>
					<!-- <li><a href="testJsp.jsp" target="right">测试页面</a></li> -->
					<li><a href="subject.do?method=subjectUI" target="right">科目管理</a></li>
                </ul>
            </li>

        </ul>
    </div>
    <div class="sidebar fleft"><div class="btn"></div></div>
    <div class="page">
    <iframe width="100%" scrolling="auto"  height="100%" frameborder="false" allowtransparency="true" style="border: medium none;" src="<%=mainUrl %>" id="rightMain" name="right"></iframe>
    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer"></div><!--#footer -->
</div><!--#wrap -->
</body>
</html>
