<%@ page language="java" import="newsSystem.*" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理员管理新闻</title>
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
           <p>Manage News</p>
            <h1>管理新闻</h1>
          当前时间： <b id="ctime">
           <script>
            document.getElementById('ctime').innerHTML= new Date().toLocaleString();
            setInterval("document.getElementById('ctime').innerHTML=new Date().toLocaleString();",1000);
           </script>
           </b>
           </div>
           <a href="admin.jsp?id=<%=request.getParameter("id")%>" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">
                                   返回功能界面
           </p>
           </a>
           <hr>
           <h2>当日新闻</h2> 
            <hr> 
            <form action="AdminSearch.jsp?id=<%=request.getParameter("id")%>"  method="post"  style="padding-top:-700px;">
            <center>
            <input type="text" name="sname"value="" style="width:200px;height:20px"  >            
            <button class="button" style="vertical-align:left;background-color:#fff8dc;" onclick="SeeNews.jsp" ><span>搜索 </span></button>
            </center>
            </form>
            <br/>
            <table border="1" bgcolor="#f0f8ff" align="center">
            <tr>
             <th align="center">新闻标题</th>
             <th align="center">管理新闻</th>
            </tr>
            <%
             ResultSet rs=null;
             Base.getConnection();
             rs=Base.selectSql("select newsID,newTitle from News where newDate='"+date+"' order by newWeight DESC");
             while(rs.next()){
            %> 
            <tr>
             <td>
              <a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>" style="color:black;text-decoration:none;">
               <%=rs.getString("newTitle")%>
              </a>
             </td>
             <td align="center">
              <a href="EditNews.jsp?newsid=<%=rs.getString("newsID")%>" style="color:#ff4500;text-decoration:none;">编辑</a>
              &nbsp;
              <a href="DeleteNews.jsp?newsid=<%=rs.getString("newsID")%>" style="color:#ff4500;text-decoration:none;">删除</a>
             </td>
            </tr>         
            <%
             }
             Base.closeConn();
            %>
            </table>
            <hr>
            <h2>当日评论</h2> 
            <table border="1" bgcolor="#f0f8ff" align="center">
            <tr>
             <th align="center">评论内容</th>
             <th align="center">管理评论</th>
            </tr>
            <%
             ResultSet rs1=null;
             Base.getConnection();
             rs1=Base.selectSql("select evaluContent from Evaluation where evaluDate='"+date+"'");
             while(rs1.next()){
            %> 
            <tr>
             <td>
               <%=rs1.getString("evaluContent")%>
             </td>
             <td align="center">
              <a href="DeleteEvalu.jsp?content=<%=rs1.getString("evaluContent")%>" style="color:#ff4500;text-decoration:none;">删除</a>
             </td>
            </tr>         
            <%
             }
             Base.closeConn();
            %>
            </table>
            <br/>       
            <br/>
           <div id="footer">
                                  智能新闻发布推送系统
           </div>             
</body>
</html>