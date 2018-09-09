package newsSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Base {
	private static final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String URL="jdbc:sqlserver://localhost:1433;databaseName=NEWSPUBLICSYSTEM";
	private static final String UID="sa";
	private static final String PWD="666666";
	protected static Connection conn=null;
	protected static PreparedStatement ps=null;
	protected static ResultSet rs=null;
    public static void getConnection() throws ClassNotFoundException,SQLException{
	
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL, UID, PWD);
			System.out.println("success");

	}
    public static int addUpdDel(String sql) {
		int i = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql数据库增删改异常");
			e.printStackTrace();
		}
		return i;
	}

    
    public static ResultSet selectSql(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			System.out.println("sql数据库查询异常");
			e.printStackTrace();
		}
		return rs;
	}

    public static void closeConn() {
    	try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("sql数据库关闭异常");
			e.printStackTrace();
		}

      
    }
}
