package njupt.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import njupt.model.T_User;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdminUserDAO{
	
	public List getAdminUserByAccount(String account)
	{	
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		List list = null;
		Transaction tx = null;
		try{		
			tx = session.beginTransaction();			
			String hql = "from T_User user where user.user_account=" + account ;
			Query query = session.createQuery(hql);
			list = query.list();	
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
			tx.rollback();
		}finally{
			session.close();
		}
		return list;
	}
	
	public List getAdminUserByAccountAndPwd(String account,String pwd)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{			
			tx = session.beginTransaction();
			String hql = "from T_User user where user.user_account=" + account + "and user.user_pwd=" + pwd;
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
	
	public Boolean addAdminUserByAccountPwdPhone(String account, String pwd, String phone)
	{
		T_User user = new T_User();
		user.setUser_account(account);
		user.setUser_pwd(pwd);
		user.setUser_phone(phone);
		user.setCreate_time(new Date());
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
	
	public static void main(String[] args) {
		Boolean b = new AdminUserDAO().addAdminUserByAccountPwdPhone("123", "456", "110");
		System.out.println(b);
	}
	
}

