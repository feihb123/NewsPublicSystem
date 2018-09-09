<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>  
<title>系统部门用户添加</title>  
</head>  
<body style="background-color:#FFF8DC;background-image: url(jb.png);"><center>
<br><br><br><br><br>
<img src="xzit.jpg" width="100" height="100"  align="center">
<h2>系统部门用户添加</h2><br><br>
<form action="DRegisterCheck.jsp" method="post" style="padding-top:-700px;"> 

登录名:<input name="ID" type="text"><br><br>  
昵&nbsp&nbsp称:<input name="name" type="text"><br><br>  
部门号:<input name="deptID" type="text"><br><br>  
密&nbsp&nbsp码:<input name="pwd" type="password"><br><br>  
 
   <input type="reset"value="重置">&nbsp&nbsp&nbsp&nbsp<input type="submit"value="注册">  
</form>  
</body>  
</html>  