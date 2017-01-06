package test;

import java.util.Iterator;
import java.util.List;

import njupt.model.T_User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class test extends HibernateDaoSupport{
	public void test(){
		try{
			//����applicationContext.xml�ļ���Ϣ
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			//����sessionFactory JavaBean
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			//���session����
			Session session=sessionFactory.openSession();
			//ִ�в�ѯ����
			Query query=((SharedSessionContract) session).createQuery("from T_User");
			//���ز�ѯ���
			List<T_User> list=query.list();
			//����
			for (Iterator<T_User> iterator = list.iterator(); iterator.hasNext();) {
				T_User object = (T_User) iterator.next();
				System.out.println(object.getId()+"  "+object.getUser_account());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
}
	public static void main(String[] args) {
		test a=new test();
		a.test();
	}

}
