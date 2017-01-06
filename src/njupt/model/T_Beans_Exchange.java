package njupt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class T_Beans_Exchange {
	private int id;
	private String code;
	private String pwd;
	private int charge; // 閲戦
	private int beans_balance; // 涔愯眴棰濆害
	private T_Province province;
	private Date start_time;
	private Date end_time;
	private int status;// 鐘舵� 1锛氭甯�2锛氬凡浣跨敤 3锛氳繃鏈�
	private Date create_time;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	public int getBeans_balance() {
		return beans_balance;
	}

	public void setBeans_balance(int beans_balance) {
		this.beans_balance = beans_balance;
	}

	@OneToOne
	public T_Province getProvince() {
		return province;
	}

	public void setProvince(T_Province province) {
		this.province = province;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
}
