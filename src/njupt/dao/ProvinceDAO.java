package njupt.dao;

import java.io.UnsupportedEncodingException;
import java.util.List;

import njupt.model.T_Beans_Exchange;
import njupt.model.T_Province;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ProvinceDAO {
	
	//添加省份代码和省份名称
	public Boolean addProvice(int provCode, String name)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			T_Province prov = new T_Province();
			prov.setProv_code(provCode);
			prov.setProv_name(name);
			session.save(prov);
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
	
	//根据省份代码获取省份信息
	public List getProvByCode(int code)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{
			tx = session.beginTransaction();			
			String hql = "from T_Province where prov_code='"+ code +"'";
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
	
	//根据省份名称获取省份信息
	public List getProvByName(String name)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{
			tx = session.beginTransaction();			
			String hql = "from T_Province p where p.prov_name='"+ name +"'";
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
		String str = "江苏";
		
//		new ProvinceDAO().addProvice(11, "南京");
		System.out.println(new ProvinceDAO().getProvByName("南京"));
	}
}
