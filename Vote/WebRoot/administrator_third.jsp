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

<title>My JSP 'administrator_third.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="administrator.jsp">云投票</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li><a href="admin_first.jsp">新建投票</a></li>
							<li><a href="administrator_second.jsp">投票管理</a></li>
							<li class="active"><a href="administrator_third.jsp">用户举报</a>
							</li>
						</ul>
					</div>
				</div>
				</nav>
				<%
					String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
					Connection con = null;
					PreparedStatement pre = null;
					ResultSet result = null;
					try {
						Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
						con = DriverManager.getConnection(URL, "sa", "123456");
						String sql = "select * from tip where state=?";
						pre = con.prepareStatement(sql);
						pre.setInt(1, 0);
						result = pre.executeQuery();
				%>
				<div class="container">
					<h2>未处理举报</h2>
					<div class="list-group"><%
						while(result.next()){%>
							<a href="administrator_third_action.jsp?themeid=<%= result.getInt("themeid")%>" class="list-group-item list-group-item-action">用户[<%= result.getString("username")%>]
							对ID号[<%= result.getInt("themeid")%>]举报他[<%= result.getString("reason")%>]</a>
						<%}
					 %>
					</div>
				</div>
				<%
				sql = "select * from tip where state=?";
						pre = con.prepareStatement(sql);
						pre.setInt(1, 1);
						result = pre.executeQuery();
				%>
				<div class="container">
					<h2>已处理举报</h2>
					<ul class="list-group"><%
						while(result.next()){%>
							<li class="list-group-item">用户[<%= result.getString("username")%>]
							对ID号[<%= result.getInt("themeid")%>]举报他[<%= result.getString("reason")%>]</li>
						<%}
					 %>
					</ul>
				</div>
				<%
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
				%>
			</div>
		</div>
	</div>
</body>
</html>
