<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'person.jsp' starting page</title>

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
	<%String username = (String) session.getAttribute("username"); %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="page-header">
					<h1 align="center">用户界面</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-2 column">
				<ul class="nav nav-stacked nav-pills">
					<li class="active"><a href="person.jsp">个人中心</a></li>
					<li><a href="#">首页</a></li>
					<li><a href="person_first.jsp">修改密码</a></li>
					<li><a href="person_second.jsp">个人资料</a></li>
					<li><a href="person_third.jsp">创建投票</a></li>
					<li><a href="person_fourth.jsp">投票记录</a></li>
				</ul>
			</div>
			<div class="col-md-10 column">
				<div class="jumbotron">
					<div class="container">
						<h1>你好</h1>
						<h1><%= username %></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
