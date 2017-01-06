package njupt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class T_Joy_Beans_User {
	private int id;
	private String user_account;
	private String user_pwd;
	private String user_phone;
	private int user_status;// 状态 1:正常 2：暂停使用
	private int charge_balance;// 话费余额
	private int beans_balance; // 乐豆余额
	private int protected_balance; // 密保余额
	private String protected_no;// 密保卡号
	private Date create_time;
	private Date modify_time;
	private T_User modify_user;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public int getCharge_balance() {
		return charge_balance;
	}

	public void setCharge_balance(int charge_balance) {
		this.charge_balance = charge_balance;
	}

	public int getBeans_balance() {
		return beans_balance;
	}

	public void setBeans_balance(int beans_balance) {
		this.beans_balance = beans_balance;
	}

	public int getProtected_balance() {
		return protected_balance;
	}

	public void setProtected_balance(int protected_balance) {
		this.protected_balance = protected_balance;
	}

	public String getProtected_no() {
		return protected_no;
	}

	public void setProtected_no(String protected_no) {
		this.protected_no = protected_no;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getModify_time() {
		return modify_time;
	}

	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}

	@OneToOne
	public T_User getModify_user() {
		return modify_user;
	}

	public void setModify_user(T_User modify_user) {
		this.modify_user = modify_user;
	}

}
