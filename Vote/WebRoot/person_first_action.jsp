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

<title>My JSP 'person_first_action.jsp' starting page</title>

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
		String username = (String) session.getAttribute("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password3 = request.getParameter("password3");
		if (password1 == null || "".equals(password1.trim())
				|| password2 == null || "".equals(password2.trim())
				|| password3 == null || "".equals(password3.trim())) {
			out.print("请输入完整");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='register_test.jsp'" />
	<%
		} else if (!password2.equals(password3)) {
			out.print("两次输入密码不相同");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='register_test.jsp'" />
	<%
		}
		String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		boolean isValid = false;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet result = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "123456");
			//System.out.print("成功连接");
			String sql = "select * from login where username=?";
			pre = con.prepareStatement(sql);
			pre.setString(1, username);
			result = pre.executeQuery();
			result.next();
			if (password1.equals(result.getString("password"))) {
				sql = "update login set password=? where username=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, password2);
				pre.setString(2, username);
				pre.executeUpdate();
				isValid = true;
			}
		} catch (Exception e) {
			System.out.print("成功");
			e.printStackTrace();
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
		if (isValid = true) {
			System.out.print("修改成功");
			response.sendRedirect("login.jsp");
		} else {
			out.println("旧密码错误");
		}
	%>
	<input type="button" value="返回"
		onClick="window.location.href='person_first.jsp'" />
</body>
</html>
