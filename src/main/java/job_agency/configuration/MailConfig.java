package job_agency.configuration;

import java.util.Properties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        // Set your SMTP server details
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        
        mailSender.setUsername("otpsend206@gmail.com"); // Replace with your email
        mailSender.setPassword("dbuygifjmwvwlwem"); // Replace with your app password
        
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        return mailSender;
    }
}