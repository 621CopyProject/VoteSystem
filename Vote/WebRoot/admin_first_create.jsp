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
							<li class="active"><a href="administrator_first.jsp">新建投票</a>
							</li>
							<li><a href="administrator_second.jsp">删除投票</a></li>
							<li><a href="administrator_third.jsp">票数统计</a></li>
						</ul>
					</div>
				</div>
				</nav>
				<%
					request.setCharacterEncoding("UTF-8");
				%>
				<%
					String themename = request.getParameter("themename");
					String option_number = request.getParameter("option-number");
					String option_mode = request.getParameter("option-mode");
					String sex = request.getParameter("sex");
					String birthday_smell = request.getParameter("birthday-smell");
					String birthday_big = request.getParameter("birthday-big");
					String home = request.getParameter("home");
					String job = request.getParameter("job");
					String anoymity = request.getParameter("anoymity");
					if (themename == null || "".equals(themename.trim())) {
						out.print("投票主题不能为空");
					}
					if (Integer.parseInt(option_number) <= Integer
							.parseInt(option_mode)) {
						out.print("多选个数不能大于选项个数,请重新输入");
					}
					if (Integer.parseInt(birthday_smell) > Integer
							.parseInt(birthday_big)) {
						out.print("不存在这个年龄段的人");
					}
				%>
				<input type="button" value="返回"
					onClick="window.location.href='admin_first.jsp'" />
				<%
					
				%>
			</div>
		</div>
	</div>

</body>
</html>
