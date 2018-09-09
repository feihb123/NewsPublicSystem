<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>顶置操作</title>
</head>
<body>
<%
Base.getConnection();
ResultSet rs=null;
String newsID = request.getParameter("newsid"); 
Base.addUpdDel("update news set evaluNumber=evaluNumber+999 where newsID='"+newsID+"'");
Base.closeConn();
%>
<script>
alert("顶置成功!");
window.history.back(-1); 
</script>

</body>
</html>