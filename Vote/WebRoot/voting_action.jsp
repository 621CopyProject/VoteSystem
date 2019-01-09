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

<title>My JSP 'Vote.jsp' starting page</title>

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
    	int optionid=Integer.parseInt(request.getParameter("options"));
    	String username=(String)session.getAttribute("username");
    	String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con=null;
		PreparedStatement pre = null;
  		ResultSet result = null;
  		boolean isValid=false;
  		try{
  			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection(URL,"sa","123456");
			String sql="select * from vote where optionid=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, optionid);
			result=pre.executeQuery();
			result.next();
			int themeid=result.getInt("themeid");
			int number=result.getInt("number");
			number++;
			sql="update vote set number=? where optionid=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, number);
			pre.setInt(2, optionid);
			pre.executeUpdate();
			sql="insert into uservote(username,themeid,optionid) values(?,?,?)";
			pre=con.prepareStatement(sql);
			pre.setString(1, username);
			pre.setInt(2, themeid);
			pre.setInt(3, optionid);
			pre.executeUpdate();
			isValid=true;
  		}catch(Exception e){
  			e.printStackTrace();
  		}
  		finally{
			try{
		 		if (result != null)  
              		result.close();  
          		if (pre != null)  
              		pre.close();  
          		if (con != null)  
             		con.close();  
          		//System.out.println("数据库连接已关闭！");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(isValid){
			System.out.print("投票成功");
			response.sendRedirect("voting.jsp");
		}else{
			System.out.print("投票失败");
			response.sendRedirect("voting.jsp");
		}
    %>
</body>
</html>
