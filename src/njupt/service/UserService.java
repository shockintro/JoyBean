package njupt.service;

import java.util.Date;
import java.util.List;

import njupt.dao.Userdao;
import njupt.model.T_Game;
import njupt.model.T_Game_Type;
import njupt.model.T_User;

public class UserService {
	
	public List<T_User> userLogin(String name){//管理员登陆
		return (List<T_User>) new Userdao().getUserByAccount(name);
	}
	
	public List beanUserLogin(String name){//客户登陆
		return (List)new Userdao().getBeansUserByAccountAndPwd(name);
	}
	
	public boolean registMana(String account, String pwd, String phone){//注册
		return new Userdao().addUserByAccountPwdPhone(account, pwd, phone);
	}
	
	public boolean registCust(String account, String pwd, String phone){//用户注册
		return new Userdao().addBeansUserByAccountAndPwd(account, pwd, phone);
	}
	
	public boolean BeansUserStatus(String account, T_User admin, Date modify_time){//用户状态改变
		return new Userdao().recoveryBeansUserStatus(account,admin,modify_time);
	}
	
	public List BeanQuery(String account,String number){
		return new Userdao().getBeansUser(account,number);
	}
	
	public List getGameType(String typeName){
		return new Userdao().getGameTypeByName(typeName);
	}
	
	public boolean addGameType(String typeName,String typeStatus){
		
		return new Userdao().addGameType(typeName,typeStatus);
	}
	
	public boolean changeGameType(String name,String status,T_Game_Type admin){
		return new Userdao().changeGameType(name,status,admin);
	}
	
	public boolean addGame(String a,int b,String c,String d,String e,int f,int g){
		return new Userdao().addGame(a,b,c,d,e,f,g);
	}

	public List<T_Game> getGame(String gameName, String gameType) {
		return new Userdao().getGame(gameName,gameType);
	}

	public boolean changeGame(int id,String gameNameL, int gameStatusL,
			String gameTypeL, String textAeraL, String iconAddressL,
			int chargeFeeL, int beanFeeL) {
		T_Game game=new Userdao().gameQueryChange(id);
		return new Userdao().changeGame(game,gameNameL,gameStatusL,gameTypeL,textAeraL,iconAddressL,chargeFeeL,beanFeeL);
	}

	public boolean addBeanFee(String user,String sec) {
		return new Userdao().addBeanFee(user,sec);
	}

}
