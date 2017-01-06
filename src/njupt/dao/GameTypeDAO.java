package njupt.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import njupt.model.T_Game;
import njupt.model.T_Game_Type;
import njupt.model.T_Joy_Beans_User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.event.spi.SaveOrUpdateEvent;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GameTypeDAO {
	//通过游戏类型的名字取得所有的游戏游戏类型，分页页3条数据
	public List getGameTypeByName(String typeName)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();			
			String hql = "from T_Game_Type where type_name='" + typeName+"'";
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(3);
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
	
	//通过游戏状态获得所有游戏类型，分页显示，每页三条
	public List getGameTypeByStatus(int status)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();			
			String hql = "from T_Game_Type where type_status='" + status+"'";
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(3);
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
	
	//添加游戏类型，成功返回true
	public Boolean addGameType(String typeName, int status)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			T_Game_Type gameType = new T_Game_Type();
			gameType.setType_name(typeName);
			gameType.setType_status(status);
			gameType.setCreate_time(new Date());
			gameType.setModify_time(null);			
			session.save(gameType);
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
	
	//修改游戏类型的名称
	public Boolean updateGameTypeByName(T_Game_Type gameType, String newGameTypeName)
	{		
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			gameType.setType_name(newGameTypeName);		
			session.update(gameType);
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
	
	//修改游戏的类型状态
	public Boolean updateGameTypeByStatus(T_Game_Type gameType, int status)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			gameType.setType_status(status);		
			session.update(gameType);
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
	
	//同时修改游戏状态和游戏类型
	public Boolean updateGameTypeByNameAndStatus(T_Game_Type gameType, String newName, int status)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			gameType.setType_name(newName);
			gameType.setType_status(status);		
			session.update(gameType);
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
		System.out.println(new GameTypeDAO().getGameTypeByStatus(1));
	}
	
}
