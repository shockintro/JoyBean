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
			//加载applicationContext.xml文件信息
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			//加载sessionFactory JavaBean
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			//获得session对象
			Session session=sessionFactory.openSession();
			//执行查询操作
			Query query=((SharedSessionContract) session).createQuery("from T_User");
			//返回查询结果
			List<T_User> list=query.list();
			//遍历
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
