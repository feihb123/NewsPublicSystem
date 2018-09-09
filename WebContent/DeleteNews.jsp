<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//删除新闻操作
     int i=0;
      Base.getConnection();
      i=Base.addUpdDel("delete from News where newsID='"+request.getParameter("newsid")+"'");
      if(i==1){
     	  out.println("<script>alert('成功删除该新闻！');history.back(-1);</script>");
       }else{
     	  out.println("<script>alert('删除新闻失败！');history.back(-1);</script>");
       }
      Base.closeConn();
     %>