<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//删除评论操作
     request.setCharacterEncoding("utf-8");//解决插入数据时中文显示乱码的问题  
     int i=0;
      Base.getConnection();
      i=Base.addUpdDel("delete from Evaluation where evaluContent='"+request.getParameter("content")+"'");
      if(i==1){
     	  out.println("<script>alert('成功删除该评论！');history.back(-1);</script>");
       }else{
     	  out.println("<script>alert('删除评论失败！');history.back(-1);</script>");
       }
      Base.closeConn();
     %>