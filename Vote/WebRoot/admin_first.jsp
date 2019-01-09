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

<title>My JSP 'admin_first.jsp' starting page</title>

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
					request.setCharacterEncoding("gb2312");
				%>
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form"
						action="admin_first_create.jsp" method="post">
						<div class="form-group">
							<label>投票标题</label>
							<textarea class="form-control" rows="3" name="themename"
								placeholder="文本输入"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">选项个数：</label>
							<div align="left">
								<select class="form-control" name="option-number" style="width:75px">
									<option value="2" selected>2</option>
									<%
										for (int i = 3; i <= 15; i++) {
									%>
									<option value="<%= i%>"><%= i%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">可选个数：(默认单选)</label> <input
								type="text" style="width:100px" class="form-control"
								name="option-mode" value="1">
						</div>
						<div class="form-group">
							<label class="control-label">选择条件：（默认无限制）</label><br /> <label
								class="control-label">性别限制：</label>
							<div>
								<select class="form-control" name="sex" style="width:75px">
									<option value="null"></option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<label class="control-label">出生年份限制：</label>
							<div>
								<select class="form-control" name="birthday-smell" style="width:100px">
									<option style='display: none' value="0"></option>
									<%
									for (int i = 1900; i <= 2019; i++) {
								%>
									<option value="<%= i%>"><%= i%></option>
									<%
									}
								%>
								</select> <label class="control-label">~</label> <select
									class="form-control" name="birthday-big" style="width:100px">
									<option style='display: none' value="0"></option>
									<%
									for (int i = 2019; i >= 1900; i--) {
								%>
									<option value="<%= i%>"><%= i%></option>
									<%
									}
								%>
								</select>
							</div>
							<label class="control-label">所在地限制：</label>
							<div>
							<select class="form-control" name="home" style="width:100px">
								<option value="null" ></option>
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
						<label class="control-label">职业限制:</label>
						<div>
							<select class="form-control" name="job" style="width:200px">
								<option  value="null"></option>
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
						</div>
						<div >
						<label class="control-label">是否匿名:（可看到投票人员）</label><br/>
						<label class="radio-inline">
		<input type="radio" name="anonymity"  value="1" checked> 公开
	</label>
	<label class="radio-inline">
		<input type="radio" name="anonymity"   value="0"> 匿名
	</label>
	<br/>
						<button type="submit" class="btn btn-info">创建选项
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
