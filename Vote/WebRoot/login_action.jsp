<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String username = request.getParameter("username");
String password = request.getParameter("password");
	if (username == null || "".equals(username.trim())
			|| password == null || "".equals(password.trim())) {
		out.print("用户名或密码不能为空！");
%>
<input type="button" value="返回" onClick="window.location.href='login.jsp'" />	 
	<%
	 		return;
	 	}
	 	String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
	 	boolean isValid=false;
	 	Connection con=null;
	 	PreparedStatement pre=null;
	 	ResultSet result=null;
	 	String permission=null;
	 	try{
	 			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 			con = DriverManager.getConnection(URL, "sa", "123456");
	 			//System.out.print("连接成功");
	 			String sql = "select * from login where username=? and password=?";
	 			//System.out.print("成功");
	 			pre = con.prepareStatement(sql);
	 			pre.setString(1, username);
	 			pre.setString(2, password);
	 			result = pre.executeQuery();
	 			if (result.next()) {
	 				isValid = true;
	 				permission = result.getString("permission");
	 			}
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 			//System.out.print("连接失败");
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
	 		if (isValid) {
	 			if (permission.equals("0")) {
	 				System.out.println("登录成功！");
	 				session.setAttribute("username", username);
	 				response.sendRedirect("index.jsp");
	 			} else {
	 				response.sendRedirect("administrator.jsp");
	 			}

	 		} else {
	 			out.println("帐号或密码错误！");
	 		}
	 	%>
<input type="button" value="返回" onClick="window.location.href='login.jsp'" />
