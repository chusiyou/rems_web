<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.rems.vo.Question" %>
<%@ page import="com.rems.vo.Subject" %>
<%@ page import="com.rems.vo.PatientVO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List questionList=(List)request.getAttribute("questionList");
Map patientMap=(Map)request.getAttribute("patientMap");
Map subMap=(Map)request.getAttribute("subMap");
String title=(String)request.getAttribute("title");
String subjectId=(String)request.getAttribute("subjectId");
int pageCount=(Integer)request.getAttribute("pageCount");
int pageInt=(Integer)request.getAttribute("pageInt");
PatientVO patientVO=(PatientVO)request.getSession().getAttribute("patientVO");
if(title==null){
	title="";
}
if(subjectId==null){
	subjectId="";
}
%>

<!DOCTYPE html>
<html>
    
    <head>
        <title>问题查询列表页面</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        
    </head>
    
    <body>
    
        <div class="container-fluid" style="margin-top:0px;padding-top:0px;">
            <div class="row-fluid" style="margin-top:0px;padding-top:0px;">
                
                <!--/span-->
                <div class="span9" id="content" style="width:100%" style="margin-top:0px;padding-top:0px;">

                    

                    <div class="row-fluid" style="margin-top:0px;padding-top:0px;">
                        <!-- block -->
                        <div class="block" style="margin-top:0px;padding-top:0px;">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">问题列表</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table class="table table-hover">
						              <thead>
						                <tr>
						                  <th>编号</th>
						                  <th>科目名称</th>
						                  <th>问题标题</th>
						                  <th>提问时间</th>
										  <th>提问用户</th>
						                  <th>问题状态</th>
										  <th>操作</th>
						                </tr>
						              </thead>

						              <tbody>
						   <%
						        if(questionList!=null){
						        	for(int i=0;i<questionList.size();i++){
						        		Question ques=(Question)questionList.get(i);  %>
						                <tr>
						                  <td><%=ques.getId() %></td>
						                  <td><%=subMap.get(ques.getSubjectId()) %></td>
						                  <td><%=ques.getTitle() %></td>
						                  <td><%=ques.getCreateTime() %></td>
										  <td><%=ques.getState()==2 ?"匿名问题":patientMap.get(ques.getUserId()) %></td>
										  <td><%=ques.getAnswerId()==null?"未回答":"已回答" %></td>
											
						                  <td>
                                           <% if (patientVO==null){  
                                        	        if(ques.getAnswerId()==null){  %>
                                        	        	<a href='question.do?method=queryQuestionById&questionId=<%=ques.getId() %>' data-toggle='modal' class='btn btn-danger'>我来回答</a>
                                        	       <%  }else{  %>
                                        	        	<a href='question.do?method=queryQuestionById&questionId=<%=ques.getId() %>' data-toggle='modal' class='btn btn-danger'>查看详情</a>
                                        	       <% }
                                           			%>

                                           <% }else{  %>
                                        	       <a href='question.do?method=queryQuestionById&questionId=<%=ques.getId() %>' data-toggle='modal' class='btn btn-danger'>查看详情</a>
                                          <%  }%>
						                   </td>
						                </tr>
						                
						             <%}
						        	} %>   
						             
						                
						                

						              </tbody>
						            </table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                  




                  
                    </div>
                </div>

			<div class="msdn" style="background:#F5F5F5"><span > 共有<%=pageCount %>条数据</span>

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

		</div>

            </div>
          
 
     

       
    </body>

</html>
