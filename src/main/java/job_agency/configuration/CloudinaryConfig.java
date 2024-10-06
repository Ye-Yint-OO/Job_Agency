package job_agency.configuration;
import com.cloudinary.Cloudinary;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;
import java.util.HashMap;


@Configuration
public class CloudinaryConfig {
	@Bean
    public Cloudinary cloudinary() {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dwerfxy6q");
        config.put("api_key", "329666129371878");
        config.put("api_secret", "28EPExo0h-tN_Udktm1OhcBNaWY");
        return new Cloudinary(config);
    }

}
