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

<title>My JSP 'person_second.jsp' starting page</title>

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
				<%
					String username = (String) session.getAttribute("username");
					String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
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
						result.next();
				%>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=username%></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=result.getString("sex")%></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">出生年份：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=result.getInt("birthday")%></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所在地：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=result.getString("home")%></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">职业：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=result.getString("job")%></label>
						</div>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<input type="button" class="btn btn-primary btn-default"
							value="修改资料"
							onClick="window.location.href='person_second_copy.jsp';">
					</div>
				</form>
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
