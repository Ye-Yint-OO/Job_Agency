package job_agency.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import job_agency.emailService.EmailService;
import job_agency.emailService.OtpService;
import job_agency.emailService.OtpStorageService;
import job_agency.model.User;
import job_agency.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private EmailService emailService;
	
	  @Autowired
	private OtpStorageService otpStorageService;
	  
	  @Autowired
	private OtpService otpService;
	  
	  @RequestMapping("/login")
	    public String showRegistrationForm(Model model) {
	        model.addAttribute("user", new User());
	        return "login"; 
	    }
	  
	  @PostMapping("/dologin")
	  public ModelAndView loginUser(@ModelAttribute("user") User user, HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      
	      // Validate email format
	      if (!isValidEmail(user.getEmail())) {
	          mav.setViewName("login");
	          mav.addObject("EmailInvalid", "Invalid email format.");
	          return mav;
	      }

	      // Check if email exists in the database
	      if (!userService.checkEmail(user.getEmail())) {
	          mav.setViewName("login");
	          mav.addObject("EmailNotExist", "Email is not registered.");
	          return mav;
	      }else {
	    	  
	      
	      
	      // Authenticate user by checking the password
	      User dbUser = userService.findUserByEmail(user.getEmail());
	      BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	      
	      if (dbUser != null && passwordEncoder.matches(user.getPassword(), dbUser.getPassword())) {
	          // Successful login, store user info in session
	          session.setAttribute("loggedUser", dbUser);
	          mav.setViewName("index");  // Redirect to home page or dashboard
	      } else {
	          mav.setViewName("login");
	          mav.addObject("LoginFailed", "Incorrect email or password.");
	      }
	      }
	      
	      return mav;
	  }
	      
	  @RequestMapping("/forgotPassword")
	    public String showForgotPasswordPage(Model model) {
	        model.addAttribute("user", new User());
	        return "forgot_password"; // This JSP is where the user enters their email
	    }
	  
	  @PostMapping("/sendOtp")
	  public ModelAndView sendOtp(@RequestParam("email") String email, HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      session.setAttribute("ForGoterEmail", email);

	      // Check if the email exists in the system
	      if (!userService.checkEmail(email)) {
	          mav.setViewName("forgot_password");
	          mav.addObject("EmailNotExist", "Email is not registered.");
	          return mav;
	      }

	      // Generate OTP
	      String otp = otpService.generateOtp();

	      // Save OTP to storage (associate OTP with the email)
	      otpStorageService.storeOtp(email, otp);

	      // Send OTP via email
	      emailService.sendOtpEmail(email, otp);

	      // Redirect to the OTP entry page
	      mav.setViewName("enter_otp");
	      mav.addObject("email", email); // Pass email for verification later

	      return mav;
	  }

      
	        
	  @PostMapping("/verify-login-Otp")
	  public ModelAndView verifyOtp(@RequestParam("otp") String otp, @RequestParam("email") String email) {
	      ModelAndView mav = new ModelAndView();
	      
	      // Log the email and OTP to confirm values received
	      System.out.println("Received email: " + email);
	      System.out.println("Received OTP: " + otp);

	      // Check if OTP is valid
	      if (otpStorageService.validateOtp(email, otp)) {
	          mav.setViewName("reset_password");
	          mav.addObject("email", email);  // Pass email to reset password
	      } else {
	          mav.setViewName("enter_otp");
	          mav.addObject("OtpInvalid", "Invalid OTP. Please try again.");
	      }

	      return mav;
	  }
	  
	  @PostMapping("/resetPassword")
	  public ModelAndView resetPassword(@RequestParam("email") String email, 
	                                    @RequestParam("newPassword") String newPassword, 
	                                    @RequestParam("confirmPassword") String confirmPassword,
	                                    HttpSession session
	                                    ) {
	      ModelAndView mav = new ModelAndView();
	      User dbUser = userService.findUserByEmail(email);
	      if (!newPassword.equals(confirmPassword)) {
	          mav.setViewName("reset_password");
	          mav.addObject("email", email);
	          mav.addObject("PasswordMismatch", "Passwords do not match. Please try again.");
	          return mav;
	      }

	      // Reset the password in the system
	      userService.updatePassword(email, newPassword);
	      session.setAttribute("loggedUser", dbUser);
	      // Redirect to login page after successful password reset
	      mav.setViewName("home");
	      mav.addObject("PasswordResetSuccess", "Password has been successfully reset.");
	      return mav;
	  }
	

	  @GetMapping("/resend-Otp")
	  public ModelAndView resendOtp(HttpSession session) {
	      ModelAndView mav = new ModelAndView();

	      // Retrieve the user's email from the session
	      String pendingEmail = (String) session.getAttribute("ForGoterEmail");

	      if (pendingEmail == null) {
	          mav.setViewName("login");
	          mav.addObject("sessionExpired", "Session expired. Please register again.");
	          return mav;
	      }

	      // Invalidate the previous OTP
	      otpStorageService.invalidateOtp(pendingEmail);

	      // Regenerate a new OTP
	      String newOtp = otpService.generateOtp();

	      // Store the new OTP in the OTP storage service
	      otpStorageService.storeOtp(pendingEmail, newOtp);

	      // Send the OTP to the user's email
	      emailService.sendOtpEmail(pendingEmail, newOtp);

	      // Redirect back to the OTP verification page with a success message
	      mav.setViewName("enter_otp");
	      mav.addObject("email", pendingEmail);  // Ensure the email is passed to the view
	      mav.addObject("message", "A new OTP has been sent to your email.");

	      return mav;
	  }

	  
	  
	  
	  
	  private boolean isValidEmail(String email) {
	      
	        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	        return email.matches(emailRegex);
	    }
}
