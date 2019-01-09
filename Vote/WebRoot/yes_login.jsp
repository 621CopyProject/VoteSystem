<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'yes_login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	

  </head>
  
  <body>
    <div id="head"><tr><td><a href="person.jsp">你好,${username }</a></td>
    <td><a href="login.jsp">登出</a></td>
    </tr></div>
    <div id="body">
    	<div id="voting">
    		<table>
    			<tr><td align="center"><h1>欢迎使用云投票</h1></td></tr>
    			<tr><td align="center"><a href="voting.jsp"><h2>进入投票页</h2></a></td></tr>
    		</table>
		</div>
    </div>
  </body>
</html>
