<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="newsSystem.*" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <%//删除评论操作
     String con = request.getParameter("con"); 
     con = new String(con.getBytes("ISO8859_1"), "UTF-8"); 
      int i=0;
      Base.getConnection();
      i=Base.addUpdDel("delete from Evaluation where evaluContent='"+con+"'");
      if(i==1){
     	  out.println("<script>alert('评论删除成功！');history.back(-1);</script>");
       }else{
     	  out.println("<script>alert('评论删除失败！');history.back(-1);</script>");
       }
      Base.closeConn();
     %>