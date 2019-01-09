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

<title>My JSP 'register_cation_test.jsp' starting page</title>

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
		String username, password1, password2, sex, home, job;
		String birthday;
		String n="n";
		username = request.getParameter("username");
		password1 = request.getParameter("password1");
		password2 = request.getParameter("password2");
		sex = request.getParameter("sex");
		birthday =request.getParameter("birthday");
		home = request.getParameter("home");
		job = request.getParameter("job");
		//out.println(username);
		//out.println(password1);
		//out.println(sex);
		//System.out.println(birthday);
		//out.println(home);
		//out.println(job);
		if (username == null || "".equals(username.trim())
				|| password1 == null || "".equals(password1.trim())
				|| password2 == null || "".equals(password2.trim())) {
			out.print("用户名或密码不能为空！");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='register_test.jsp'" />
	<%
		return;
		} else if (!password1.equals(password2)) {
			out.print("两次输入密码不相同");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='register_test.jsp'" />
	<%
		return;
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
			//System.out.print("成功");
			if (!result.next()) {
				sql = "insert into login(username,password,permission) values(?,?,?)";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password1);
				pre.setString(3, "0");
				pre.executeUpdate();
				isValid = true;
				if(!sex.equals("null")){
					sql="update login set sex=? where username=?";
					pre=con.prepareStatement(sql);
					pre.setString(1, sex);
					pre.setString(2, username);
					pre.executeUpdate();		
				}
				
				if(!birthday.equals("0")){
					int b=Integer.parseInt(birthday);
					sql="update login set birthday=? where username=?";
					pre=con.prepareStatement(sql);
					pre.setInt(1, b);
					pre.setString(2, username);
					pre.executeUpdate();
				}
				
				if(!home.equals("null")){
					sql="update login set home=? where username=?";
					pre=con.prepareStatement(sql);
					pre.setString(1, home);
					pre.setString(2, username);
					pre.executeUpdate();
				}
				//System.out.print(job);
				if(!job.equals("null")){
					sql="update login set job=? where username=?";
					pre=con.prepareStatement(sql);
					pre.setString(1, job);
					pre.setString(2, username);
					//System.out.print("运行了");
					pre.executeUpdate();
				}
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
		if (isValid) {
			System.out.println("注册成功，请登录！");
			response.sendRedirect("login.jsp");
			return;
		} else {
			out.println("用户名已存在！");
		}
	%>
	<input type="button" value="返回"
		onClick="window.location.href='register_test.jsp'" />
</body>
</html>
