<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.DoctorVO" %>
<%@ page import="com.rems.vo.PatientVO" %>
<%@ page import="com.rems.vo.Question" %>
<%@ page import="com.rems.vo.Answer" %>
<%@ page import="com.rems.vo.Subject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
DoctorVO doctorVO=(DoctorVO)request.getAttribute("doctorVO");
PatientVO patientVO=(PatientVO)request.getAttribute("patientVO");
Question question=(Question)request.getAttribute("question");
Answer answer=(Answer)request.getAttribute("answer");
Map subMap=(Map)request.getAttribute("subMap");
Subject subject=(Subject)request.getAttribute("subject");
Integer doctorAnsCount=(Integer)request.getAttribute("doctorAnsCount");

PatientVO patientVOSession =(PatientVO)request.getSession().getAttribute("patientVO");

%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="css/a_new.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/common_login_v2.css" />
<link href="css/club_new.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="bookmark" type="image/x-icon" href="favicon.ico">

<style type="text/css">
.col99{ color:#999;}
.clubAskTop{ height:106px; border-bottom:1px solid #3cb3c0;}
.clubAskLogo{ margin-top:36px; width:181px; height:45px;}
.clubFtxt{ width:693px; height:30px; margin-top:45px;font-family:"微软雅黑"; font-size:28px; color:#666; font-style:italic;letter-spacing:1px;}
.clubAskLeft{ background:#f8f8f8; width:667px;}
.AskOne{ height:43px; font-family:"微软雅黑"; background:url(images/askIrea1.gif) repeat-x center center; margin-right:46px;}
.AskOne h1{ background:url(images/askIcon.gif) no-repeat; width:48px; height:43px; color:#fff; font-size:24px; text-align:center; position:absolute;
left:-11px; top:0px;}
.AskOne h2{ color:#3cb3c0; font-size:18px; padding-left:44px; line-height:38px; background:#f8f8f8; padding-right:8px;}
.lh25{ height:25px; line-height:25px;}
.pl12{ padding-left:12px;}
.setBClub{ border:1px solid #3cb3c0; width:575px;}
.askText{ width:555px; background:#fff; height:55px; border:0px; line-height:20px; padding:5px 10px; overflow:hidden;}
.askText1{ width:555px; background:#fff; height:20px; border:0px; line-height:20px; padding:5px 10px; overflow:hidden;}
.askTextNum{ height:20px; line-height:20px; font-size:12px; color:#999; text-align:right; margin-right:15px;}
.askBotPic{ border-top:1px solid #f1f1f1; background:#fbfbfb;}
.askmobg{ background:url(images/askmob0.gif) no-repeat;}
.AskAdd{ background-position:0px 8px; padding-left:22px; line-height:32px; height:32px; margin-left:10px;}
.AskTold{ border:1px solid #d5d5d5;width:577px; background:#fff; z-index:999}
.AskTold .setBClub{ border:1px solid #ededed;width:575px;}
.RedClub{ border:1px solid #f96969; width:577px; background:#fff;}
.BorClub{ border:1px solid #3cb3c0; width:577px; background:#fff;}

.WrongSpan{ font-size:12px; margin-left:11px; height:20px; line-height:16px;}
.clubAskBtn{ background:url(images/caskBtn.gif) no-repeat; width:186px; height:49px; border:0px; }
.clubAskBtn_ys{ background:url(images/caskBtn00.jpg) no-repeat; width:186px; height:49px; border:0px; }
.ClubUsDv{ background:#fff; width:582px;}
.CbLeft{ width:60px; background:#e3e3e3;min-height:200px;height:auto !important;height:200px;overflow:visible;}
.relaList{ padding-top:17px; margin-left:8px;}
.relaList li{ cursor:pointer; float:left; display:inline; margin-top:7px; height:30px; width:52px; border-right:1px solid #ececec; text-align:center; background:url(images/askRe.gif) no-repeat center bottom;}
.relaList li a span{ display:block; height:27px; width:52px; line-height:27px; background:#afaeae; color:#fff;}
.relaList li a span font{ font-weight:bold; margin-right:4px; font-size:13px;}
.relaList li.current a span{ background:#fff; font-weight:bold; color:#333333;}
.relaList li a:hover{text-decoration:none;}
.relaList li a:hover span{ background:#fff; font-weight:bold; color:#333;}
.CbRight{ width:520px; background:#fff; padding-bottom:30px;}
.CbSex{ height:27px; line-height:27px;}
.CbSex input{ margin-top:7px;width:14px; height:14px; display:inline-block;}
.CbAge{ height:38px; width:190px; border:1px solid #ddd;}
.CbAIcon{ width:40px; height:38px; background-position:10px -61px;}
.CbAgDv{ width:149px; height:38px; background-position:-10px -162px; padding-left:1px;}
.CageClass{ height:20px; padding:9px 0px; width:85px; padding-left:12px; border:0px; color:#a9a9a9; font-size:14px; background:none;}
.CbMIcon{ width:40px; height:38px; background-position:10px -105px;}
.CmobClass{height:20px; padding:9px 0px; width:135px; padding-left:12px; border:0px; color:#a9a9a9; font-size:14px; background:none;}
.cola9{ color:#a9a9a9;}
.CWrong{ width:240px; margin-left:18px; height:40px; line-height:40px;}
.CbSelect{ width:52px; height:38px; line-height:38px;font-size:14px; color:#666}
.CbSelect span{width:42px; height:38px; background-position:22px -23px; }
.clubAskRight{ width:288px; background:#f8f8f8;}
.CdocNum i{ color:#3cb3c0; font-family:"微软雅黑"; font-size:24px; margin:0px 5px;word-spacing:8px;letter-spacing: 1px;}
.Cdocone{ width:75px; height:85px; margin-left:10px; margin-top:10px; overflow:hidden; z-index:5}
.CdTs{ line-height:20px; text-align:center; left:0px; top:85px; width:75px; height:85px; font-size:12px; color:#fff;z-index:5 display:none}
.Cdopa{ left:0px; bottom:0px; width:75px; height:85px;opacity: 0.50;-moz-opacity: 0.50;filter:alpha(opacity=50); background:#000;}
.Cdotxt{ left:0px; bottom:0px; width:75px; height:85px;}
.CdTs a{ color:#ffae00; padding-top:3px; display:block; font-weight:bold}
.CdTs a:hover{ text-decoration:none;}
.w260{ width:260px;}
.Cfamily{ height:25px; line-height:25px;}
.Cfamily input{ float:left; display:inline; margin-top:5px; margin-left:6px; margin-right:5px;width:14px; height:14px; display:inline-block;}
.Cfamily label{float:left; display:inline; width:42px;}
.Cfamily input.putClass{ width:89px; height:26px; border:1px solid #b9b9b9; margin-top:0px; display:none;}
.askDpic{ width:61px; height:68px; background:#fff; border:1px solid #e6e6e6; padding:1px; margin-bottom:5px;}
.askDtxt{ width:500px; margin-left:11px; line-height:25px;}
.SelDv{ position:absolute; left:0px; top:38px; background:#fff; border:1px solid #ddd; border-top:0px; padding-bottom:5px;}
.SelDv a{ display:block; height:25px; line-height:25px; width:41px; color:#666; padding-left:10px;}
.SelDv a:hover{ text-decoration:none;}
.Asonfou{ right:-250px; top:-2px; width:243px; z-index:1000 }
.AsonIc{ left:-10px; top:27px; background-position:0px -234px; width:11px; height:21px;}
.AsonTxt{border:1px solid #ffd785; background:#fffbf4; width:211px; line-height:18px; padding:0px 15px;padding-bottom:20px; color:#515151;}
.AsonTxt h2{ color:#ff6600; font-size:14px; padding-top:10px;}
.YesNo{ width:30px; height:20px; line-height:20px; background:#979797; font-size:13px; text-align:center; color:#fff; margin-left:12px; font-weight:normal; cursor:pointer}
.YesCuent{ background:#fc9000; font-weight:bold;}
.col66{ color:#666;}
.colWrong{ color:#ff4242;}
.pb30{ padding-bottom:30px;}
.AddPTS{ position:absolute; left:100px; height:32px; line-height:32px; color:#3CB3C0; font-weight:normal; top:0px;}
.mr45{ margin-right:45px;}
.smaImgBtn{background-position:0 -276px;height:15px;right:-6px;top:-4px;width:15px; display:inline-block; position:absolute;}
.smaImg{ padding:1px; border:1px solid #e4e4e4; width:40px; height:40px;}
.colblue{ color:#3CB3C0;}
.CbSex input.gestation{ width:41px; height:18px; line-height:18px; margin-top:3px; color:#A9A9A9; border:1px solid #ddd}
.Proselect2 select,.Proselect select{ height:20px; border:1px solid #d5d4d4; color:#999}
.AskAdd_btn2{ width:42px; height:42px; background:#fff; border:1px solid #afdfe5;}
.AskAdd_btn2 span{ display:block; margin:2px auto;background:url(images/AskAdd.jpg) no-repeat center center; width:36px; height:36px;}
.ask_vipic{ width:288px; height:119px; padding-top:20px; background:#fff;}
</style>
<script type="text/javascript">
function errpic(thepic){ 
	thepic.src="images/noavatar_middle.gif" ;
	} 
</script>
</head>
<body bgcolor="#FFFFFF">


<div class="w980 clearfix bc f12 btn-a pr">
<p class="pt10 pb10 lh180 znblue normal-a">
<a href="question.do?method=questionListUI" >问题列表</a> &gt; 
<a href="#"><%=subject.getSubjectName() %></a> &gt; 
<%=question.getTitle() %></p>
<!--左边内容-->
<div class="question_new_Conle fl pr">
<!--用户提问  开始-->
<div class="User_askcon clearfix pr">
<div class="t9999 questnew_icon User_askh2 pa"  >问</div>
<div class="clearfix pl29 pr15">
<h2 class="fl f16 Uerth2 fn clearfix pl5">
<p class="fl dib fb" ><%=question.getTitle() %></p>
<span class="solve dib ml10 fl f12">已采纳</span>
</h2>

</div>
<div class="f12 graydeep Userinfo clearfix pl29">
<span class="gray-a ">
<%=question.getState()==2?"匿名问题":patientVO.getName() %></span>
<span class="User_newbg User_fticon"></span>
<span>
<%=patientVO.getSex() %></span>         
<span class="User_newbg User_fticon"></span>
<span><%=patientVO.getAge() %></span>
<span class="User_newbg User_fticon"></span>
<span class="User_newbg User_time"><%=question.getCreateTime() %></span>
</div>
<div class="clearfix pl29 mr30">
<div class="graydeep User_quecol pt10 mt10" id="qdetailc">
<%=question.getQuestion() %></div>
</div>
       
<div class="clearfix UserTag pl29 mr30 mt10 ">
<%  if(patientVOSession !=null){  %>
	<div class="fr"><a  href="question.do?method=questionAddUI" class="f14 dib User_Task yelbtn01 tc">我也要提问</a></div>
<% } %>

</div>



</div>

 
<%
    if(question.getAnswerId()==null ){   %>
					
    	  <div class="w980 bc mt20 clearfix">

	<div class="fl clubAskLeft">
    	<form method="post" action="question.do?method=answerByQuestion">
        <input type="hidden" name="doctorId" value="${sessionScope.doctorVO.userid }">
		<input type="hidden" name="questionId" value="<%=question.getId() %>">
        
    	<div class="mt20 AskOne clearfix pr">
        	<h1 class="fl fn">答</h1><h2 class="fl fn">填写回答信息</h2>
        </div>
        <div class="ml30 pl12 clearfix cl">
            <div class="clearfix cl mr45"><h2 class="graydeep f14 fl clearfix lh25 mt5">请填写您的回答信息，描述越详细，越直白，患者们越容易理解</h2><div class="col99 fr fn f12 lh25 mt5 none">请输入<strong style="color:#df0d00;" class="fn">5-500</strong>字</div></div>
            <div class="AskTold mt10 pr">
                    <textarea name="ansContent" cols="" rows="" class="askText col99 f12" id="ansContent" ></textarea> 
                    <div class="clearfix"><span class="fl WrongSpan"></span><p class="askTextNum fr">5/500</p></div>
            </div>
             
		</div>
       
    
       
        <div class="ml30 pl12 mt15 pb30 pt10 clearfix">
        	<div style="display:none;"><input type="hidden" name="yc" value="f3abe5763e22818e7fe6d531b9a6e32a"></div>
        	<button type="submit" value="" class="clubAskBtn clubAskBtn cp fl"></button><p class="f14 lh200 pb10 fb pt15 orange none fl" id="subBtnTxt">提交中请耐心等待... ... </p>
        </div>
        </form>
    </div>

   
    
    
    </div>
  
   <%  }else {

%>

<div class="oh mt15" style="height:77px;">
</div>
<!--qq广告_科室完 -->
<!--问题回复 开始-->
<div class="Doc_con clearfix pr mt5 ">
<div class="t9999 questnew_icon Quest_askh2 pa">最佳答案</div>
<div class="clearfix Doc_conth pr29 pl29 Bestbg">
<h2 class="fl f16 Docth2 fn clearfix">提问者采纳</h2>
<span class="fr col99 f12 dib mr20 pr20 pt5">因不能面诊，医生的建议仅供参考</span>
</div>
<!--最佳答案--> 
<div class="docall clearfix Bestbg" id="7073981_reply">
<div class="hd_accept pa"><img src="images/hd_accept.png" class="png"></div>
<div class="zyhftop pl29 pt20 clearfix pr">
<div class="fl docCon">
<!--医生 职称 荣誉值 医院 等信息 显示  -->

<div class="fl Doc_dctou pr">
<a href="#" target="_blank" ><img src="photo/<%=doctorVO.getUserimage() %>" width="65" height="72" onerror="javascript:errpic(this)"></a>
</div>
 
<div class="Doc_zytpmd graydeep fl ml15 f14">
<div class="clearfix h40 oh">
<div class="fl">
<a class="f14 fb Doc_bla" href="#" ><%=doctorVO.getUsername() %></a>
<span class="ml5 dib vicon item_user"></span> </div>
 

 
<div class="cl Doc_lh24 f12">
<p class="fl graydeep">擅长科室：<%=subMap.get(Integer.parseInt(doctorVO.getPro())) %></p>
   
</div>
</div>
</div>        
</div>
<div class="zxpabtn mt15 f14">
<span class="dib graydeep f12" style="line-height: 26px; height: 26px;">&nbsp;&nbsp;已帮助用户：<%=doctorAnsCount %></span>					            </div>
</div>
<div class="pt10 clearfix pr qsdetail pb15">
<div class="Best_jticon User_newbg"></div>
<div class="Doc_dochf Best_dochf bc">
<div class="pt15 f14 graydeep  pl20 pr20">
<%=answer.getAnswer() %>
</div>
<p class="col99 tr clearfix pr20"><span class="User_newbg User_time Doc_time"><%=answer.getCreateTime() %></span></p>
<div class="clearfix pb10  pl20 pr20 ballc">
<div class="fl pr mt5">
<ul class="f14 fl thankul zjtxt">
<li>
<li><a href="javascript:history.back(-1)" rel="did=7073981&fromurl=xwtw&292&subject_id=666" class="me_btn ">返回</a></li>
</ul>
</div>
<div class="fr">
</div>
</div>                                  
</div>
</div>
</div>


</div>
 
 
<%} %>


 
 

 
<style type="text/css"> 
.Doc_Grad .Doc_addicon{ left:112px;top:-10px;}
.GradTxt{ margin-left:60px;}.GradList{ margin-left:104px;}
.GradTxt li{ width:72px; height:25px; line-height:25px; text-align:center; font-size:12px; color:#666; float:left; display:inline; margin-left:20px;}
.GradList li{ float:left; display:inline; width:92px; height:28px; background:url(images/dc_grade.jpg) no-repeat 0px -76px;}
.GradList li i{ display:inline-block; width:14px; height:28px; cursor:pointer}
.GradList li i.w78{ width:78px;}
.GradList li i.w38{ width:38px;}
.GradList li.on,.GradList li.clon{ background-position:0px -38px;}
.GradList li.current,.GradList li.clcurrent{ background-position:0px 0px;}
.GradText{ width:490px; padding:5px 10px; line-height:20px; margin:0px auto; overflow:hidden; height:53px; background:#fff; border:1px solid #c7c7c7; display:block; margin-top:20px; color:#999;}
.GradPut{ padding-left:51px; padding-top:23px; height:32px;text-align:left;}
.GradPut input{ display:block; float:left; display:inline; width:110px; height:20px; line-height:20px; padding:5px 0px; background:#fff; border:1px solid #c7c7c7; text-align:center; font-size:14px; color:#666; margin-right:18px; cursor:pointer;}
.GradPut input.puton,.GradPut input.current{ border:1px solid #1ea4c6; color:#1ea4c6;}
#GradNums{ position:absolute; right:0px; top:0px; color:#f5a50e; font-size:16px; right:40px; top:45px;}
.GraDSmall{ background:url(images/dc_grade_small.gif) no-repeat 0px -15px; width:106px; height:13px; display:inline-block; margin-right:7px;}
.GraDSmall i{ font-style:normal; display:inline-block; height:15px; line-height:15px; float:right; font-size:14px; color:#f29b12;font-family:Arial, Helvetica, sans-serif}
.GraDSmall b{ width:70px; height:13px; display:inline-block;background:url(images/dc_grade_small.gif) no-repeat 0px 0px; float:left;}
.GraDSmall b.w10{ width:14px;}
.GraDSmall b.w15{ width:21px;}
.GraDSmall b.w20{ width:28px;}
.GraDSmall b.w25{ width:35px;}
.GraDSmall b.w30{ width:42px;}
.GraDSmall b.w35{ width:49px;}
.GraDSmall b.w40{ width:56px;}
.GraDSmall b.w45{ width:63px;}
.GraDSmall b.w50{ width:70px;}
</style>

 

 




</div>

</div>

</body>
</html>
