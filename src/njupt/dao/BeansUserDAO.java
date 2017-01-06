package njupt.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import njupt.model.T_Game;
import njupt.model.T_Joy_Beans_User;
import njupt.model.T_User;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeansUserDAO {
	
	//鏍规嵁鐢ㄦ埛鐨勮处鎴峰拰瀵嗙爜鏉ヨ幏鍙栫敤鎴锋暟鎹�
	public List getBeansUserByAccountAndPwd(String account,String pwd)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{			
			tx = session.beginTransaction();
			String hql = "from T_Joy_Beans_User where user_account = " + account + "and user_pwd = " + pwd;
			Query query = session.createQuery(hql);
			list = query.list();
			tx.commit();
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
 
	//鐢ㄦ埛娉ㄥ唽
	public Boolean addBeansUserByAccountAndPwd(String account, String pwd, String phone, int status,
			int chargeBalance, int beansBalance, int protectedBalance, String protectedNo, Date createDate, Date modifyDate, T_User modifyUser)
	{
		T_Joy_Beans_User user = new T_Joy_Beans_User();
		user.setUser_account(account);
		user.setUser_pwd(pwd);
		user.setUser_phone(phone);		
		user.setUser_status(status);
		user.setCharge_balance(chargeBalance);
		user.setBeans_balance(beansBalance);
		user.setProtected_balance(protectedBalance);
		user.setProtected_no(protectedNo);		
		user.setCreate_time(createDate);
		user.setModify_time(modifyDate);
		user.setModify_user(modifyUser);
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			session.save(user);
			tx.commit();			
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}
	
	//鐢ㄦ埛鐘舵�鏀瑰彉锛屽鏋滃師鏉ョ敤鎴风姸鎬佹槸1 閭ｄ箞淇敼涓�.濡傛灉鍘熸潵鐢ㄦ埛鐘舵�鏄�锛屼慨鏀逛负1
	//鍚屾椂灏嗕慨鏀逛俊鎭殑绠＄悊鍛樹俊鎭拰淇敼鏃堕棿瀛樺叆鏁版嵁搴�
	public Boolean recoveryBeansUserStatus(String account, T_User admin, Date modify_time)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			
			String hql = "from T_Joy_Beans_User where user_account = " + account;
			Query query = session.createQuery(hql);
			List list = query.list();
			Iterator itor = list.iterator();
			T_Joy_Beans_User u = (T_Joy_Beans_User)itor.next();
			if(u.getUser_status()==1){
				u.setUser_status(2);
			}else{
				u.setUser_status(1);
			}
			u.setModify_time(new Date());
			u.setModify_user(admin);
			session.update(u);
			tx.commit();			
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}
	
	//缁欑敤鎴锋坊鍔犳父鎴忕殑鍏宠仈锛屽悓鏃剁粰娓告垙娣诲姞鐢ㄦ埛鐨勫叧鑱�
//	public Boolean addGameToBeansUser(T_Joy_Beans_User beansUser, T_Game game, Date addTime)
//	{
//		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
//		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
//		Session session=sessionFactory.openSession();
//		Transaction tx = null;
//		try{					
//			tx = session.beginTransaction();
////			Map<T_Joy_Beans_User, Date> t = new HashedMap();
////			t.put(beansUser, addTime);
////			game.setUser_date(t);
//			beansUser.getGames().add(game);	
//			session.update(beansUser);
//			tx.commit();			
//		}catch(Exception e){
//			if(tx!=null){
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}finally{
//			session.close();
//		}
//		return true;
//	}
//	
	
	public static void main(String[] args) {
//		Boolean t = new BeansUserDAO().recoveryBeansUserStatus("123");
//		System.out.println(t);
		
//		Iterator itor = t.iterator();
//		while(itor.hasNext())
//		{
//			T_Joy_Beans_User u = (T_Joy_Beans_User)itor.next();
//			System.out.println(u.getUser_account()+"     "+u.getUser_pwd()+ "     "+u.getCreate_time());
//		}
	}
}
