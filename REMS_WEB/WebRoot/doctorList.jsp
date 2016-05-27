<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.DoctorVO" %>
<%@ page import="com.rems.vo.Subject" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List doctorList=(List)request.getAttribute("doctorList");
Map subMap=(Map)request.getAttribute("subMap");
String sysname=(String)request.getAttribute("sysname");
String username=(String)request.getAttribute("username");
String subjectId=(String)request.getAttribute("subjectId");
int pageCount=(Integer)request.getAttribute("pageCount");
int pageInt=(Integer)request.getAttribute("pageInt");
if(sysname==null){
	sysname="";
}
if(username==null){
	username="";
}
if(subjectId==null){
	subjectId="";
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>医生信息查询</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style_button1.css" />
<link href="images/jquery-webox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background:#FFF
}
</style>

</head>
<script type="text/javascript">
     function subForm(){
         if(document.getElementById("sysname").vaule=="" && document.getElementById("username").value==""){
                alert("请填写姓名或者账号！");
           }else{
        	   document.getElementById("form1").submit();
           }
     }

     function subFormPage(page){
        document.getElementById("form1").action="doctor.do?method=doctorListView&pageInt="+page;
        document.getElementById("form1").submit();
     }

     function openDetail(doctorId,operator){
    	 $.webox({
 			height:280,
 			width:600,
 			bgvisibel:true,
 			title:'医生详细信息',
 			iframe:'doctor.do?method=doctorDetailOrUpdate&operator='+operator+'&doctorId='+doctorId
 		});
     }
</script>

<body>
<div id="contentWrap">
<div class="pageTitle">远程电子医疗诊断系统>医生列表查询</div>
<div class="pageColumn">

<div class="pageButton" align="center">
<form name="form1" id="form1" action="doctor.do?method=doctorListView"  method="post" onsubmit="return validator(this)" al>
  姓名： <input type="text" name="username" id="username" value="<%=username %>" size="15" maxlength="15" style="border:#999999 1px solid; background-color:#FFFFEE">   
  账号：  <input type="text" name="sysname" id="sysname" value="<%=sysname %>" size="15" maxlength="15" style="border:#999999 1px solid; background-color:#FFFFEE"> 
科室：<select id="subjectId" name="subjectId"  >
                    <option value="">请选择...</option>
                    <%   if(subMap!=null){
                    			Iterator it=subMap.entrySet().iterator();
                    			while(it.hasNext()){
                    				Map.Entry entry=(Map.Entry)it.next(); %>
 									<option value="<%=entry.getKey() %>"><%=entry.getValue()%></option>
                    			<% }
                    	      
									
                    	    	  
                    	      }  %>
                    	
               
                </select>
		<button class="btn" onclick="javascript:subForm()">查&nbsp;&nbsp;询</button>
</form>
</div>

  <table>
    <thead>
      <th >姓名</th>
      <th >系统账号</th>
      
      <th >性别</th>
      <th >年龄</th>
	<th>婚姻状况</th>
      <th>民族</th>
     <th >联系电话</th>
	<th >联系邮箱</th>
	  <th >所属科室</th>
	 <th >所属医院</th>	
	<th >入院年份</th>		
	<th >家庭地址</th>
	<th >操作</th>
        </thead>
    <tbody>

   <%
        if(doctorList!=null){
        	for(int i=0;i<doctorList.size();i++){
        		DoctorVO vo=(DoctorVO)doctorList.get(i);
        		if(i%2==0){    %>
        			 <tr>
        				<td class="tdline"> <%=vo.getUsername() %></td>
				        <td class="tdline"><%=vo.getSysname() %></td>
				        <td class="tdline"><%=vo.getSex() %></td>
						<td class="tdline"><%=vo.getAge() %></td>
				        <td class="tdline"><%=vo.getMarry() %></td>
						<td class="tdline"><%=vo.getMz() %></td>
						<td class="tdline"><%=vo.getCel() %></td>
						<td class="tdline"><%=vo.getMail() %></td>
                        <td class="tdline"><%=subMap.get(vo.getPro()) %></td>
						<td class="tdline"><%=vo.getCol() %></td>
						<td class="tdline"><%=vo.getRynf() %></td>
						<td class="tdline"><%=vo.getAddr() %></td>
						<td class="tdline"><a href="javascript:openDetail('<%=vo.getUserid()%>','detail')">详情</a><a href="javascript:openDetail('<%=vo.getUserid() %>','update')">修改</a></td>
				      </tr>
        	<% }else{  %>
        			<tr class="trLight">
				        <td class="tdline"> <%=vo.getUsername() %></td>
				        <td class="tdline"><%=vo.getSysname() %></td>
				        <td class="tdline"><%=vo.getSex() %></td>
						<td class="tdline"><%=vo.getAge() %></td>
				        <td class="tdline"><%=vo.getMarry() %></td>
						<td class="tdline"><%=vo.getMz() %></td>
						<td class="tdline"><%=vo.getCel() %></td>
						<td class="tdline"><%=vo.getMail() %></td>
                        <td class="tdline"><%=subMap.get(vo.getPro()) %></td>
						<td class="tdline"><%=vo.getCol() %></td>
						<td class="tdline"><%=vo.getRynf() %></td>
						<td class="tdline"><%=vo.getAddr() %></td>
						<td class="tdline"><a href="javascript:openDetail('<%=vo.getUserid() %>','detail')">详情</a><a href="javascript:openDetail('<%=vo.getUserid() %>','update')">修改</a></td>
				    </tr>
        	<% 	}
        	}
        }
   %>
   

 		
      
   						
    
    </tbody>
  </table>

</div>
 
</div>

 <div class="msdn"><span > 共有<%=pageCount %>条数据</span>

             <%
                  if(pageCount!=0 && pageCount >10){
                	  int temp=0;
                	 
                	    if(pageCount%10==0){
                	    	temp=pageCount/10;
                	    }else{
                	    	temp=pageCount/10+1;
                	    }
                	   
                	  //System.out.println("temp==========="+temp);
                	   // System.out.println("pageInt==========="+pageInt);
                	  if(pageInt!=1){ %>
                  		<a href="javascript:subFormPage(1)">首页</a>
                 		<% }%>
                	    <% for(int i=0;i<temp;i++){  
                	    	if(pageInt ==(i+1)){ %>
								<span class="current"><%=i+1 %></span>
                	    		
                	    <% 	}else{  %>
                	    	<a href="javascript:subFormPage(<%=i+1%>)"><%=i+1 %></a>
                	  <%  }%>
                	    
                	    
                	    	
               	   <%  }
                	    if(temp!=1  && pageInt!=1){
                	    	int pageup=pageInt-1; %>
                	    	<a href="javascript:subFormPage(<%=pageup%>)">上一页</a>
                	    <% }
                	    if(temp!=1 && pageInt!=temp){ 
                	    	int pagedown=pageInt+1;
                	    	%>
                	    	<a href="javascript:subFormPage(<%=pagedown%>)">下一页</a>
                	    <% }
                	    if(pageInt!=temp && temp!=1 ){ %>
                			<a href="javascript:subFormPage(<%=temp %>)">尾页</a>
               			<% }
                  }
             %>
<!--  
				<span class="current">1</span>
				<a href="#?page=2">2</a>
				<a href="#?page=3">3</a>
				<a href="#?page=4">4</a>
				<a href="#?page=5">5</a>
				<a href="#?page=6">6</a>
				<a href="#?page=7">7</a>
				...
				<a href="#?page=199">199</a>
				<a href="#?page=200">200</a>
				<a href="#?page=2">Next  > </a>
				-->
		</div></p>

</body>
</html>
