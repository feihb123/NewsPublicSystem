<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link  rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
Base.getConnection();
ResultSet rs=null;
rs=Base.selectSql("select * from news where newsID='"+request.getParameter("id")+"'");
rs.next();
int count=rs.getInt("newVisits")+1;
Base.addUpdDel("update news set newVisits="+count+" where newsID='"
                +request.getParameter("id")+"'");
%>
<style>
.news {
    background-color:"#FFF8DC";
    color:black;
    margin:80px;
    padding:20px;
}

.eva {
position:relative; 
width:400px; 
z-index:1;
right:35px

}	
</style>
</head>
<title><% out.print(rs.getString("newTitle")); %>  </title>
<body bgcolor="#FFF8DC">

<a href="MainWeb.jsp?uid=<%=request.getParameter("uid")%>" style="color:6495ed;text-decoration:none;">
           <p style="text-align:right;font-size:1.2em;font-weight:bold">  
                                   返回主页
           </p>
           </a>
<div class="news">
<center><font size=5><% out.print(rs.getString("newTitle"));%></font></center>
<center><font size=4>发布时间:<% out.print(rs.getString("newDate"));%> 

&nbsp&nbsp&nbsp点击量:<% out.print(rs.getString("newVisits"));%> </font></center>
<p><font size=4><% out.print(rs.getString("newContent").replaceAll("   ","<br>&nbsp;&nbsp;&nbsp;"));%></font></p></div>

<center>

<form action="EvaCheck.jsp"  method="post"  style="padding-top:-700px;"> 

<div id="content" style="width: 700px; height: auto;margin-top:40px; " align="center">
	<div class="wrap">
		<div class="comment">
			<div class="head-face">
				<img src="xzit.jpg"  >
				<p><%=request.getParameter("uid") %></p>
			</div>
			<input type="text" name="newsID" 
			 size=1 readonly value="<%out.print(rs.getString("newsID").trim());%>" 
             style="display:none">
             <input type="text" name="ename" 
			 size=10 readonly value="<%=request.getParameter("uid")%>" 
             style="display:none">
             
			<div class="content">
				<div class="cont-box">
					<textarea class="text" placeholder="请输入评论..." name="eva"></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  ></span><span class="img-icon"></span></div>
					<div class="submit-btn"><input  type="submit" name="public_eva" value="提交评论" /></div>
				</div>
			</div>
		</div>
		<div id="info-show">
			<ul></ul>
		</div>
	</div>
</div>

</form>

    <img src="fg.png" width="1400" height="100" >

<div class="eva">
    <table border="0" width='600'   align="center">
    
      <tr>
        <th width="87" align="left">当前评论:</th>
      </tr>
      <% 
      rs=Base.selectSql("select top 10 * from Evaluation where newsID='"
                          +request.getParameter("id")+"' ORDER BY evaluDate DESC");
        while(rs.next()){
      %>
      <tr>
        <td><%=rs.getString("userID") %></td>
        <td><%=rs.getString("evaluContent") %></td>
        <td><%=rs.getString("evaluDate") %></td>
      </tr>
      <%
        }
        Base.closeConn();
      %>
    </table>
</div>
</div>
</center>

     <img src="fg.png" width="1400" height="100" >


</body>
</html>