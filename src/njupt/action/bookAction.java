package njupt.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import njupt.model.T_Game_Type;
import njupt.model.T_Joy_Beans_User;
import njupt.model.T_User;
import njupt.service.UserService;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class bookAction extends ActionSupport{
	private static final long serialVersionUID = 2852498031633584929L;
	private String beeStatus;
	private ArrayList<T_User> userList=new ArrayList<T_User>();
	private ArrayList<HashMap<String,String>> list=new ArrayList<HashMap<String,String>>();
	private HashMap<String,String> map=new HashMap<String,String>();
	private ArrayList<String> list1=new ArrayList<String>();
	private String Text;
	private T_User user=new T_User();
	private String addGameType;
	private String addGameStatus;
	private String changeGameTypeName;
	private String changeGameTypeBusiness;
	private String gameName;
	private int gameStatus;
	private String gameType;
	private String textAera;
	private String iconAddress;
	private int chargeFee;
	private int beanFee;
	private int gameId;
	private String secNumber;
	private String numberPassword;
	private String Customer;
	private String Password;
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public int getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(int gameStatus) {
		this.gameStatus = gameStatus;
	}
	public String getGameType() {
		return gameType;
	}
	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	public String getTextAera() {
		return textAera;
	}
	public void setTextAera(String textAera) {
		this.textAera = textAera;
	}
	public String getIconAddress() {
		return iconAddress;
	}
	public void setIconAddress(String iconAddress) {
		this.iconAddress = iconAddress;
	}
	public int getChargeFee() {
		return chargeFee;
	}
	public void setChargeFee(int chargeFee) {
		this.chargeFee = chargeFee;
	}
	public int getBeanFee() {
		return beanFee;
	}
	public void setBeanFee(int beanFee) {
		this.beanFee = beanFee;
	}
	public String getChangeGameTypeName() {
		return changeGameTypeName;
	}
	public void setChangeGameTypeName(String changeGameTypeName) {
		this.changeGameTypeName = changeGameTypeName;
	}
	public String getChangeGameTypeBusiness() {
		return changeGameTypeBusiness;
	}
	public void setChangeGameTypeBusiness(String changeGameTypeBusiness) {
		this.changeGameTypeBusiness = changeGameTypeBusiness;
	}
	public String getAddGameType() {
		return addGameType;
	}
	public void setAddGameType(String addGameType) {
		this.addGameType = addGameType;
	}
	public String getAddGameStatus() {
		return addGameStatus;
	}
	public void setAddGameStatus(String addGameStatus) {
		this.addGameStatus = addGameStatus;
	}
	public String getBeeStatus() {
		return beeStatus;
	}
	public void setBeeStatus(String beeStatus) {
		this.beeStatus = beeStatus;
	}
	public String getSecNumber() {
		return secNumber;
	}
	public void setSecNumber(String secNumber) {
		this.secNumber = secNumber;
	}
	public String getNumberPassword() {
		return numberPassword;
	}
	public void setNumberPassword(String numberPassword) {
		this.numberPassword = numberPassword;
	}
	public ArrayList<T_User> getUserList() {
		return userList;
	}
	public void setUserList(ArrayList<T_User> userList) {
		this.userList = userList;
	}
	public T_User getUser() {
		return user;
	}
	public void setUser(T_User user) {
		this.user = user;
	}
	public String getCustomer() {
		return Customer;
	}
	public void setCustomer(String customer) {
		Customer = customer;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public ArrayList<HashMap<String, String>> getList() {
		return list;
	}
	public void setList(ArrayList<HashMap<String, String>> list) {
		this.list = list;
	}
	public HashMap<String, String> getMap() {
		return map;
	}
	public void setMap(HashMap<String, String> map) {
		this.map = map;
	}
	public ArrayList<String> getList1() {
		return list1;
	}
	public void setList1(ArrayList<String> list1) {
		this.list1 = list1;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public String pluginAjax(){
		
		if(Text.equals("checkCode")){
			UserService userSer=new UserService();
			List<T_User> listReceive =userSer.userLogin(Customer);
			Iterator<T_User> it =listReceive.iterator();
			T_User object = (T_User) it.next();
			if(object.getUser_account().equals(Customer)){
				StringBuilder sb=new StringBuilder();
				sb.append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10));
				Text=sb.toString();
				System.out.println(Text);
				return SUCCESS;
			}
		}else if(Text.equals("BeanCheckCode")){
			UserService userSer=new UserService();
			List<T_Joy_Beans_User> listReceive1 =userSer.beanUserLogin(Customer);
			Iterator<T_Joy_Beans_User> it1 =listReceive1.iterator();
			T_Joy_Beans_User object1 = (T_Joy_Beans_User) it1.next();
			StringBuilder sb=new StringBuilder();
			sb.append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10));
			Text=sb.toString();
			System.out.println(Text);
			if(object1.getUser_account().equals(Customer))
			return SUCCESS;
		}
		return ERROR;
	}
	

	
	public String statusAjax(){
		if(Text.equals("status")||Text=="status"){//改变用户状态 Ajax
			System.out.println("STATUS"+" "+beeStatus);
			try{
				HttpSession session= ServletActionContext.getRequest().getSession();
				T_User admin=(T_User) session.getAttribute("ManagementUser");
				boolean flag=new UserService().BeansUserStatus(beeStatus, admin, new Date());
				if(flag){
					return SUCCESS;
				}
			}catch(Exception e){
				System.out.println("有毒");
				return ERROR;
			}
		}
		return ERROR;
	}
	
	public String addGameAjax(){
		String gameType=addGameType;
		String gameStatus=addGameStatus;
		boolean flag=new UserService().addGameType(gameType,gameStatus);
		if(flag)
		return SUCCESS;
		return ERROR;
	}
	
	public String gameTypeChange(){
		HttpSession session= ServletActionContext.getRequest().getSession();
		T_Game_Type admin=(T_Game_Type) session.getAttribute("ManagementUser");
		System.out.println(Text+ " "+changeGameTypeName+" "+changeGameTypeBusiness);
		String changeGame=changeGameTypeName;
		String changeGameStatus=changeGameTypeBusiness;
		boolean flag=new UserService().changeGameType(changeGame,changeGameStatus,admin);
		if(flag)
			return SUCCESS;
			return ERROR;
	}
	
	public String addGame(){
		String gameNameL=gameName;
		int gameStatusL=gameStatus;
		String gameTypeL=gameType;
		String textAeraL=textAera;
		String iconAddressL=iconAddress;
		int chargeFeeL=chargeFee;
		int beanFeeL=beanFee;
		boolean flag=new UserService().addGame(gameNameL,gameStatusL,gameTypeL,textAeraL,iconAddressL,chargeFeeL,beanFeeL);
		if(flag)
			return SUCCESS;
			return ERROR;
	}
	
	public String changeGame(){
		System.out.println(gameId);
		int id=gameId;
		String gameNameL=gameName;
		int gameStatusL=gameStatus;
		String gameTypeL=gameType;
		String textAeraL=textAera;
		String iconAddressL=iconAddress;
		int chargeFeeL=chargeFee;
		int beanFeeL=beanFee;
		boolean flag=new UserService().changeGame(id,gameNameL,gameStatusL,gameTypeL,textAeraL,iconAddressL,chargeFeeL,beanFeeL);
		if(flag)
			return SUCCESS;
			return ERROR;
	}
	
	
	public String addFeeAjax(){
		String user=Customer;
		String sec=secNumber;
		boolean flag=new UserService().addBeanFee(user,sec);
		if(flag)
			return SUCCESS;
			return ERROR;
	}
	
	public static void main(String[] args) {
		System.out.println(ServletActionContext.getRequest().getSession().equals(null));
	}
}
