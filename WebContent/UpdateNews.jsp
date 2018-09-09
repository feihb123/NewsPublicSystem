<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//修改新闻操作
      request.setCharacterEncoding("utf-8");//解决插入数据时中文显示乱码的问题
      Base.getConnection();
      ResultSet rs=null;
      int i=0;
      rs=Base.selectSql("select classifyID from Classify where classifyName='"+request.getParameter("classifyname")+"'");
      rs.next();
      i=Base.addUpdDel("update News set newTitle='"+request.getParameter("newstitle")+"',classifyID='"+rs.getString("classifyID")+"',newContent='"+request.getParameter("newscontent")+"',newDate=getDate() where newsID='"+request.getParameter("newsid")+"'");
      if(i==1){
    	  out.println("<script>alert('新闻修改成功！');history.back(-1);</script>");
      }else{
    	  out.println("<script>alert('新闻修改失败！');history.back(-1);</script>");
      }
      Base.closeConn();
     %>