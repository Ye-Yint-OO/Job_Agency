package job_agency.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import job_agency.model.User;

@Repository
public class UserRepository {
	
	public int insertUser(User user) {
	    String sql = "INSERT INTO user (first_name, last_name, email, password, phone, gender, age) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = MyConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	    	
	    	 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            String hashedPassword = passwordEncoder.encode(user.getPassword());

	            pstmt.setString(1, user.getFirst_name());  // First Name
	            pstmt.setString(2, user.getLast_name());   // Last Name
	            pstmt.setString(3, user.getEmail());       // Email
	            pstmt.setString(4, hashedPassword);        // Password (hashed)
	            pstmt.setString(5, user.getPhone());       // Phone
	            pstmt.setString(6, user.getGender());      // Gender
	            pstmt.setInt(7, user.getAge()); 

	        return pstmt.executeUpdate(); 

	    } catch (SQLException e) {
	        System.out.println("Error inserting user: " + e.getMessage());
	        return 0;  
	    }
	}
	
	 public boolean doesUserExist(String UserEamil) {
	        String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
	        try (Connection conn = MyConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {

	            pstmt.setString(1,UserEamil);

	            try (ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    return rs.getInt(1) > 0;
	                }
	            }

	        } catch (SQLException e) {
	            System.out.println("Error checking if email exists: " + e.getMessage());
	        }
	        return false;
	    }
	 
	 public boolean checkEmail(String email) {
			boolean check=false;
			Connection con = MyConnection.getConnection();
			String sql ="select * from user where email = ?";
			 try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,email);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					check=true;
				}
				
			} catch (SQLException e) {
				System.out.println("Check email:"+e.getMessage());
			}
			
			return check;
	
	
	 }

}
