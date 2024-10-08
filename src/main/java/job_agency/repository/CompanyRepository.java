package job_agency.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import job_agency.model.Company;
import job_agency.model.User;

@Repository
public class CompanyRepository {
	
	public int insertCompany(Company company) {
	    String sql = "INSERT INTO company (email, password, main_contact_name, company_name, phone,industry,number_of_employes) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = MyConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	    	
	    	 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            String hashedPassword = passwordEncoder.encode(company.getCompany_password());

	            pstmt.setString(1, company.getCompany_email());  // First Name
	            pstmt.setString(2, hashedPassword);   // Last Name
	            pstmt.setString(3, company.getMain_contact_name());       // Email
	            pstmt.setString(4, company.getCompany_name());        // Password (hashed)
	            pstmt.setString(5, company.getPhone());       // Phone
	            pstmt.setString(6, company.getIndustry());      // Gender
	            pstmt.setString(7, company.getNo_of_employees()); 

	        return pstmt.executeUpdate(); 

	    } catch (SQLException e) {
	        System.out.println("Error inserting company: " + e.getMessage());
	        return 0;  
	    }
	}
	
	 public boolean doesCompanyExist(String CompanyEmail) {
	        String sql = "SELECT COUNT(*) FROM company WHERE email = ?";
	        try (Connection conn = MyConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {

	            pstmt.setString(1,CompanyEmail);

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
			String sql ="select * from company where email = ?";
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
	 
	 public boolean checkPhone(String phone) {
		 boolean check=false;
		 Connection con = MyConnection.getConnection();
			String sql ="select * from company where phone = ?";
			 try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,phone);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					check=true;
				}
				
			} catch (SQLException e) {
				System.out.println("Check Phone:"+e.getMessage());
			}
			
			return check;
	
	
	 }
	 
	 
	 public Company findCompanyByEmail(String email) {
		    String sql = "SELECT * FROM company WHERE email = ?";
		    try (Connection conn = MyConnection.getConnection();
		         PreparedStatement pstmt = conn.prepareStatement(sql)) {

		        pstmt.setString(1, email);
		        try (ResultSet rs = pstmt.executeQuery()) {
		            if (rs.next()) {
		                Company company = new Company();
		                company.setCompany_email(rs.getString("email"));
		                company.setCompany_password(rs.getString("password"));
		                company.setCompany_name(rs.getString("company_name"));// hashed password
		                return company;
		            }
		        }
		    } catch (SQLException e) {
		        System.out.println("Error finding user by email: " + e.getMessage());
		    }
		    return null;
		}
	 
	 public void updatePassword(String email, String hashedPassword) {
		    String sql = "UPDATE company SET password = ? WHERE email = ?";
		    try (Connection conn = MyConnection.getConnection();
		         PreparedStatement pstmt = conn.prepareStatement(sql)) {
		    	 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		            String hashedPass = passwordEncoder.encode(hashedPassword);

		        pstmt.setString(1, hashedPass);
		        pstmt.setString(2, email);
		        pstmt.executeUpdate();

		    } catch (SQLException e) {
		        System.out.println("Error updating password: " + e.getMessage());
		    }
		}
		 
		 
	 }


