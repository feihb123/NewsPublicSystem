package newsSystem;


import java.io.IOException;  
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  


public class EvaServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet  doPost方法 
public void doGet(HttpServletRequest request, HttpServletResponse response)  
throws ServletException, IOException {  
    doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method 
}  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
throws ServletException, IOException {  
	
    String name = request.getParameter("ename"); //得到jsp页面传过来的参数 
    name = new String(name.getBytes("ISO8859_1"), "UTF-8");//否则出现乱码!!
    String newsID = request.getParameter("newsID");
    newsID = new String(newsID.getBytes("ISO8859_1"), "UTF-8");
    String eva = request.getParameter("eva"); 
    eva = new String(eva.getBytes("ISO8859_1"), "UTF-8");
    Date day=new Date();
    SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time=df.format(day);
    try {
		Base.getConnection();
		String sql="insert into Evaluation values('"+name+"','"+newsID+"','"+eva+"','"+time+"')";
		Base.addUpdDel(sql); 
		Base.addUpdDel("update news set evaluNumber=evaluNumber+1 where newsID='"+newsID+"'"); 
		Base.closeConn();
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
    
    

  } 
}  
