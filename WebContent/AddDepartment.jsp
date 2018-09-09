<%@ page language="java" import="newsSystem.*" import="java.sql.*" pageEncoding="UTF-8"%>
     <%//增加部门操作
     request.setCharacterEncoding("utf-8");//解决插入数据时中文显示乱码的问题              
      Base.getConnection();
       int i=0;
       i=Base.addUpdDel("insert into Department(deptID,deptName) values('"+request.getParameter("deptid")+"','"+request.getParameter("deptname")+"')"); 
       if(i!=0){    	   
      	  out.println("<script>alert('部门添加成功！');history.back(-1);</script>");     	  
       }
       else{
    	   out.print("<script>alert('部门添加失败！');history.back(-1);</script>");
       }
      Base.closeConn();
     %>   