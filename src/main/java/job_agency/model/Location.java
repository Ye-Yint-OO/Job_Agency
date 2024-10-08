package job_agency.model;

import lombok.Data;

@Data
public class Location {
	private int location_id;
	private String address;
	private String city;
	private String township;
	private String state;
}
