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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>科目信息</title>
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


<script type="text/javascript">


     function openDetail(subjectId,operator){
    	 $.webox({
 			height:280,
 			width:600,
 			bgvisibel:true,
 			title:'科目信息',
 			iframe:'subject.do?method=addOrUpdateSubjectUI&operator='+operator+'&subjectId='+subjectId
 		});
     }
</script>

</head>


<body>
<div id="contentWrap">
<div class="pageTitle">远程电子医疗诊断系统>科目列表管理</div>
<div class="pageColumn">

<div class="pageButton" align="center">
<a href="javascript:openDetail('0','add')"   class="button white medium">增加科目</a>  
</div>

  <table>
    <thead>
      <th >科目ID</th>
      <th >科目代码</th>
      <th >科目名称</th>
	<th >操作</th>
        </thead>
    <tbody>

   <%
        if(subList!=null){
        	for(int i=0;i<subList.size();i++){
        		Subject vo=(Subject)subList.get(i);
        		if(i%2==0){    %>
        			 <tr>
        				<td class="tdline"> <%=vo.getId()%></td>
				        <td class="tdline"><%=vo.getSubjectCode() %></td>
				        <td class="tdline"><%=vo.getSubjectName() %></td>
				       
						<td class="tdline"><a href="javascript:openDetail('<%=vo.getId() %>','update')">修改</a><a>删除</a></td>
				      </tr>
        	<% }else{  %>
        			<tr class="trLight">
				        <td class="tdline"> <%=vo.getId() %></td>
				        <td class="tdline"><%=vo.getSubjectCode() %></td>
				        <td class="tdline"><%=vo.getSubjectName() %></td>
						<td class="tdline"><a href="javascript:openDetail('<%=vo.getId() %>','update')">修改</a><a>删除</a></td>
				    </tr>
        	<% 	}
        	}
        }
   %>
   

 		
      
   						
    
    </tbody>
  </table>

</div>
 
</div>

</body>
</html>
