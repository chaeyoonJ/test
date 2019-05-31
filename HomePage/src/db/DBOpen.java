package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
     public static Connection open() {
    	 Connection con = null;
    	 
    	 try {
			Class.forName(Constant.DRIVER);//드라이버 로딩
			
			con = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWORD);
		 } catch (ClassNotFoundException e) {
	
			e.printStackTrace();
		}  
 catch (SQLException e) {
	
			e.printStackTrace();
		}
    	 return con;
     }

	   public static Connection getConnection() {
 		Connection con = null;
 		
 		try {
 			Class.forName(Constant.DRIVER);
 			
 			con = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWORD);
 			
 		} catch (ClassNotFoundException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		
 		return con;
 	}
}
