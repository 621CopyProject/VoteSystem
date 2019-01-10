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
    
    <title>My JSP 'admin_first_action.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <%
					request.setCharacterEncoding("UTF-8");
		
				%>
  <%
  	String themeid=request.getParameter("themeid");
  	String optionnumber=request.getParameter("optionnumber");
  	String[] option=new String[Integer.parseInt(optionnumber)+1];
  	for(int i=1;i<option.length;i++){
  		option[i] = request.getParameter("option"+i+"");
  	}
  	for(int i=1;i<option.length;i++){
  		if(option[i] == null || "".equals(option[i].trim())){
  			out.print("请将选项填写完整");
  			%>
				<input type="button" value="返回"
					onClick="window.location.href='admin_first_d_action.jsp?themeid=<%= themeid%>'" />
				<%
					return;
  		}
  	}
  	String URL="jdbc:sqlserver://127.0.0.1:1433;databaseName=Vote";
  	Connection con=null;
  	PreparedStatement pre = null;
  	ResultSet result = null;
  	try{
  		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con=DriverManager.getConnection(URL,"sa","123456");
		String sql="insert into vote(themeid,number,optionname) values(?,?,?)";
		pre=con.prepareStatement(sql);
		for(int i=1;i<option.length;i++){
			pre.setInt(1, Integer.parseInt(themeid));
			pre.setInt(2, 0);
			pre.setString(3, option[i]);
			pre.executeUpdate();
		}
		out.print("创建成功，你的投票ID号是：");
		out.print(themeid);
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
   %>
  <input type="button" value="确定"
					onClick="window.location.href='admin_first.jsp'" />
  </body>
</html>
