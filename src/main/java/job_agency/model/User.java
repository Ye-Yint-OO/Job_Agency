package job_agency.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User {
	private int id;
	private String first_name;
	private String last_name;
	private String email;
	private String password;
	private String phone;
	private String gender;
	private int age;
	private String role; //has defult
	private String user_photo_URL; // //has defult
	
	private MultipartFile user_photo_file;// to handel file
	
	

}
