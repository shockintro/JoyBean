package njupt.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class T_Province {
	private int prov_code;
	private String prov_name;

	@Id
	@GeneratedValue
	public int getProv_code() {
		return prov_code;
	}

	public void setProv_code(int prov_code) {
		this.prov_code = prov_code;
	}

	public String getProv_name() {
		return prov_name;
	}

	public void setProv_name(String prov_name) {
		this.prov_name = prov_name;
	}

}
