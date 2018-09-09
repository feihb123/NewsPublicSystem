<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>刷新排序</title>
</head>
<body>
<%
Base.getConnection();
ResultSet rs=null; 
Base.addUpdDel("update Weight set Dateweight=Dateweight");
Base.closeConn();
%>
<script>
alert("刷新成功!");
window.history.back(-1); 
</script>
</body>
</html>