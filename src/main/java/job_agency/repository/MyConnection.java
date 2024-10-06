package job_agency.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Component;



@Component
public class MyConnection {
	public static Connection  getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Job_Agency", "root", "yan_kee4");
			System.out.println("Connection.........");	
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver error :"+e.getMessage());
		} catch (SQLException e) {
			System.out.println("UserConnection  Error"+e.getMessage());
		}
		return conn;
		
	}
	

}