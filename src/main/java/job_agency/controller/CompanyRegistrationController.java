package job_agency.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import job_agency.model.Company;

@Controller
public class CompanyRegistrationController {
	@RequestMapping("/showcompanyregister")
	 public ModelAndView showRegister() {
  	  return new ModelAndView("company_register","companyobj",new Company());
    }
}
