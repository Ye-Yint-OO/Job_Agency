package job_agency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job_agency.model.Company;
import job_agency.repository.CompanyRepository;

@Service
public class CompanyService {
	@Autowired
	private CompanyRepository companyRepository;

	
	public int insertCompany(Company company) {
		if (companyRepository.doesCompanyExist(company.getCompany_email())) {
            
            return -1; 
        }
		return companyRepository.insertCompany(company);
	}
	
	 public boolean checkEmail(String email) {
		 if(companyRepository.checkEmail(email)!=false) {
			 return companyRepository.checkEmail(email);
		 }else {
			 return false;
		 }
		 
	 }
	 
	 public boolean checkPhone(String phone) {
		 return companyRepository.checkPhone(phone);
	 }
	 
	 public Company findUserByEmail(String email) {
		    return companyRepository.findCompanyByEmail(email);
		}
	 public void updatePassword(String email, String hashedPassword) {
		 companyRepository.updatePassword(email, hashedPassword);
		}
	
}
