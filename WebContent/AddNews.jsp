<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//增加新闻操作
     request.setCharacterEncoding("utf-8");//解决插入数据时中文显示乱码的问题              
      ResultSet rs=null;
      Base.getConnection();
      rs=Base.selectSql("select classifyID,deptID from Classify,DeptUser where classifyName='"+request.getParameter("classifyname")+"' or deptID='"+request.getParameter("id")+"'");   
      while(rs.next()){
       int i=0;
       i=Base.addUpdDel("insert into News(newsID,newTitle,classifyID,deptID,newContent,newDate) values('"+request.getParameter("newsid")+"','"+request.getParameter("newstitle")+"','"+rs.getString("classifyID")+"','"+rs.getString("deptID")+"','"+request.getParameter("newscontent")+"',getDate())"); 
       if(i!=0){    	   
      	  out.println("<script>alert('新闻发布成功！');history.back(-1);</script>");     	  
       }
       else{
    	   out.print("<script>alert('新闻发布失败！');history.back(-1);</script>");
       }
      }
      Base.closeConn();
     %>   