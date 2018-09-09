<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<%@ page import="newsSystem.*"%>
<html>  
<head>  
<title>登录注册页面</title>  
</head>  
<body style="background-color:#FFF8DC;background-image: url(jb.png);">  

<center><br><br><br><br><br>
<img src="xzit.jpg" width="100" height="100"  align="center">
<h2>智能新闻发布推送系统</h2>
<br><br>
<form action="LoginCheck.jsp"  method="post"  style="padding-top:-700px;">  

用户名:<input type="text" name="name"value="" size="26"><br><br>
密&nbsp&nbsp&nbsp码:<input type="password" name="pwd"value="" size="27"><br><br>
选择身份:  
   <select name="status">  
       <option value="user" selected>系统用户</option>  
       <option value="depter" >部门管理员</option>  
       <option value="admin">系统管理员</option>  
    </select><br> <br>
                <input type="submit"value="登录"name="denglu">&nbsp&nbsp&nbsp&nbsp&nbsp    
                
                <input type="reset"value="重置"><br><br>
  </form> 
 <form action="Register.jsp">  
    <input type="submit"value="新用户注册">  
     </form>  
</body>  
</html>  