<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>部门用户编辑新闻</title>
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
            <p>Edit News</p>
            <h1>编辑新闻</h1>
          当前时间： <b id="ctime">
           <script>
            document.getElementById('ctime').innerHTML= new Date().toLocaleString();
            setInterval("document.getElementById('ctime').innerHTML=new Date().toLocaleString();",1000);
           </script>
           </b>
           </div>
           <%
            ResultSet rs=null;
            Base.getConnection();
            rs=Base.selectSql("select DuserID,newsID,newTitle,classifyName,newContent,newDate from news,DeptUser,Classify where News.deptID=DeptUser.deptID and News.classifyID=Classify.classifyID and newsID='"+request.getParameter("newsid")+"'");
            rs.next(); 
            %>
           <a href="ManageNews.jsp?id=<%=rs.getString("DuserID")%>" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">  
                                   返回管理界面
           </p>
           </a>
           <hr>
           <h2>修改新闻信息</h2>     
           <hr>
           <center>
           <form  action="UpdateNews.jsp" name="thisform" method="post" >
              新闻编号：<input type="text" name="newsid" value="<%=rs.getString("newsID")%>" readonly="readonly"/>
             &nbsp;&nbsp;
              新闻标题：<input type="text" name="newstitle" id="newstitle"value="<%=rs.getString("newTitle")%>" maxlength='40' required/>
             <br/>
             <br/>
              新闻类别：<select name=classifyname>
               <option value="<%=rs.getString("classifyName")%>" selected="selected"><%=rs.getString("classifyName") %></option>
               <%
                ResultSet  rs1=Base.selectSql("select classifyName from Classify where classifyName!='"+rs.getString("classifyName")+"'");
                while(rs1.next()){
               %>
               <option value="<%=rs1.getString("classifyName")%>"><%=rs1.getString("classifyName")%></option>
               <%
               }
               %>
             </select> 
             <br/>
             <br/>
              新闻内容：
             <br/>
             <textarea rows="20" cols="60" name="newscontent" required><%=rs.getString("newContent")%></textarea>
             <br/>
             <br/>
              发布时间：<input type="text" name="newsdate" value="<%=rs.getString("newDate")%>"/>
             <br/>
             <br/>
             <input style="background-color:#fff8dc;" type="submit" value="确定修改"> 
              &nbsp;&nbsp;&nbsp;&nbsp;
             <button style="background-color:#fff8dc;" type="button" 
              onclick = "window.location='ManageNews.jsp?id=<%=rs.getString("DuserID")%>'">返回管理界面</button>                       	  
            </form> 
            </center>
<%
Base.closeConn();
%>
           <br/>
           <br/>
           <div id="footer">
                                  智能新闻发布推送系统
           </div>    	    
</body>
</html>