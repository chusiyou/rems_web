<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.Subject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List subList=(List)request.getAttribute("subList");
%>

<!DOCTYPE html>
<!-- saved from url=(0056)http://club.xywy.com/askquestion.php?fromurl=xywyshouye1 -->
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>

<link href="css/a_new.css" type="text/css" rel="stylesheet">
<link href="css/common_login_v2.css" type="text/css" rel="stylesheet">
<link href="css/reset.css" type="text/css" rel="stylesheet">
</head>
<body>
<link rel="stylesheet" type="text/css" href="css/common_login_v2.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
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



<div class="w980 bc mt20 clearfix">

	<div class="fl clubAskLeft">
    	<form method="post" id="questionForm" name="questionForm" action="question.do?method=questionDoAdd">
        <input type="hidden" name="userId" value="${sessionScope.patientVO.userid }">
        
    	<div class="mt20 AskOne clearfix pr">
        	<h1 class="fl fn">1</h1><h2 class="fl fn">填写基本信息</h2>
        </div>
        <div class="ml30 pl12 clearfix cl">


			<div class="clearfix cl mr45"><h2 class="graydeep f14 fl clearfix lh25 mt5">请填写您的健康问题标题，请尽量简短描述</h2><div class="col99 fr fn f12 lh25 mt5 none">请输入<strong style="color:#df0d00;" class="fn">5-500</strong>字</div></div>
            <div class="AskTold mt10 pr">
                    <input type="text" name ="title" class="askText1 col99 f12" id="title" onfocus="if(this.value===&#39;描述您的健康问题标题，请尽量简短描述等&#39;){this.value=&#39;&#39;;}" onblur="if(ltrim(this.value)===&#39;&#39;){this.value=this.defaultValue;}"  value="描述您的健康问题标题，请尽量简短描述等" />
            </div>			
        	

            <div class="clearfix cl mr45"><h2 class="graydeep f14 fl clearfix lh25 mt5">请填写您的健康疑问，描述越详细，医生们越容易解答</h2><div class="col99 fr fn f12 lh25 mt5 none">请输入<strong style="color:#df0d00;" class="fn">5-500</strong>字</div></div>
            <div class="AskTold mt10 pr">
                    <textarea name="quesContent" cols="" rows="" class="askText col99 f12" id="quesContent" onfocus="if(this.value===&#39;描述您的主要病症、发病时间和病情变化情况等&#39;|| this.value===&#39;输入您的问题，10分钟即可得到多名专家解答&#39; || this.value===&#39;在此提交您的问题，专业医生10分钟内为您解答&#39; || this.value===&#39;提交您的问题，专业医生10分钟内为您解答&#39; || this.value===&#39;请输入您要咨询的健康问题...&#39; || this.value===&#39;请输入您的健康疑问&#39; || this.value===&#39;填写症状 描述信息，如：小孩头不发烧，手脚冰凉，是怎么回事？&#39;){this.value=&#39;&#39;;}" onblur="if(ltrim(this.value)===&#39;&#39;){this.value=this.defaultValue;}">描述您的主要病症、发病时间和病情变化情况等</textarea> 
                    <div class="clearfix"><span class="fl WrongSpan"></span><p class="askTextNum fr">5/500</p></div>
                 
                    <div class="Asonfou pa none">
                    	<div class="askmobg AsonIc pa"></div>
                        <div class="AsonTxt f12">
                        	<h2>病情描述举例：</h2><p class="pt5">我有慢性鼻窦炎一年多，平时脓涕多、鼻塞、头痛、嗅觉减退、除此之外由于脓涕流入咽部和长期用口呼吸、常伴有慢性咽炎症状，痰多、异物感和咽喉疼痛等。</p>
                        </div>
                    </div>
            </div>
            <div class="clearfix cl mr45"><h2 class="graydeep f14 clearfix lh25 mt15 fl">请选择你的问题科目：
				
					<select id="subjectId" name="subjectId"  style="width:100px;" >
                    <option value="">请选择...</option>
                    <%   if(subList!=null && subList.size()>0){
                    	      for(int i=0;i<subList.size();i++){
                    	    	  Subject sj=(Subject)subList.get(i);%>
	
									<option value="<%=sj.getId() %>"><%=sj.getSubjectName() %></option>
                    	    	  
                    	    <%   }
                    	
                    }  %>
                </select>
					
					</h2>
				
			</div>     
		</div>
       
    
       
        <div class="ml30 pl12 mt15 pb30 pt10 clearfix">
        	<div class="clearfix f12 lh25 mt15 btn-a fl mr20">
					<p class="fl"><input type="checkbox" name="noname" value="2" class="fl mt5"><span class="fl ml10">匿名提问</span></p> 
			</div>  
			<a href='javascript:document.questionForm.submit();' data-toggle='modal' class='btn btn-danger'>提      交</a>
        </div>
        </form>
    </div>

   
    
    
    </div>
  






</body></html>
