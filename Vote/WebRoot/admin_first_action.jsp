<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_first_action.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <%
					request.setCharacterEncoding("UTF-8");
		
				%>
  <%
  	String themeid=request.getParameter("themeid");
  	String optionnumber=request.getParameter("optionnumber");
  	String[] option=new String[Integer.parseInt(optionnumber)+1];
  	for(int i=1;i<option.length;i++){
  		option[i] = request.getParameter("option"+i+"");
  	}
  	for(int i=1;i<option.length;i++){
  		if(option[i] == null || "".equals(option[i].trim())){
  			out.print("请将选项填写完整");
  			%>
				<input type="button" value="返回"
					onClick="window.location.href='admin_first_d_action.jsp?themeid=<%= themeid%>'" />
				<%
					return;
  		}
  	}
  	
   %>
  </body>
</html>
