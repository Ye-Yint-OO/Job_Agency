package job_agency.emailService;

import org.springframework.stereotype.Service;
import java.security.SecureRandom;

@Service
public class OtpService {

    private static final String OTP_CHARS = "0123456789";
    private static final int OTP_LENGTH = 6;
    private final SecureRandom random = new SecureRandom();

    public String generateOtp() {
        StringBuilder otp = new StringBuilder(OTP_LENGTH);
        for (int i = 0; i < OTP_LENGTH; i++) {
            otp.append(OTP_CHARS.charAt(random.nextInt(OTP_CHARS.length())));
        }
        return otp.toString();
    }
}