package job_agency.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Company {
	private int company_id;
	private String company_email;
	private String company_password;
	private String main_contact_name;
	private String company_name;
	private String phone;
	private String industry;
	private String no_of_employees;
	private String company_photo_URL;
	private Location location_id;
	private MultipartFile company_photo_file;// to handel file
}
