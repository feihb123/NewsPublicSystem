<%@ page language="java" import="java.util.*,java.util.Date,java.text.SimpleDateFormat" 
import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>部门用户发布新闻</title>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:3px;
    box-shadow:5px 5px 3px #888888;
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
    padding:5px;
    box-shadow:5px 5px 3px #888888;	 	 
}
</style>
</head>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String date= format.format(new Date());
%>
<body style="background-color:#fffff0;background-image: url(1.png);background-position:0% 100%;">
           <div id="header">
            <p>Public News</p>
            <h1>发布新闻</h1>
          当前时间： <b id="ctime">
           <script>
            document.getElementById('ctime').innerHTML= new Date().toLocaleString();
            setInterval("document.getElementById('ctime').innerHTML=new Date().toLocaleString();",1000);
           </script>
           </b>
           </div>
           <a href="DeptEntrance.jsp?id=<%=request.getParameter("id")%>" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">
                                   返回功能界面
           </p>
           </a>
           <hr>
           <h2>填写新闻信息</h2>     
           <hr>
           <center>
           <form action="AddNews.jsp?id=<%=request.getParameter("id")%>" name="thisform" method="post" >
               新闻编号：<input type="text" name="newsid" maxlength='8' required/>
             &nbsp;&nbsp;
              新闻标题：<input type="text" name="newstitle" maxlength='24' required/>
             <br/>
             <br/>          
               新闻类别：<select name="classifyname">
               <%
               ResultSet rs=null;
               Base.getConnection();
               rs=Base.selectSql("select classifyName from Classify");
               while(rs.next()){
               %>
               <option value="<%=rs.getString("classifyName")%>"><%=rs.getString("classifyName")%></option>
               <%
                }
                Base.closeConn();
               %>
             </select>     
             <br/>
             <br/>
               新闻内容：
             <br/>
             <textarea rows="20" cols="60" name="newscontent" required></textarea>
             <br/>
             <br/>
               发布时间：<input type="text" name="validateCode" name="newsdate" value="<%=date%>"/>
             <br/>
             <br/>
            <input style="background-color:#fff8dc;" type="submit" value="发布新闻">     
             &nbsp;&nbsp;&nbsp;&nbsp;
            <button style="background-color:#fff8dc;" type="button" 
            onclick = "window.location='DeptEntrance.jsp?id=<%=request.getParameter("id")%>'">返回功能界面</button> 
           </form> 
           </center>          
           <br/>
           <br/>
           <div id="footer">
                                  智能新闻发布推送系统
           </div>
</body>
</html>