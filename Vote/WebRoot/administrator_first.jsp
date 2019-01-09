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

<title>My JSP 'administrator_first.jsp' starting page</title>

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
							<li><a href="administrator_second.jsp">删除投票</a>
							</li>
							<li><a href="administrator_third.jsp">票数统计</a>
							</li>
						</ul>
					</div>
				</div>
				</nav>
				<%
					request.setCharacterEncoding("gb2312");
				%>
				<form role="form" action="administrator_first_action.jsp"
					method="post">
					<div class="form-group">
						<label for="name">投票标题</label>
						<textarea class="form-control" rows="3" name="themename"
							placeholder="文本输入"></textarea>
					</div>
					<div class="form-group">
						<label for="name">A选项</label> <input type="text"
							class="form-control" name="option_a" placeholder="文本输入">
					</div>
					<div class="form-group">
						<label for="name">B选项</label> <input type="text"
							class="form-control" rows="3" name="option_b" placeholder="文本输入">
					</div>
					<div class="form-group">
						<label for="name">c选项</label> <input type="text"
							class="form-control" name="option_c" placeholder="文本输入">
					</div>
					<div class="form-group">
						<label for="name">d选项</label> <input type="text"
							class="form-control" name="option_d" placeholder="文本输入">
					</div>
					<div class="text-right">
						<button type="submit" class="btn btn-info">提交
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
