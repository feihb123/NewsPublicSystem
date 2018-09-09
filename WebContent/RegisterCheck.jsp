<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ResigterCheck</title>
</head>
<body>
<%
Base.getConnection();
ResultSet rs=null;
String name = request.getParameter("name"); 
name = new String(name.getBytes("ISO8859_1"), "UTF-8");
Base.addUpdDel("insert into users values('"+request.getParameter("ID")+"','"+
		name+"','"+request.getParameter("pwd")+"')");
%>
<script>
alert("注册成功!");
document.location.href="Login.jsp";
</script>

</body>
</html>