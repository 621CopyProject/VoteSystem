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

<title>My JSP 'admin_first_create.jsp' starting page</title>

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
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String createname = (String) session.getAttribute("username");
		String themename = request.getParameter("themename");
		String option_number = request.getParameter("option-number");
		String option_mode = request.getParameter("option-mode");
		String sex = request.getParameter("sex");
		String birthday_smell = request.getParameter("birthday-smell");
		String birthday_big = request.getParameter("birthday-big");
		String home = request.getParameter("home");
		String job = request.getParameter("job");
		String anoymity = request.getParameter("anonymity");
		if (themename == null || "".equals(themename.trim())) {
			out.print("投票主题不能为空");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='admin_first.jsp'" />
	<%
		return;
		}
		if (Integer.parseInt(option_number) <= Integer
				.parseInt(option_mode)) {
			out.print("多选个数不能大于选项个数,请重新输入");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='admin_first.jsp'" />
	<%
		return;
		}
		if (Integer.parseInt(birthday_smell) > Integer
				.parseInt(birthday_big)) {
			out.print("不存在这个年龄段的人");
	%>
	<input type="button" value="返回"
		onClick="window.location.href='admin_first.jsp'" />
	<%
		return;
		}
		String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet result = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "123456");
			String sql = "insert into theme(themename,optionnumber,optionmode,anoymity,createname,stick) values(?,?,?,?,?,?)";
			pre = con.prepareStatement(sql);
			pre.setString(1, themename);
			pre.setInt(2, Integer.parseInt(option_number));
			pre.setInt(3, Integer.parseInt(option_mode));
			pre.setString(4, anoymity);
			pre.setString(5, createname);
			pre.setInt(6, 1);
			pre.executeUpdate();
			sql = "select * from theme where themename=? order by themeid desc";
			pre = con.prepareStatement(sql);
			pre.setString(1, themename);
			//System.out.print("成功");
			result = pre.executeQuery();
			result.next();
			int themeid = result.getInt("themeid");

			sql = "insert into limit(themeid,birthday_smell,birthday_big) values(?,?,?)";
			pre = con.prepareStatement(sql);
			pre.setInt(1, themeid);
			pre.setInt(2, Integer.parseInt(birthday_smell));
			pre.setInt(3, Integer.parseInt(birthday_big));
			pre.executeUpdate();
			if (!sex.equals("null")) {
				sql = "update limit set sex=? where themeid=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, sex);
				pre.setInt(2, themeid);
				pre.executeUpdate();
			}
			if (!home.equals("null")) {
				sql = "update limit set home=? where themeid=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, home);
				pre.setInt(2, themeid);
				pre.executeUpdate();
			}
			if (!job.equals("null")) {
				sql = "update limit set job=? where themeid=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, job);
				pre.setInt(2, themeid);
				pre.executeUpdate();
			}
	%><div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="administrator_d.jsp?themeid=<%=themeid%>">云投票</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li class="active"><a href="admin_first_d_action.jsp?themeid=<%=themeid%>">新建投票</a>
							</li>
							<li><a href="administrator_second_d.jsp?themeid=<%=themeid%>">投票管理</a></li>
							<li><a href="administrator_third_d.jsp?themeid=<%=themeid%>">用户举报</a></li>
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
							<th colspan="3" align="center">限制条件</th>
						</tr>
					</thead>
					<tbody>
						<%
							int count = Integer.parseInt(option_mode);
						%>
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
							<td>性别：<%=sex%></td>
							<td>出生时间：<%=birthday_smell%>~<%=birthday_big%></td>
						</tr>
						<tr>
							<td>所在地：<%=home%></td>
							<td>职业：<%=job%></td>
							<td><%=anoymity%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				request.setCharacterEncoding("gb2312");
			%>
			<form role="form"
				action="admin_first_action.jsp?themeid=<%=themeid%>&optionnumber=<%=option_number%>"
				method="post">
				<%
					int m = Integer.parseInt(option_number);
						for (int i = 1; i <= m; i++) {
				%>
				<div class="form-group">
					<input type="text" class="form-control" name="option<%=i%>"
						placeholder="选项<%=i%>">
				</div>
				<%
					}
				%>
				<div class="text-right">
					<a href="admin_first_d_action.jsp?themeid=<%=themeid%>"
						class="btn btn-danger"> 取消创建 </a>
					<button type="submit" class="btn btn-info">创建投票
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
			</form>
		</div>
	</div>

</body>
</html>
