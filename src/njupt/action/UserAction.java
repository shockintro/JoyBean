package njupt.action;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import njupt.model.T_Game;
import njupt.model.T_Game_Type;
import njupt.model.T_Joy_Beans_User;
import njupt.model.T_User;
import njupt.service.UserService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class UserAction extends ActionSupport implements ServletRequestAware{
	private String Name;
	private String Number;
	private String Customer;
	private String Password;
	private List<T_User> listUser=new ArrayList<T_User>();
	private List<T_Game_Type> listGameType=new ArrayList<T_Game_Type>();
	private List<T_Game> listGame=new ArrayList<T_Game>();
	private List<T_Joy_Beans_User> list=new ArrayList<T_Joy_Beans_User>();
	private List<T_Joy_Beans_User> list1=new ArrayList<T_Joy_Beans_User>();
	private List<String> list4=new ArrayList<String>();
	private T_User user=new T_User();
	private String gameType;
	private String gameNameThree;
	private String gameTypeThree;
	private List<T_Game> allGame=new ArrayList<T_Game>();
	private HttpServletRequest request;
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public List<T_Game> getAllGame() {
		return allGame;
	}
	public void setAllGame(List<T_Game> allGame) {
		this.allGame = allGame;
	}
	public List<T_Game> getListGame() {
		return listGame;
	}
	public void setListGame(List<T_Game> listGame) {
		this.listGame = listGame;
	}
	public String getGameNameThree() {
		return gameNameThree;
	}
	public void setGameNameThree(String gameNameThree) {
		this.gameNameThree = gameNameThree;
	}
	public String getGameTypeThree() {
		return gameTypeThree;
	}
	public void setGameTypeThree(String gameTypeThree) {
		this.gameTypeThree = gameTypeThree;
	}
	public String getGameType() {
		return gameType;
	}
	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	public List<T_Game_Type> getListGameType() {
		return listGameType;
	}
	public void setListGameType(List<T_Game_Type> listGameType) {
		this.listGameType = listGameType;
	}
	public List<T_Joy_Beans_User> getList1() {
		return list1;
	}
	public void setList1(List<T_Joy_Beans_User> list1) {
		this.list1 = list1;
	}
	public List<T_Joy_Beans_User> getList() {
		return list;
	}
	public void setList(List<T_Joy_Beans_User> list) {
		this.list = list;
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
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}
	public List<T_User> getListUser() {
		return listUser;
	}
	public void setListUser(List<T_User> listUser) {
		this.listUser = listUser;
	}
	public List<String> getList4() {
		return list4;
	}
	public void setList4(List<String> list4) {
		this.list4 = list4;
	}
	public T_User getUser() {
		return user;
	}
	public void setUser(T_User user) {
		this.user = user;
	}
	public String login() {
	    HttpServletRequest req = this.request;  
	    HttpSession session = req.getSession(); 
		String account=Customer;
		String password=Password;
		UserService userSer=new UserService();
		List<T_User> listReceive =userSer.userLogin(account);
		Iterator<T_User> it =listReceive.iterator();
		T_User object = (T_User) it.next();
		
		session.setAttribute("password", object.getUser_pwd());
		session.setAttribute("user", object.getUser_account());
		if(object.getUser_pwd().equals(password)){
			return "success";
		}else{
			return "error";
		}
	}
	
	public String Beanlogin() {
		 HttpServletRequest req = this.request;  
		    HttpSession session = req.getSession(); 
		String account=Customer;
		String password=Password;
		System.out.println(account+" "+password);
		UserService userSer=new UserService();
		List<T_Joy_Beans_User> listReceive =userSer.beanUserLogin(account);
		Iterator<T_Joy_Beans_User> it =listReceive.iterator();
		T_Joy_Beans_User object = (T_Joy_Beans_User) it.next();
		
		session.setAttribute("password", object.getUser_pwd());
		session.setAttribute("user", object.getUser_account());
		
		if(object.getUser_pwd().equals(password)){
			return "success";
		}else{
			return "error";
		}
	}
	
	public String register(){
		String account=Customer;
		String password=Password;
		String name=Name;
		String number=Number;
		UserService userSer=new UserService();
		userSer.BeanQuery(account, number);
		List<T_Joy_Beans_User> listReceive =userSer.beanUserLogin(account);
		Iterator<T_Joy_Beans_User> it =listReceive.iterator();
		T_Joy_Beans_User object = (T_Joy_Beans_User) it.next();
		System.out.println(account);
		boolean flag=false;
		if(object.getUser_account().equals(account))
			return "error";
		else{
			flag=userSer.registMana(account, password, number);
			if(flag){
				return "success";
			}else {
				return "error";
			}
		}
	}
	
	public String test(){
		T_User user=new T_User();
		user.setId(1001);
		user.setUser_account("lfskdf");
		listUser.add(user);
		user=new T_User();
		user.setId(1002);
		user.setUser_account("123456");
		listUser.add(user);
		ServletActionContext.getRequest().getSession().setAttribute("listUser", listUser);
		return "success";
	}
	//改变用户状态 刷新
	public String beanStatu(){
		HttpSession session= ServletActionContext.getRequest().getSession();
		T_User admin=(T_User) session.getAttribute("ManagementUser");
		boolean flag=new UserService().BeansUserStatus(Customer, admin, new Date());
		if(flag){
			return "success";
		}
		return "error";
	}
	
	@SuppressWarnings("unchecked")
	public String beanFeeInfo(){//用户管理查询
		String customer=Customer;
		String number=Number;
		if((Customer==null&&Number==null)||(Customer.equals("")&&Number.equals("")))return "error";
		if(Customer==null){
			customer="";
		}
		if(Number==null){
			number="";
		}
		try{
			List<T_Joy_Beans_User> listIt=(List<T_Joy_Beans_User>)new UserService().BeanQuery(customer,number);
			Iterator<T_Joy_Beans_User> it =listIt.iterator();
			T_Joy_Beans_User object = (T_Joy_Beans_User) it.next();
			T_Joy_Beans_User user=new T_Joy_Beans_User();
			user.setId(object.getId());
			user.setUser_account(object.getUser_account());
			user.setUser_phone(object.getUser_phone());
			user.setUser_status(object.getUser_status());
			user.setCreate_time(object.getCreate_time());
			list.add(user);
			ServletActionContext.getRequest().getSession().setAttribute("list", list);
		}catch(Exception e){
			return "error";
		}
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String gameType(){
		String type=gameType;
		try{
			List listGame=(List<T_Game_Type>)new UserService().getGameType(type);
			Iterator it=listGame.iterator();
			while(it.hasNext()){
				T_Game_Type obj=(T_Game_Type) it.next();
				T_Game_Type gameType=new T_Game_Type();
				gameType.setId(obj.getId());
				gameType.setType_name(obj.getType_name());
				gameType.setType_status(obj.getType_status());
				gameType.setCreate_time(obj.getCreate_time());
				gameType.setModify_time(obj.getModify_time());
				listGameType.add(gameType);
			}
		}catch(Exception e){
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("listGameType", listGameType);
		return "success";
	}
	
	public String game(){
		String gameName=gameNameThree;
		String gameType=gameTypeThree;
		System.out.println(gameName+" "+gameType);
		try{
			List listGame1=(List<T_Game>)new UserService().getGame(gameName,gameType);
			Iterator it=listGame1.iterator();
			while(it.hasNext()){
				T_Game obj=(T_Game) it.next();
				T_Game gameType1=new T_Game();
				gameType1.setId(obj.getId());
				gameType1.setGame_name(obj.getGame_name());
				gameType1.setGame_type(obj.getGame_type());
				gameType1.setGame_picture(obj.getGame_picture());
				gameType1.setGame_status(obj.getGame_status());
				gameType1.setBeans_price(obj.getBeans_price());
				gameType1.setCharge_price(obj.getCharge_price());
				gameType1.setCreate_time(obj.getCreate_time());
				gameType1.setModify_time(obj.getModify_time());
				listGame.add(gameType1);
			}
		}catch(Exception e){
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("listGameType", listGameType);
		return "success";
	}
	
	public String allGame(){
		try{
			List listGame1=(List<T_Game>)new UserService().getGame("","");
			Iterator it=listGame1.iterator();
			while(it.hasNext()){
				T_Game obj=(T_Game) it.next();
				T_Game gameType1=new T_Game();
				gameType1.setId(obj.getId());
				gameType1.setGame_name(obj.getGame_name());
				gameType1.setGame_type(obj.getGame_type());
				gameType1.setGame_picture(obj.getGame_picture());
				gameType1.setGame_status(obj.getGame_status());
				gameType1.setBeans_price(obj.getBeans_price());
				gameType1.setCharge_price(obj.getCharge_price());
				gameType1.setCreate_time(obj.getCreate_time());
				gameType1.setModify_time(obj.getModify_time());
				allGame.add(gameType1);
			}
		}catch(Exception e){
			return "error";
		}
		ServletActionContext.getRequest().getSession().setAttribute("allGame", allGame);
		return "success";
	}
	
	public String addBeanFee(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		List<T_Joy_Beans_User> listIt=(List<T_Joy_Beans_User>)new UserService().BeanQuery(session.getAttribute("user").toString(),"");
		Iterator<T_Joy_Beans_User> it =listIt.iterator();
		T_Joy_Beans_User object = (T_Joy_Beans_User) it.next();
		T_Joy_Beans_User user=new T_Joy_Beans_User();
		user.setId(object.getId());
		user.setUser_account(object.getUser_account());
		user.setUser_phone(object.getUser_phone());
		user.setUser_status(object.getUser_status());
		user.setCreate_time(object.getCreate_time());
		user.setBeans_balance(object.getBeans_balance());
		user.setCharge_balance(object.getCharge_balance());
		user.setProtected_balance(object.getProtected_balance());
		list.add(user);
		ServletActionContext.getRequest().getSession().setAttribute("list", list);
		System.out.println(session.getAttribute("user"));
		return "success";
	}
	
	
	public static void main(String[] args) {
		UserAction a=new UserAction();
		a.allGame();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
}
