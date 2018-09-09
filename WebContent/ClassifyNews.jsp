<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
    <%
Base.getConnection();
ResultSet rs=null;
rs=Base.selectSql("select * from news,Classify where news.classifyID='"
      +request.getParameter("Cid")+"' and news.classifyID=Classify.classifyID");
      rs.next();
%>

<title><%=rs.getString("classifyName")%></title>
</head>
<body bgcolor="#FFF8DC">
<br><br><center> <font size=4>
         <a href="MainWeb.jsp" style="text-decoration:none ">首页&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=1" style="text-decoration:none ">&nbsp国内&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=2" style="text-decoration:none ">&nbsp国际&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=3" style="text-decoration:none ">&nbsp军事&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=4" style="text-decoration:none ">&nbsp财经&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=5" style="text-decoration:none ">&nbsp娱乐&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=6" style="text-decoration:none ">&nbsp体育&nbsp&nbsp</a>
         </font></center>
              <img src="fg.png" width="1400" height="100" >
         
    <table border="0" width='400'  align="center">
      <tr>
        <th width="87" align="left"><%=rs.getString("classifyName")%>
      </tr>
    <%
      rs=Base.selectSql("select * from news,Classify where news.classifyID='"
      +request.getParameter("Cid")+"' and news.classifyID=Classify.classifyID");
      while(rs.next()){
%>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      </tr>
      <%
      }
      Base.closeConn();
      %>
    </table>
     <img src="fg.png" width="1400" height="100" >

</body>
</html>