
package njupt.dao;


import java.util.Date;
import java.util.Iterator;
import java.util.List;

import njupt.model.T_Game;
import njupt.model.T_Game_Type;
import njupt.model.T_Joy_Beans_User;
import njupt.model.T_User;
import njupt.utils.HibSessionFactory;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Userdao {	
	public List<?> getUserByAccount(String account){

		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		String hql = "from T_User where user_account ="+account;
		Query query = session.createQuery(hql);
		List<T_User> list=query.list();
//		for (Iterator<T_User> iterator = list.iterator(); iterator.hasNext();) {
//			T_User object = (T_User) iterator.next();
//			System.out.println(object.getId()+"  "+object.getUser_account());
//		}
		session.close();

		return list;
	}
	
	public List<?> getUserByAccountAndPwd(String account, String pwd)
	{
		List<?> list=null;

		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		String hql = "from T_User where user_account=? and user_pwd=?";
		Query query = session.createQuery(hql);
		query.setString(0, account);
		query.setString(1, pwd);
		list= query.list();
		session.close();
		return list;
			
	}

	public Boolean addUserByAccountPwdPhone(String account, String pwd, String phone)
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
	
	public Boolean addBeansUserByAccountAndPwd(String account, String pwd, String phone)
	{
		T_Joy_Beans_User user = new T_Joy_Beans_User();
		user.setUser_account(account);
		user.setUser_pwd(pwd);
		user.setUser_phone(phone);		
		user.setUser_status(1);
		user.setCharge_balance(100);
		user.setBeans_balance(0);
		user.setProtected_balance(0);
		user.setProtected_no(null);		
		user.setCreate_time(new Date());
		user.setModify_time(null);
		user.setModify_user(null);
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
	//用户状态改变，如果原来用户状态是1 那么修改为2.如果原来用户状态是2，修改为1
		//同时将修改信息的管理员信息和修改时间存入数据库
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
				String hql = "from T_Game_Type where type_name= '" + typeName+ "'";
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
	
		public List getBeansUserByAccountAndPwd(String account)
		{
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			Transaction tx = null;
			List list = null;
			try{			
				tx = session.beginTransaction();
				String hql = "from T_Joy_Beans_User where user_account = " + account;
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

		public List getBeansUser(String account,String number){
			String a1=account;
			String a2=number;
			
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			Transaction tx = null;
			List list = null;
			try{			
				boolean flag=false;
				tx = session.beginTransaction();
				String hql="from T_Joy_Beans_User where ";
				StringBuilder sb=new StringBuilder(hql);
				if(!a1.equals("")&&!a1.equals(null)){
					sb.append("user_account = "+a1);
					flag=true;
				}
				if(!a2.equals("")&&!a2.equals(null)){
					if(flag){
						sb.append("and user_phone = " + a2);
					}else{
						sb.append(" user_phone = " + a2);
					}
				}
				hql=sb.toString();
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
		
		
		@SuppressWarnings("unchecked")
		public boolean addGameType(String gameType,String gameStatus){
			Transaction tran=null;
			T_Game_Type newType=new T_Game_Type();
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			try{
			
				String maxId="select * FROM t_game_type where id=(select max(id) from t_game_type)";
				Query query=session.createSQLQuery(maxId).addEntity(T_Game_Type.class);
				List<T_Game_Type> ilist=query.list();
				Iterator it =ilist.iterator();
				T_Game_Type object = (T_Game_Type) it.next();
				int id=object.getId();
				System.out.println(id);
				newType.setId(id+1);
				if(gameStatus.equals("1"))
					newType.setType_status(1);
				if(gameStatus.equals("2"))
					newType.setType_status(2);
				newType.setType_name(gameType);
				newType.setCreate_time(new Date());
				newType.setModify_time(new Date());
				tran = session.beginTransaction();//开始事物  
			    session.save(newType);//执行  
			    tran.commit();//提交 
			}catch(Exception e){
				if(tran!=null){
					tran.rollback();
				}
				e.printStackTrace();
				return false;
			}finally{
				session.close();
			}
			return true;
		}
		
		
		public boolean changeGameType(String name,String status,T_Game_Type admin){
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			Transaction tx = null;
			try{					
				tx = session.beginTransaction();
				
				String hql = "from T_Game_Type where type_name = " + "'"+name+"'";
				Query query = session.createQuery(hql);
				List list = query.list();
				Iterator itor = list.iterator();
				T_Game_Type u = (T_Game_Type)itor.next();
				if(u.getType_status()==1&&"2".equals(status)){
					u.setType_status(2);
				}else if(u.getType_status()==2&&"1".equals(status))
					u.setType_status(1);
				if(!u.getType_name().equals(name)){
					u.setType_name(name);
				}
				
				u.setModify_time(new Date());
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
		
		public boolean addGame(String gameNameL,int gameStatusL,String gameTypeL,String textAeraL,String iconAddressL,int chargeFeeL,int beanFeeL) {
			Transaction tran=null;
			T_Game newType=new T_Game();
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			try{
				String hql="from T_Game_Type where type_name = "+"'"+gameTypeL+"'";
				Query query1=session.createQuery(hql);
				List<T_Game_Type> ylist=query1.list();
				Iterator iti =ylist.iterator();
				T_Game_Type object1 = (T_Game_Type) iti.next();
				String maxId="select * FROM t_game where id=(select max(id) from t_game)";
				Query query=session.createSQLQuery(maxId).addEntity(T_Game.class);
				List<T_Game> ilist=query.list();
				Iterator it =ilist.iterator();
				T_Game object = (T_Game) it.next();
				int id=object.getId();
				System.out.println(id);
				newType.setId(id+1);
				newType.setBeans_price(beanFeeL);
				newType.setCharge_price(chargeFeeL);
				newType.setGame_detail(textAeraL);
				newType.setGame_picture(iconAddressL);
				newType.setGame_name(gameNameL);
				newType.setGame_status(gameStatusL);
				newType.setGame_type(object1);
				newType.setCreate_time(new Date());
				newType.setModify_time(new Date());
				tran = session.beginTransaction();//开始事物  
			    session.save(newType);//执行  
			    tran.commit();//提交 
			}catch(Exception e1){
				if(tran!=null){
					tran.rollback();
				}
				e1.printStackTrace();
				return false;
			}finally{
				session.close();
			}
			return true;
		}
		
		public List<T_Game> getGame(String gameName, String gameType) {
			String a1=gameName;
			String a2=gameType;
			
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			Transaction tx = null;
			List list = null;
			try{			
				boolean flag=false;
				tx = session.beginTransaction();
				String hql="from T_Game where 1=1";
				StringBuilder sb=new StringBuilder(hql);
//				String hql = "from T_Joy_Beans_User where user_account = " + account +"and user_phone = " + number;
				if(!a1.equals("")){
					sb.append(" and game_name = "+ "'"+a1+ "'");
					flag=true;
				}
				if(!a2.equals("")&&!a2.equals(null)){
					if(flag){
						sb.append("and game_type_id = " + "'"+a2+"'");
					}else{
						sb.append(" and game_type_id = " + "'"+a2+ "'");
					}
				}
				hql=sb.toString();
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
		
	public static void main(String[] args) {
		Userdao user=new Userdao();
		System.out.println((user.getGame("tempRun","1")));
	}
	
	public T_Game gameQueryChange(int id){
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		String hql="from T_Game where id="+id;
		Query query=session.createQuery(hql);
		list=query.list();
		Iterator it=list.iterator();
		T_Game obj=(T_Game) it.next();
		session.close();
		return obj;
	}
	
	public boolean changeGame(T_Game game,String gameNameL, int gameStatusL,String gameTypeL, String textAeraL, String iconAddressL,
			int chargeFeeL, int beanFeeL) {
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			game.setGame_name(gameNameL);
			game.setGame_status(gameStatusL);
			game.setGame_detail(textAeraL);
			game.setGame_picture(iconAddressL);
			game.setCharge_price(chargeFeeL);
			game.setBeans_price(beanFeeL);			
			game.setModify_time(new Date());			
			session.update(game);
			tx.commit();			
		}catch(Exception e){
			System.out.println("youdu");
			if(tx!=null){
				tx.rollback();
			}
			
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
	}

	public boolean addBeanFee(String user,String sec) {
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{					
			tx = session.beginTransaction();
			
			String hql = "from T_Joy_Beans_User where user_account = " + "'"+user+"'"+" and protected_no = "+sec;
			Query query = session.createQuery(hql);
			List list = query.list();
			Iterator itor = list.iterator();
			T_Joy_Beans_User u = (T_Joy_Beans_User)itor.next();
			u.setProtected_balance(u.getProtected_balance()+500);
			
			u.setModify_time(new Date());
			session.update(u);
			tx.commit();			
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
			return false;
		}finally{
			session.close();
		}
		return true;
		
	}

}
