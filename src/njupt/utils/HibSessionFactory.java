package njupt.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibSessionFactory {
	public static SessionFactory sessionFactory;
	public static Session session;
	static{
		try{
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			session = sessionFactory.openSession();
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
}
