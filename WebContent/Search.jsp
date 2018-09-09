<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>搜索结果</title>
</head>
<body bgcolor="#FFF8DC">


<%
    String name = request.getParameter("sname"); 
    name = new String(name.getBytes("ISO8859_1"), "UTF-8"); 
    Base.getConnection();
   
    
    %>
    <table border="0" width='400'   align="center">
    
      <tr>
        <th width="87" align="left">"<%=name%>"的搜索结果:</th>
      </tr>
          <img src="fg.png" width="1400" height="100" >
      
      <% 
      ResultSet rs=Base.selectSql("select * from news where newTitle like '%"+name+"%'");
       while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>%>">
        <%=rs.getString("newTitle") %></a>      
      </tr>
      
         <%
         }
       Base.closeConn();
         %>
         </table>
             <img src="fg.png" width="1400" height="100" >
         
</body>
</html>