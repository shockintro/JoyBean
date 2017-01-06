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
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GameDAO {
	//添加游戏
	public Boolean addGame(String gameName, T_Game_Type gameType, int gameStatus, String gameDetail, 
			String gamePicture, int chargePrice, int beansPrice, Date createTime, Date modifyTime)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{
			tx = session.beginTransaction();
			T_Game game = new T_Game();
			game.setGame_name(gameName);
			game.setGame_type(gameType);
			game.setGame_status(gameStatus);
			game.setGame_detail(gameDetail);
			game.setGame_picture(gamePicture);
			game.setCharge_price(chargePrice);
			game.setBeans_price(beansPrice);			
			game.setCreate_time(createTime);
			game.setModify_time(modifyTime);			
			session.save(game);
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
	
	//修改游戏的数据
	public Boolean updateGameInfo(T_Game game, String gameName, T_Game_Type gameType, int gameStatus, String gameDetail, 
			String gamePicture, int chargePrice, int beansPrice, Date createTime, Date modifyTime)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{
			tx = session.beginTransaction();
			game.setGame_name(gameName);
			game.setGame_type(gameType);
			game.setGame_status(gameStatus);
			game.setGame_detail(gameDetail);
			game.setGame_picture(gamePicture);
			game.setCharge_price(chargePrice);
			game.setBeans_price(beansPrice);			
			game.setCreate_time(createTime);
			game.setModify_time(modifyTime);			
			session.update(game);
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
	
	
	//根据游戏名称获取游戏数据（可能有很多的数据，游戏名称可能不唯一）
	public List getGameByName(String gameName)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();
			
			String hql = "from T_Game where game_name='" + gameName+"'";
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
	
	//根据游戏id获取游戏数据（只有一条数据）
	public List getGameById(int id)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();
			
			String hql = "from T_Game where id='" + id+"'";
			Query query = session.createQuery(hql);
//			query.setFirstResult(0);
//			query.setMaxResults(3);
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
	
	
	//根据游戏类别获取游戏数据，分页，每页3条数据
	public List getGamesByGameType(T_Game_Type type)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();			
			String hql = "from T_Game game where game.game_type.type_name ='" + type.getType_name() + "'";
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
	
	//根据游戏类型和游戏名称获取游戏数据,分页
	public List getGamesByNameAndType(String gameName, T_Game_Type type)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();			
			String hql = "from T_Game game where game.game_name='"+gameName+"' and game.game_type.type_name ='" + type.getType_name() + "'";
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
	
	//根据游戏状态获取游戏信息,不分页
	public List getGamesByGameStatus(String status)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();			
			String hql = "from T_Game game where game_status='"+status+ "'";
			Query query = session.createQuery(hql);
//			query.setFirstResult(0);
//			query.setMaxResults(3);
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
	
	
	public static void main(String[] args) {
//		new GameTypeDAO().addGameType("jingji", 2);
		List t = new GameTypeDAO().getGameTypeByName("jj");		
		Iterator itor = t.iterator();
	    T_Game_Type type = (T_Game_Type)itor.next();
//		
//		System.out.println();
//		System.out.println(new GameDAO().addGame("lol", type, 1, "123", "123", 2, 1, null, null));
		
		
	}
}
