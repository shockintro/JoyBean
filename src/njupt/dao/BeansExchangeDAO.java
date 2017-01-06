package njupt.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import njupt.model.T_Beans_Exchange;
import njupt.model.T_Game;
import njupt.model.T_Province;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeansExchangeDAO {
	
	//娣诲姞涔愯眴姣斾緥
//	public Boolean addBeansExchange(T_Province prov, int charge, Date createTime, Date modifyTime)
//	{
//		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
//		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
//		Session session=sessionFactory.openSession();
//		Transaction tx = null;
//		List list = null;
//		try{
//			tx = session.beginTransaction();
//			T_Beans_Exchange beansExchange = new T_Beans_Exchange();
//			beansExchange.setCharge(charge);
//			beansExchange.setProv(prov);
//			beansExchange.setCreate_time(createTime);
//			beansExchange.setModify_time(modifyTime);
//			session.save(beansExchange);
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
	
	//淇敼娆箰璞嗘瘮渚�
	public Boolean updateBeansExchange(T_Beans_Exchange beansExchange, int charge, Date modifyTime)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{
			tx = session.beginTransaction();
			beansExchange.setCharge(charge);
			beansExchange.setModify_time(modifyTime);
			session.update(beansExchange);
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
	
	//鏍规嵁鐪佷唤鍚嶇О鎷夸箰璞嗕俊鎭�
	//杩斿洖鐨勬槸涓�釜map,閿负T_Province绫诲瀷
	//鍊间负T_Beans_Exchange锛屼粬浠箣闂存槸涓�涓�殑鍏崇郴
	public Map<T_Province, T_Beans_Exchange> getBeansExchangeByProvName(String provName)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		Map<T_Province, T_Beans_Exchange> map = new HashMap<T_Province, T_Beans_Exchange>();
		try {
			tx = session.beginTransaction();
			String hql = "from T_Beans_Exchange be inner join be.prov p where p.prov_name='"+provName+"'";
			Query query = session.createQuery(hql);
			List list = query.list();
			Iterator itor = list.iterator();
			Object obj[] = null;
			T_Province prov = null;
			T_Beans_Exchange be = null;			
			while(itor.hasNext())
			{
				obj = (Object[])itor.next();
				System.out.println();				
				prov = (T_Province)obj[1];
				be = (T_Beans_Exchange)obj[0];
				map.put(prov, be);
				tx.commit();
			}
		} catch (Exception e) {
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}
		return map;
	}
	
//	public static void main(String[] args) {
//		BeansExchangeDAO b = new BeansExchangeDAO();
//		List list = new ProvinceDAO().getProvByName("鍗椾含");
//		System.out.println(list);
//		Iterator itor = list.iterator();
//		T_Province p = (T_Province)itor.next();
//		System.out.println(b.addBeansExchange(p, 2, new Date(), new Date()));
//		System.out.println(b.getBeansExchangeByProvName("鍗椾含"));
//	}
}
