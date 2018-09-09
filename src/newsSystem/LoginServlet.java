package newsSystem;
  
import java.io.IOException;  
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.script.ScriptEngineManager;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  


public class LoginServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet  doPost方法 
public void doGet(HttpServletRequest request, HttpServletResponse response)  
throws ServletException, IOException {  
    doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method 
}  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
throws ServletException, IOException {  
    String name = request.getParameter("name"); //得到jsp页面传过来的参数 
    String pwd = request.getParameter("pwd");  
    String role = request.getParameter("status");
    System.out.println(role);
    LoginCheck c = new LoginCheck();  
    PrintWriter out;//使用script语句
try {
	if(c.loginCheck(name, pwd,role)){
		if(role.equals("user")){
			request.getRequestDispatcher("MainWeb.jsp?uid="+name).forward(request, response);
		}
		if(role.equals("admin")){
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		if(role.equals("depter")){
			request.getRequestDispatcher("DeptEntrance.jsp?id="+name).forward(request, response);
		}
		
	      
	    }else{  
			out = response.getWriter();
            out.print("<script>alert('账号或密码错误!'); "
            		+ "window.history.back(-1);</script>");
            out.close();
	        //response.sendRedirect("Login.jsp"); //重定向到首页

	    }
} catch (ClassNotFoundException | SQLException e) {
	e.printStackTrace();
}  
}  
}