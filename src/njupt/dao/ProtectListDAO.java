package njupt.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import njupt.model.T_Protect_List;
import njupt.model.T_Province;

public class ProtectListDAO {
	//新增密保卡
	public Boolean addProtectList(String code, String pwd, int charge, int beansBalance, T_Province prov,
			Date startTime, Date endTime, int status, Date createTime)
		{
			ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
			SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
			Session session=sessionFactory.openSession();
			Transaction tx = null;
			List list = null;
			try{					
				tx = session.beginTransaction();
				T_Protect_List proList = new T_Protect_List();
				proList.setCode(code);
				proList.setPwd(pwd);
				proList.setCharge(charge);
				proList.setBeans_balance(beansBalance);
				proList.setProvince(prov);
				proList.setStatus(status);
				proList.setCreate_time(createTime);
				proList.setEnd_time(endTime);
				proList.setStart_time(createTime);
				session.save(proList);
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
	
	//根据卡号省份和截止时间精确查询密保卡   但是日期时间还没搞定
	public List getProtectListByCodeProvinceAndEndTime(String code, T_Province prov, String date)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();
			String provName = prov.getProv_name();
//			String hql = "from T_Protect_List p where p.province.prov_name='"+provName+"' and p.code='"+code+"'and p.end_time="+date+"'";
			String hql = "from T_Protect_List p where p.province.prov_name='"+provName+"' and p.code='"+code+"'";

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
	
	//根据账号密码获取密保卡
	public List getProtectListByCodeAndPwd(String code, String pwd)
	{
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		List list = null;
		try{					
			tx = session.beginTransaction();
			String hql = "from T_Protect_List p where p.code='"+code+"' and p.pwd='"+pwd+"'";
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
		List list = new ProvinceDAO().getProvByName("南京");
//		System.out.println(list);
		Iterator itor = list.iterator();
		T_Province p = (T_Province)itor.next();
		System.out.println(p);
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
//	    Date date;
	    ProtectListDAO d = new ProtectListDAO();
//			date = sdf.parse("2017-01-09 00:00:00");
//			System.out.println(date.toString());
			System.out.println(d.getProtectListByCodeAndPwd("2","123"));
	
		
	}
	
	
}
