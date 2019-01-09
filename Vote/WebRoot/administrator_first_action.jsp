<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'administrator_first_action.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<%
  	String[] option=new String[4];
  	String themename= request.getParameter("themename");
	option[0] = request.getParameter("option_a");
  	option[1] = request.getParameter("option_b");
  	option[2] = request.getParameter("option_c");
  	option[3] = request.getParameter("option_d");
  	
  	if(themename==null||"".equals(themename.trim())||option[0]==null||"".equals(option[0].trim())||
  	option[1]==null||"".equals(option[1].trim())||option[3]==null||"".equals(option[3].trim())||
  	option[3]==null||"".equals(option[3].trim())){
  		out.print("请将表单填写完整！");%>
	<input type="button"
		onClick="window.location.href='administrator_first.jsp'" value="返回" />
	<%
  		return;
  	}
  	String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
  	Connection con=null;
  	PreparedStatement pre = null;
  	ResultSet result = null;
  	try{
  		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con=DriverManager.getConnection(URL,"sa","123456");
		//out.print("连接成功");
		String sql="select * from theme where themename=?";
		pre=con.prepareStatement(sql);
		pre.setString(1,themename);
		//System.out.print("成功");
		result=pre.executeQuery();
		if(result.next()){
			out.print("此主题已存在！");%>
	<input type="button"
		onClick="window.location.href='administrator_first.jsp'" value="返回" />
	<%
			return;
		}
		sql="insert into theme(themename) values(?)";
		pre=con.prepareStatement(sql);
		pre.setString(1,themename);
		pre.executeUpdate();
		sql="select * from theme where themename=?";
		pre=con.prepareStatement(sql);
		pre.setString(1,themename);
		//System.out.print("成功");
		result=pre.executeQuery();
		result.next();
		int themeid=result.getInt("themeid");
		sql="insert into vote(themeid,number,optionname) values(?,?,?)";
		pre=con.prepareStatement(sql);
		for(int i=0;i<option.length;i++){
			pre.setInt(1, themeid);
			pre.setInt(2, 0);
			pre.setString(3, option[i]);
			pre.executeUpdate();
		}
  	}catch(Exception e){
  		e.printStackTrace();
  		//out.print("连接失败");
  	}
  	finally  
  {  
      try  
      {  
          // 逐一将上面的几个对象关闭，因为不关闭的话会影响性能、并且占用资源  
          // 注意关闭的顺序，最后使用的最先关闭  
          if (result != null)  
              result.close();  
          if (pre != null)  
              pre.close();  
          if (con != null)  
              con.close();  
          //System.out.println("数据库连接已关闭！");  
      }  
      catch (Exception e)  
      {  
          e.printStackTrace();  
      }  
  } 
  out.print("主题创建成功！"); 
  %><input type="button" value="返回"
		onClick="window.location.href='administrator.jsp'" />
</body>
</html>









