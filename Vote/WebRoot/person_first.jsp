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

<title>My JSP 'person_first.jsp' starting page</title>

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
				<div class="page-header">
					<h1 align="center">用户界面</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-2 column">
				<ul class="nav nav-stacked nav-pills">
					<li class="active"><a href="person.jsp">个人中心</a>
					</li>
					<li><a href="index.jsp">首页</a>
					</li>
					<li><a href="person_first.jsp">修改密码</a>
					</li>
					<li><a href="person_second.jsp">个人资料</a>
					</li>
					<li><a href="person_third.jsp">创建投票</a></li>
					<li><a href="person_fourth.jsp">投票记录</a></li>
				</ul>
			</div>
			<div class="col-md-10 column">
				<form class="form-horizontal" role="form" action="person_first_action.jsp" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">旧密码</label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="password1"
								placeholder="旧密码">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="password2"
								placeholder="新密码">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">确认新密码</label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="password3"
								placeholder="确认新密码">
						</div>
					</div>
					<div class="text-right">
						<button type="submit" class="btn btn-info">修改密码
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
