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

<title>My JSP 'administrator_second_see.jsp' starting page</title>

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
	<%
		String themeid = request.getParameter("themeid");
		String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet result = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "123456");
			String sql = "select * from theme where themeid=?";
			pre = con.prepareStatement(sql);
			pre.setInt(1, Integer.parseInt(themeid));
			//System.out.print("成功");
			result = pre.executeQuery();
			result.next();
			String anoymity = result.getString("anoymity");
			String themename = result.getString("themename");
			String createname = result.getString("createname");
			int count = result.getInt("optionmode");
			int stick = result.getInt("stick");
			sql = "select * from limit where themeid=?";
			pre = con.prepareStatement(sql);
			pre.setInt(1, Integer.parseInt(themeid));
			//System.out.print("成功");
			result = pre.executeQuery();
			result.next();
	%>
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
							<li><a href="admin_first.jsp">新建投票</a>
							</li>
							<li class="active"><a href="administrator_second.jsp">投票管理</a>
							</li>
							<li><a href="administrator_third.jsp">用户举报</a>
							</li>
						</ul>
					</div>
				</div>
				</nav>
				<table class="table">
					<caption>
						<h1>
							投票主题：<%=themename%></h1>
					</caption>
					<thead>
						<tr>
							<th colspan="2" align="center">限制条件</th>
							<th>创建人：<%=createname%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
								if (count == 1) {
							%>
							<td>选择模式：单选</td>
							<%
								} else {
							%>
							<td>选择模式：多选（<%=count%>）</td>
							<%
								}
							%>
							<td>性别：<%=result.getString("sex")%></td>
							<td>出生时间：<%=result.getInt("birthday_smell")%>~<%=result.getInt("birthday_big")%></td>
						</tr>
						<tr>
							<td>所在地：<%=result.getString("home")%></td>
							<td>职业：<%=result.getString("job")%></td>
							<td><%=anoymity%></td>
						</tr>
					</tbody>
				</table>
				<table class="table">
					<caption>
						<h1>投票选项</h1>
					</caption>
					<thead>
						<tr>
							<th style="width:90%;">选项</th>
							<th style="width:10%">票数</th>
						</tr>
					</thead>
					<tbody>
						<%
							sql = "select * from vote where themeid=?";
								pre = con.prepareStatement(sql);
								pre.setInt(1, Integer.parseInt(themeid));
								//System.out.print("成功");
								result = pre.executeQuery();
								while (result.next()) {
						%><tr>
							<td><%=result.getString("optionname")%></td>
							<td><%=result.getString("number")%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<div align="center">
					<%
						if (stick == 1) {
					%><a
						href="administrator_second_restick.jsp?themeid=<%= themeid%>"
						class="btn btn-default btn-warning"> 取消置顶 </a>
					<%
						} else {
					%><a
						href="administrator_second_stick.jsp?themeid=<%= themeid%>"
						class="btn btn-default btn-success"> 置顶 </a>
					<%
						}
					%>
					<a href="administrator_second.jsp" class="btn btn-default"> 返回
					</a> <a href="administrator_second_action.jsp?themeid=<%=themeid%>"
						class="btn btn-danger"> 删除 </a>
				</div>
			</div>
		</div>
	</div>
	<%
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
	%>
</body>
</html>
