<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'administrator_third.jsp' starting page</title>
    
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
				<li ><a href="administrator_first.jsp">新建投票</a></li>
				<li><a href="administrator_second.jsp">删除投票</a></li>
				<li class="active"><a href="administrator_third.jsp">票数统计</a></li>
		</ul>
	</div>
	</div>
</nav>
		
<%
		String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
		Connection con=null;
  		PreparedStatement pre = null;
  		ResultSet result = null;
  		ResultSet rs = null;
  		try{
  			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection(URL,"sa","123456");
			String sql="select * from theme";
			pre=con.prepareStatement(sql);
			result=pre.executeQuery();
			int i=0;
			while(result.next()){
				int themeid=result.getInt("themeid");
				i++;
			%>
			<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
				    <a data-toggle="collapse" data-parent="#accordion" 
				    href="#<%= i%>">
					<%= result.getString("themename") %>
				    </a>
			     </h4>
		     </div>
		<div id="<%= i%>" class="panel-collapse collapse">
			<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<div class="panel-body">
				<%
					sql="select * from vote where themeid=?" ;
					pre=con.prepareStatement(sql);
					pre.setInt(1, themeid);
					rs=pre.executeQuery();
					while(rs.next()){%>
						<li><%= rs.getString("optionname") %></li>
					<%}
				%>
			</div>
			</div>
			<div class="col-md-6 column">
			<div class="panel-body">
				<%
					sql="select * from vote where themeid=?" ;
					pre=con.prepareStatement(sql);
					pre.setInt(1, themeid);
					rs=pre.executeQuery();
					while(rs.next()){%>
						<li><%= rs.getInt("number") %></li>
					<%}
				%>
			</div>
			</div>
		</div>
		</div>
		</div>
	</div>
			<%}
  		}catch(Exception e){
  			e.printStackTrace();
  		}
		finally{
			try{
		 		if (result != null)  
              		result.close();  
          		if (pre != null)  
              		pre.close();  
          		if (con != null)  
             		con.close();  
          		//System.out.println("数据库连接已关闭！");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
 %>
		</div>
	</div>
    </div>
  </body>
</html>
