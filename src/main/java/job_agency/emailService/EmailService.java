package job_agency.emailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
public class EmailService {

    private static final Logger logger = LoggerFactory.getLogger(EmailService.class);
    
    @Autowired
    private JavaMailSender mailSender;

    public void sendOtpEmail(String toEmail, String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("Your OTP Code");
            message.setText("Dear User,\n\nYour OTP code is: " + otp + "\n\nThis OTP is valid for 5 minutes.\n\nRegards,\nYourApp Team");
            mailSender.send(message);
            logger.info("Sent OTP to {}", toEmail);
            System.out.println("OTP"+otp);
        } catch (Exception e) {
            logger.error("Error sending OTP to {}: {}", toEmail, e.getMessage());
        }
    }
}
