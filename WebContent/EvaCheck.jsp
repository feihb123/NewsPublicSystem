<%@ page language="java" import="newsSystem.*" pageEncoding="utf-8" import="java.sql.*"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>

<title></title>
</head>
<body>

<%

EvaServlet l1=new EvaServlet();
l1.doPost(request, response);

%>
<script language="javascript"> 
alert("评论成功"); 
window.history.back(-1); 
</script> 

</body>
</html>