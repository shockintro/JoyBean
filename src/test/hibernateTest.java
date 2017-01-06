package test;

import java.util.List;

import njupt.model.T_User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class hibernateTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Configuration configuration =  new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry(); 
		String HQLString = "SELECT * FROM T_USER WHERE ID=1";
		SessionFactory sessionFactory= configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(HQLString);
		List list = query.list();
		for(Object o : list){
		   T_User u = (T_User)o;
		   System.out.println(u.getId()+" "+u.getUser_account());
		}
	}

}
