<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'administrator.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
				<li ><a href="admin_first.jsp">新建投票</a></li>
				<li><a href="administrator_second.jsp">删除投票</a></li>
				<li ><a href="administrator_third.jsp">票数统计</a></li>
		</ul>
	</div>
	</div>
</nav>
			<div class="jumbotron">
				<h1 align="center">
					Welcome,administrator!
				</h1>
				<p class="text-right">
					 <a class="btn btn-primary btn-large" href="login.jsp">登出</a>
				</p>
			</div>
		</div>
	</div>
    </div>
  </body>
</html>












