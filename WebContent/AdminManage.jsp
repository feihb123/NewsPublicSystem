<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>部门用户查看新闻</title>
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
           <a href="admin.jsp" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">
                                   返回功能界面
           </p>
           </a>
           <hr>
           <h2>当日发布的新闻</h2>     
            <hr> 
            <a href="Refresh.jsp" style="color:6495ed;text-decoration:none;">
            <p style="text-align:right;font-size:1.2em;font-weight:bold">
                                   刷新排序
           </p>
           <a>
            <form action="AdminSearch.jsp"  method="post"  style="padding-top:-700px;">
            <center>
            <input type="text" name="sname"value="" style="width:200px;height:20px"  >            
            <button class="button" style="vertical-align:left;background-color:#fff8dc;" 
            onclick="AdminSearch.jsp" ><span>搜索 </span></button>
            </center>
            </form>
            <br/>
            <table border="1" bgcolor="#f0f8ff" align="center">
            <tr>
             <th align="center">顶置</th>
             <th align="center">新闻标题</th>
             <th align="center">管理新闻</th>
            </tr>
            <%
             ResultSet rs=null;
             Base.getConnection();
             rs=Base.selectSql("select * from News where newDate=Convert(varchar(10),Getdate(),111) order by  newWeight DESC" );
             while(rs.next()){
            %> 
            <tr>
             </td>
             <td align="center">
              <a href="Up.jsp?newsid=<%=rs.getString("newsID")%>" style="color:#ff4500;text-decoration:none;"> 顶置 </a>
              &nbsp;
               <a href="Down.jsp?newsid=<%=rs.getString("newsID")%>" style="color:#ff4500;text-decoration:none;"> 取消 </a>
              &nbsp;
             </td>
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
             }%>
             </table>
               <hr>
                <h2>今日发布评论</h2>   
                <hr>
             <table border="1" bgcolor="#f0f8ff" align="center">
            <tr>
             <th align="center">评价内容</th>
             <th align="center">管理评价</th>
            </tr>
           <%  
             rs=Base.selectSql("select * from Evaluation where evaluDate=Convert(varchar(10),Getdate(),111)");
             while(rs.next()){
            %> 
            <tr>
             <td>
              <a href="NewsContent.jsp?id=<%=rs.getString("newsID")%>" style="color:black;text-decoration:none;">
               <%=rs.getString("evaluContent")%>
              </a>
             </td>
             <td align="center">
              <a href="DeleteEva.jsp?con=<%=rs.getString("evaluContent")%>" style="color:FF4500;text-decoration:none;">删除</a>
             </td>
            </tr>  
            <%   
             }
             Base.closeConn();
            %>
             </table>
             
             
             <%
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