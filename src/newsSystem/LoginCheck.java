package newsSystem;

import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginCheck {

	public boolean loginCheck(String name,String PWD,String role) throws ClassNotFoundException, SQLException {

		String sql=" ";
		if(role.equals("admin")) {
			sql="select * from Admin where adminID='"+name+"'and adminPW='"+PWD+"'";
		}
			else if(role.equals("depter")) {
				sql="select * from DeptUser where DuserID='"+name+"'and DuserPW='"+PWD+"'";
			}else if(role.equals("user")) {
				sql="select * from Users where userID='"+name+"'and userPW='"+PWD+"'";	
		}
		return query(sql);
	}
	private boolean query(String sql) throws ClassNotFoundException, SQLException {
		boolean pwdCheck=false;
		Base.getConnection();
		ResultSet rs = Base.selectSql(sql);  
		while(rs.next()) pwdCheck=true;
		Base.closeConn();
		return pwdCheck;
	}
	
	
}


