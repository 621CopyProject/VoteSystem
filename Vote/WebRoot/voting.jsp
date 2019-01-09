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

<title>My JSP 'voting.jsp' starting page</title>

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
		<div class="jumbotron">
			<div class="container">
				<h1>谢谢对云投票的支持</h1>
			</div>
		</div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-9 column">
					<%
						String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
						Connection con = null;
						String username = (String) session.getAttribute("username");
						PreparedStatement pre = null;
						ResultSet result = null;
						ResultSet rs = null;
						ResultSet rset = null;
						try {
							Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							con = DriverManager.getConnection(URL, "sa", "123456");
							String sql = "select * from theme";
							pre = con.prepareStatement(sql);
							result = pre.executeQuery();
							int i = 0;
							while (result.next()) {
								int themeid = result.getInt("themeid");
								i++;
					%>
					<div class="panel panel-default">
						<div class="panel-heading">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#<%=i%>"> <%=result.getString("themename")%> </a>
						</div>
						<div id="<%=i%>" class="panel-collapse collapse">
							<div class="panel-body">
								<%
									sql = "select * from uservote where username=? and themeid=?";
											pre = con.prepareStatement(sql);
											pre.setString(1, username);
											pre.setInt(2, themeid);
											//System.out.print(username);
											//System.out.print(themeid);
											rs = pre.executeQuery();
											if (rs.next()) {
												sql = "select * from vote where themeid=?";
												pre = con.prepareStatement(sql);
												pre.setInt(1, themeid);
												rset = pre.executeQuery();
								%>
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-6 column">
											<%
												while (rset.next()) {
											%>
											<li><%=rset.getString("optionname")%></li>
											<%
												}
											%>
										</div>
										<div class="col-md-6 column">
											<%
												sql = "select * from vote where themeid=?";
															pre = con.prepareStatement(sql);
															pre.setInt(1, themeid);
															rset = pre.executeQuery();
															while (rset.next()) {
											%>
											<li><%=rset.getInt("number")%></li>
											<%
												}
											%>
										</div>
									</div>
								</div>
								<%
									} else {
												sql = "select * from vote where themeid=?";
												pre = con.prepareStatement(sql);
												pre.setInt(1, themeid);
												rset = pre.executeQuery();
								%>
								<form action="voting_action.jsp" method="post">
									<%
										while (rset.next()) {
														int optionid = rset.getInt("optionid");
									%>
									<div class="radio">
										<label> <input type="radio" name="options"
											value="<%=optionid%>"> <%=rset.getString("optionname")%>
										</label>
									</div>
									<%
										}
									%>
									<button type="submit" class="btn btn-info">投票
								</form>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<%
						}
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
				<div class="col-md-3 column">
					<div class="jumbotron">
						<h1>Hello,</h1>

						<h2>
							<%=username%>
						</h2>

						<p>如果你有想发布的投票，欢迎致邮到：</p>
						<p>nfu@njfu.edu.cn</p>
						<p>
							<a class="btn btn-primary btn-large" href="login.jsp">登出</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
