package job_agency.emailService;

import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class OtpStorageService {

    private static final long EXPIRATION_MINUTES = 5;

    // Stores OTP against email
    private ConcurrentHashMap<String, OtpDetails> otpStorage = new ConcurrentHashMap<>();

    public void storeOtp(String email, String otp) {
        OtpDetails otpDetails = new OtpDetails(otp, LocalDateTime.now().plusMinutes(EXPIRATION_MINUTES));
        otpStorage.put(email, otpDetails);
    }

    public boolean validateOtp(String email, String otp) {
        if (!otpStorage.containsKey(email)) {
            return false;
        }
        OtpDetails otpDetails = otpStorage.get(email);
        if (LocalDateTime.now().isAfter(otpDetails.getExpiryTime())) {
            otpStorage.remove(email);
            return false;
        }
        if (otp.equals(otpDetails.getOtp())) {
            otpStorage.remove(email);
            return true;
        }
        return false;
    }
    // Inner class to hold OTP and its expiration time
    private static class OtpDetails {
        private String otp;
        private LocalDateTime expiryTime;

        public OtpDetails(String otp, LocalDateTime expiryTime) {
            this.otp = otp;
            this.expiryTime = expiryTime;
        }

        public String getOtp() {
            return otp;
        }

        public LocalDateTime getExpiryTime() {
            return expiryTime;
        }
    }
}