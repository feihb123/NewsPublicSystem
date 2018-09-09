<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//删除部门操作
     int i=0;
      Base.getConnection();
      i=Base.addUpdDel("delete from Department where deptID='"+request.getParameter("deptid")+"'");
      if(i==1){
     	  out.println("<script>alert('成功删除该部门！');history.back(-1);</script>");
       }else{
     	  out.println("<script>alert('删除部门失败！');history.back(-1);</script>");
       }
      Base.closeConn();
     %>