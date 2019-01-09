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

<title>My JSP 'person_second_copy_action.jsp' starting page</title>

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
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String username = (String) session.getAttribute("username");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		String home = request.getParameter("home");
		String job = request.getParameter("job");
		String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet result = null;
		boolean isValid = false;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "123456");
			//System.out.print("成功连接");
			String sql = "select * from login where username=?";
			pre = con.prepareStatement(sql);
			pre.setString(1, username);
			result = pre.executeQuery();
			if (result.next()) {
				if (!sex.equals("null")) {
					sql = "update login set sex=? where username=?";
					pre = con.prepareStatement(sql);
					pre.setString(1, sex);
					pre.setString(2, username);
					pre.executeUpdate();
				}

				if (!birthday.equals("0")) {
					int b = Integer.parseInt(birthday);
					sql = "update login set birthday=? where username=?";
					pre = con.prepareStatement(sql);
					pre.setInt(1, b);
					pre.setString(2, username);
					pre.executeUpdate();
				}

				if (!home.equals("null")) {
					sql = "update login set home=? where username=?";
					pre = con.prepareStatement(sql);
					pre.setString(1, home);
					pre.setString(2, username);
					pre.executeUpdate();
				}
				//System.out.print(job);
				if (!job.equals("null")) {
					sql = "update login set job=? where username=?";
					pre = con.prepareStatement(sql);
					pre.setString(1, job);
					pre.setString(2, username);
					//System.out.print("运行了");
					pre.executeUpdate();
				}
			}
			isValid=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		if(isValid){
			response.sendRedirect("person_second.jsp");
		}else{
			out.println("修改失败");
		}
	%>
	<input type="button" value="返回"
		onClick="window.location.href='person_second.jsp'" />
</html>
