package test;

import java.util.List;

import njupt.model.T_User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class hibernateTest extends HibernateDaoSupport{
	public void test(){
		System.out.println(getHibernateTemplate().find("from T_User"));
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		hibernateTest a=new hibernateTest();
		a.test();
	}

}
