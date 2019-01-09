<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'person_third.jsp' starting page</title>
<style>
			.file-item{
				width: 300px;
				height: 30px;
				margin:5px 0;
				box-shadow: 0 0 10px rgba(0,0,0,0.3);
			}
		</style>

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
<h1>文件上传</h1>
<button id='btn'>add more...</button>
<form>
		<input type="text" name="file" /><button id='btn'>add more...</button>
		<div id="file-box">
		</div>
		</form>
		<script>
			$('btn').addEventListener('click',function(){
				//创建DIV
				var fileItem = document.createElement('div');
				fileItem.className = 'file-item';
				
				//创建input元素，type为file,name为file
				var input = document.createElement('input');
				input.type = input.name = 'text';
				fileItem.appendChild(input);
				
				//创建按钮
				var btn = document.createElement('button');
				btn.textContent = '删除';
				fileItem.appendChild(btn);
				
				$('file-box').appendChild(fileItem);
				
				//为按钮设置点击事件(删除)
				btn.addEventListener('click',function(){
					//删除当前按钮节点所在父节点
//					$('file-box').removeChild(this.parentNode);
					this.parentNode.remove();
				})
				
			});
			
			function $(id){
				return document.getElementById(id);
			}
		</script>
	</body>

</html>
