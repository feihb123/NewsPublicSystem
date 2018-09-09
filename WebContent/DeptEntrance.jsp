<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>部门用户功能界面</title>
<link rel="stylesheet" href="css/style.css">
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
<body style="background-color:#fffff0;background-image: url(1.png);">
           <div id="header">
           <p>The Functions of Departmental Users</p>
            <h1>部门用户功能</h1>
          当前时间： <b id="ctime">
           <script>
            document.getElementById('ctime').innerHTML= new Date().toLocaleString();
            setInterval("document.getElementById('ctime').innerHTML=new Date().toLocaleString();",1000);
           </script>
           </b>
           </div> 
           <br/>
           <br/>
           <div class="htmleaf-container">
		    <nav>
		     <ul class="menu">
		      <li><a href="DeptEntrance.jsp" style="font-weight:bold">首页</a></li>
		      <li><a href="MainWeb.jsp" style="font-weight:bold">查看新闻</a></li>
		      <li><a href="PublicNews.jsp?id=<%=request.getParameter("id") %>" style="font-weight:bold">发布新闻</a></li>
		      <li><a href="ManageNews.jsp?id=<%=request.getParameter("id") %>" style="font-weight:bold">管理新闻</a></li>
		      <li><a href="Login.jsp" style="font-weight:bold">返回登录界面</a></li>
		     </ul>
		    </nav>	
	       </div>
	       <hr>
	       <br/>
	       <br/>
	       <br/>
	       <br/>
	       <br/>
	       <br/>
            <p style="font-weight:bold;font-size:40px;text-align:center;color:#d94f5c;">
                                   智能新闻发布推送系统欢迎您！
            </p>
            <br/> 
            <br/>
            <br/>      
            <br/>
            <br/>
            <br/>
           <div id="footer">
                                  智能新闻发布推送系统
           </div> 
</body>
</html>