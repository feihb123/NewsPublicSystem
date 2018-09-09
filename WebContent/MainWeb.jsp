<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新闻浏览页面</title>
<style>
.button {
  display: inline-block;
  border-radius: 8px;
  background-color:#FFCC55;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 10px;
  width: 140px;
  height:50px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
#GUIDE{
position:absolute; 
width:400px; 
z-index:1;
left: 200px;
top:90px;
}
#HOT_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 200px;
top:130px;
}
#GUONEI_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 200px;
top:430px;
}
#IMG{
position:absolute; 
z-index:1;
left: 780px;
top:70px;
}
#GUOJI_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 200px;
top:770px;
}
#JUNSHI_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 800px;
top:770px;
}
#CAIJING_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 200px;
top:1110px;
}
#YULE_NEWS{
position:absolute; 
width:400px; 
z-index:1;
left: 800px;
top:1110px;
}

#fenge1{
position:absolute; 
z-index:-1;
left: 50px;
top:360px;
}
#fenge2{
position:absolute; 
z-index:-1;
left: -100px;
top:650px;
}
#fenge3{
position:absolute; 
z-index:-1;
left: -100px;
top:1000px;
}
#fenge4{
position:absolute; 
z-index:-1;
left: -100px;
top:1320px;
}
#fenge5{
position:absolute; 
z-index:-1;
left: 50px;
top:70px;
}

}

</style>
</head>
<body bgcolor="#FFF8DC">
<form action="Search.jsp?uid=<%=request.getParameter("uid")%>"  method="post"  style="padding-top:-700px;"> <center>
    <input type="text" name="sname" placeholder="请输入搜索内容..." value="" style="width:400px;height:40px"  >
    <button class="button" style="vertical-align:left" ><span>搜索 </span></button></center>
   </form>
    <br>
        <div id="GUIDE"> <font size=4>
         <a href="MainWeb.jsp" style="text-decoration:none ">首页&nbsp&nbsp</a>|       
         <a href="ClassifyNews.jsp?Cid=1" style="text-decoration:none ">&nbsp国内&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=2" style="text-decoration:none ">&nbsp国际&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=3" style="text-decoration:none ">&nbsp军事&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=4" style="text-decoration:none ">&nbsp财经&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=5" style="text-decoration:none ">&nbsp娱乐&nbsp&nbsp</a>|
         <a href="ClassifyNews.jsp?Cid=6" style="text-decoration:none ">&nbsp体育&nbsp&nbsp</a>
         </font></div>
    <div id="HOT_NEWS">
    <table border="0" width='400'   align="center">
    
      <tr>
        <th width="87" align="left">热门新闻</th>
      </tr>
      <%
      ResultSet rs=null; 
      Base.getConnection();
      rs=Base.selectSql("select top 10 * from news order by  newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>
        </td>

      </tr>
      <%
        }
      %>
    </table></div>
    
      <div id="fenge1">
     <img src="fg.png" width="800" height="100" >
    </div>
       <div id="fenge2">
     <img src="fg.png" width="1600" height="150" >
    </div>
        <div id="fenge3">
     <img src="fg.png" width="1600" height="150" >
    </div>
          <div id="fenge4">
     <img src="fg.png" width="1600" height="150" >
    </div>
          <div id="fenge5">
     <img src="fg.png" width="800" height="100" >
    </div>
    
    <div id="IMG">
         <h4>今日最热:<br></h4>
         <a href="NewsContent.jsp?id=N888&&uid=<%=request.getParameter("uid")%>">
         <img src="jrzr.jpg" width="450" height="280"  align="right">
         </a>

        <br><h4>热搜关键词:</h4>
         
         <a href="Search.jsp?sname=中国">
         <button class="button" style="vertical-align:left"  > 
         <span>中国</span></button></a>&nbsp&nbsp&nbsp&nbsp&nbsp
         <a href="Search.jsp?sname=习近平">
         <button class="button" style="vertical-align:left"  > 
         <span>习近平</span></button></a><br>
         <a href="Search.jsp?sname=发展">
         <button class="button" style="vertical-align:left" > 
         <span>发展</span></button></a>&nbsp&nbsp&nbsp&nbsp&nbsp
         <a href="Search.jsp?sname=世界">
         <button class="button" style="vertical-align:left"  > 
         <span>世界</span></button></a><br>
         <a href="Search.jsp?sname=两岸">
         <button class="button" style="vertical-align:left"  > 
         <span>两岸</span></button></a>&nbsp&nbsp&nbsp&nbsp&nbsp
         <a href="Search.jsp?sname=李克强">
         <button class="button" style="vertical-align:left"  > 
         <span>李克强</span></button></a><br>
         <a href="Search.jsp?sname=联合国">
         <button class="button" style="vertical-align:left"  > 
         <span>联合国</span></button></a>&nbsp&nbsp&nbsp&nbsp&nbsp
         <a href="Search.jsp?sname=专家">
         <button class="button" style="vertical-align:left"  > 
         <span>专家</span></button></a><br>
         </div>     
         
        
    <div id="GUONEI_NEWS">
    <table border="0" width='400'  align="right">
      <tr>
        <th width="87" align="left">
        <a href="ClassifyNews.jsp?Cid=1&&uid=<%=request.getParameter("uid")%>" style="text-decoration:none ">国内新闻</a></th>
      </tr>
      <% 
      rs=Base.selectSql("select top 10 * from news  where classifyID='1' order by  newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      
        <%
        }
        %>
    </table></div>

     <div id="GUOJI_NEWS">
    <table border="0" width='400'   align="center">
    
      <tr>
        <th width="87" align="left">       
         <a href="ClassifyNews.jsp?Cid=2&&uid=<%=request.getParameter("uid")%>" style="text-decoration:none ">国际新闻</a></th>
      </tr>
      <%
      rs=Base.selectSql("select top 10 * from news where classifyID='2' order by  newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      </tr>
      <%
        }
      %>
    </table></div>
    
        <div id="JUNSHI_NEWS">
    <table border="0" width='400'   align="center">
    
      <tr>
        <th width="87" align="left">       
         <a href="ClassifyNews.jsp?Cid=3&&uid=<%=request.getParameter("uid")%>" style="text-decoration:none ">军事新闻</a></th>
      </tr>
      <%
      rs=Base.selectSql("select top 10 * from news  where classifyID='3' order by  newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      </tr>
      <%
        }
      %>
    </table></div>
    
    <div id="CAIJING_NEWS">
    <table border="0" width='400'   align="center">
    
      <tr>
        <th width="87" align="left">       
         <a href="ClassifyNews.jsp?Cid=4&&uid=<%=request.getParameter("uid")%>" style="text-decoration:none ">财经新闻</a></th>
      </tr>
      <%
      rs=Base.selectSql("select top 10 * from news  where classifyID='4' order by   newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      </tr>
      <%
        }
      %>
    </table></div>
    
        <div id="YULE_NEWS">
    <table border="0" width='400'   align="center">
    
       <tr>
        <th width="87" align="left">       
         <a href="ClassifyNews.jsp?Cid=5&&uid=<%=request.getParameter("uid")%>" style="text-decoration:none ">娱乐新闻</a></th>
      </tr>
      <%
      rs=Base.selectSql("select top 10 * from news  where classifyID='5' order by  newWeight DESC");
        while(rs.next()){
      %>
      <tr>
        <td><li><a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>&&uid=<%=request.getParameter("uid")%>">
        <%=rs.getString("newTitle") %></a>      </tr>
      <%
        }
        Base.closeConn();
      %>
    </table></div>
 
</body>
</html>