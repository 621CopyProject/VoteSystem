<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'administrator_second_stick.jsp' starting page</title>

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
		String themeid = request.getParameter("themeid");
		String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet result = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "123456");
			String sql = "update theme set stick=? where themeid=?";
			pre = con.prepareStatement(sql);
			pre.setInt(1, 0);
			pre.setInt(2, Integer.parseInt(themeid));
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			//out.print("连接失败");
		} finally {
			try {
				// 逐一将上面的几个对象关闭，因为不关闭的话会影响性能、并且占用资源  
				// 注意关闭的顺序，最后使用的最先关闭  
				if (result != null)
					result.close();
				if (pre != null)
					pre.close();
				if (con != null)
					con.close();
				//System.out.println("数据库连接已关闭！");  
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("administrator_second.jsp");
	%>

</html>
