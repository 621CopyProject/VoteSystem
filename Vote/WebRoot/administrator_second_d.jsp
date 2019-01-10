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
    
    <title>My JSP 'administrator_second_d.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	String themeid=request.getParameter("themeid");
    	//out.print(themeid);
    	String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet result=null;
		String permission=null;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection(URL,"sa","123456");
			String sql="delete from theme where themeid="+themeid+"";
			pre=con.prepareStatement(sql);
			pre.executeUpdate();
			//System.out.print("成功");
			}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("administrator_second.jsp");
    %>
</html>
