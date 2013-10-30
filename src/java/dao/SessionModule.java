/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.util.Calendar;
import java.util.List;
import objectClasses.people.Admin;
import objectClasses.people.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SeiJee
 */
public class SessionModule {
	private static SessionFactory sf = new Configuration().configure().buildSessionFactory();
	Session session = sf.openSession();
	public Person CheckLogin(String uid, String pw){
		String q;
		Person p=null;
		Query query=null;
		if ("root".equals(uid) && "init".equals(pw)){
			p =new Admin("master", "isowner", null, "root", "init", null, null, null, null, null, null, null, null, "admin", "default.jpg", "rootAdmin", null, null, "notShared.jpg");
			p.setId("root");
			p.setName("rootAdmin");
			p.setPassword("init");
			dao.NewUserModule.SaveAdmin((Admin)p);
		}else{
			q = "FROM Person WHERE id = :uid AND password=:pw";

			query = session.createQuery(q);
			query.setParameter("uid", uid);
			query.setParameter("pw", pw);

			p = (Person) query.uniqueResult();
		
		}
		return p;
	}
}
