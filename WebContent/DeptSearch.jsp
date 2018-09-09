<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>部门用户搜索新闻</title>	
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
           <a href="ManageNews.jsp?id=<%=request.getParameter("id")%>" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">  
                                   返回管理界面
           </p>
           </a>
           <hr>
            <%
             String name = request.getParameter("sname"); 
             name = new String(name.getBytes("ISO8859_1"), "UTF-8"); 
             ResultSet rs=null;
             Base.getConnection();
             %>
           <h2>部门用户管理新闻--"<%=name %>"的查询结果</h2>  
            <hr> 
            <br/>
            <table border="1" bgcolor="#f0f8ff" align="center">
            <tr>
             <th align="center">新闻标题</th>
             <th align="center">管理新闻</th>
            </tr>
            <%
             rs=Base.selectSql("select newsID,newTitle from News,DeptUser where News.deptID=DeptUser.deptID and DuserID='"+request.getParameter("id")+"' and newTitle like '%"+name+"%' order by newWeight DESC");
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
            <br/> <br/> <br/> <br/> <br/> <br/> <br/>       
            <br/>
           <div id="footer">
                                  智能新闻发布推送系统
           </div>             
</body>
</html>