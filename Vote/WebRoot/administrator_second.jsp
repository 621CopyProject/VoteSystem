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

<title>My JSP 'administrator_second.jsp' starting page</title>
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
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width:90%;">主题名称</th>
							<th colspan="2" style="width:10%;">投票管理</th>
						</tr>
					</thead>
					<tbody>
						<%
							String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
							Connection con = null;
							PreparedStatement pre = null;
							ResultSet result = null;
							ResultSet re = null;
							try {
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								con = DriverManager.getConnection(URL, "sa", "123456");
								String sql = "select * from theme";
								pre = con.prepareStatement(sql);
								result = pre.executeQuery();
								while (result.next()) {
									int themeid = result.getInt("themeid");
									sql = "select * from vote where themeid=?";
									pre = con.prepareStatement(sql);
									pre.setInt(1, themeid);
									re = pre.executeQuery();
									if (!re.next()) {
										sql = "delete from theme where themeid=" + themeid + "";
										pre = con.prepareStatement(sql);
										pre.executeUpdate();
									}
								}
								sql = "select * from theme where stick=? order by themeid desc";
								pre = con.prepareStatement(sql);
								pre.setInt(1, 1);
								result = pre.executeQuery();
								while (result.next()) {
						%>
						<tr>
							<td><a
								href="administrator_second_see.jsp?themeid=<%=result.getInt("themeid")%>"><%=result.getString("themename")%></a>
							</td>
							<td align="center"><a
								href="administrator_second_restick.jsp?themeid=<%=result.getInt("themeid")%>"
								class="btn btn-default btn-warning"> 取消置顶 </a>
							<td align="center"><a
								href="administrator_second_action.jsp?themeid=<%=result.getInt("themeid")%>"
								class="btn btn-danger"> 删除 </a></td>
						</tr>
						<%
							}
								sql = "select * from theme where stick!=? order by themeid desc";
								pre = con.prepareStatement(sql);
								pre.setInt(1, 1);
								result = pre.executeQuery();
								while (result.next()) {
						%>
						<tr>
							<td><a
								href="administrator_second_see.jsp?themeid=<%=result.getInt("themeid")%>"><%=result.getString("themename")%></a>
							</td>
							<td align="center"><a
								href="administrator_second_stick.jsp?themeid=<%=result.getInt("themeid")%>"
								class="btn btn-default btn-success"> 置顶 </a>
							<td align="center"><a
								href="administrator_second_action.jsp?themeid=<%=result.getInt("themeid")%>"
								class="btn btn-danger"> 删除 </a></td>
						</tr>
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
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
