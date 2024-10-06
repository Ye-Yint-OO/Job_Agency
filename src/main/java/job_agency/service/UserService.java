package job_agency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import job_agency.model.User;
import job_agency.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	
	public int insertUser(User user) {
		if (userRepository.doesUserExist(user.getEmail())) {
            
            return -1; 
        }
		return userRepository.insertUser(user);
	}
	
	 public boolean checkEmail(String email) {
		 if(userRepository.checkEmail(email)!=false) {
			 return userRepository.checkEmail(email);
		 }else {
			 return false;
		 }
	 }
	
}
