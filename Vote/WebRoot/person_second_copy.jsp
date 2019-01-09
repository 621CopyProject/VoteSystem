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

<title>My JSP 'person_second_copy.jsp' starting page</title>

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
					<li><a href="#">首页</a>
					</li>
					<li><a href="person_first.jsp">修改密码</a>
					</li>
					<li><a href="person_second.jsp">个人资料</a>
					</li>
					<li><a href="person_third.jsp">创建投票</a>
					</li>
					<li><a href="person_fourth.jsp">投票记录</a>
					</li>
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
				<%request.setCharacterEncoding("gb2312"); %>
				<form class="form-horizontal" role="form" action="person_second_copy_action.jsp" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名：</label>
						<div class="col-sm-10">
							<label class=" control-label"><%=username%></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别：</label>
						<div class="col-sm-2">
							<select class="form-control" name="sex">
								<option style='display: none' value="<%= result.getString("sex")%>"><%= result.getString("sex") %></option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">出生年份：</label>
						<div class="col-sm-2">
							<select class="form-control" name="birthday">
								<option style='display: none' value="<%= result.getInt("birthday")%>"><%= result.getInt("birthday")%></option>
								<%
									for (int i = 2019; i >= 1900; i--) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-sm-8"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所在地：</label>
						<div class="col-sm-2">
							<select class="form-control" name="home">
								<option style='display: none' value="<%= result.getString("home")%>"><%= result.getString("home")%></option>
								<option value="北京">北京</option>
								<option value="天津">天津</option>
								<option value="河北">河北</option>
								<option value="山西">山西</option>
								<option value="内蒙古">内蒙古</option>
								<option value="辽宁">辽宁</option>
								<option value="吉林">吉林</option>
								<option value="黑龙江">黑龙江</option>
								<option value="上海">上海</option>
								<option value="江苏">江苏</option>
								<option value="浙江">浙江</option>
								<option value="安徽">安徽</option>
								<option value="福建">福建</option>
								<option value="江西">江西</option>
								<option value="山东">山东</option>
								<option value="河南">河南</option>
								<option value="湖北">湖北</option>
								<option value="湖南">湖南</option>
								<option value="广东">广东</option>
								<option value="广西">广西</option>
								<option value="海南">海南</option>
								<option value="重庆">重庆</option>
								<option value="四川">四川</option>
								<option value="贵州">贵州</option>
								<option value="云南">云南</option>
								<option value="西藏">西藏</option>
								<option value="陕西">陕西</option>
								<option value="甘肃">甘肃</option>
								<option value="青海">青海</option>
								<option value="宁夏">宁夏</option>
								<option value="新疆">新疆</option>
								<option value="台湾">台湾</option>
								<option value="香港">香港</option>
								<option value="澳门">澳门</option>
								<option value="海外">海外</option>
							</select>
						</div>
						<div class="col-sm-8"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">职业：</label>
						<div class="col-sm-3">
							<select class="form-control" name="job">
								<option style='display: none' value="<%= result.getString("job")%>"><%= result.getString("job")%></option>
								<option value="计算机/互联网/通信">计算机/互联网/通信</option>
								<option value="生产/工艺/制造">生产/工艺/制造</option>
								<option value="医疗/护理/治疗">医疗/护理/治疗</option>
								<option value="金融/银行/投资/保险">金融/银行/投资/保险</option>
								<option value="商业/服务业/个体经营">商业/服务业/个体经营</option>
								<option value="文化/广告/传媒">文化/广告/传媒</option>
								<option value="娱乐/艺术/表演">娱乐/艺术/表演</option>
								<option value="律师/法务">律师/法务</option>
								<option value="教育/培训">教育/培训</option>
								<option value="公务员/行政/事业单位">公务员/行政/事业单位</option>
								<option value="模特">模特</option>
								<option value="空姐">空姐</option>
								<option value="学生">学生</option>
								<option value="其他">其他</option>
							</select>
						</div>
						<div class="col-sm-7"></div>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-lg btn-primary">保存修改</button>
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
