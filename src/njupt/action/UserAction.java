package njupt.action;

import njupt.model.T_User;

public class UserAction {
	private T_User user;

	public T_User getUser() {
		return user;
	}

	public void setUser(T_User user) {
		this.user = user;
	}

	public void login() {
		System.out.println(user.getUser_account());
	}
	
	
	/*public String register() {

	}

	public String checkCode() {

	}*/
}
