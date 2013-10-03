/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;


import java.util.List;
import objectClasses.Admin;
import objectClasses.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SeiJee
 */
public class UserController {
	private static SessionFactory sf = new Configuration().configure().buildSessionFactory();
	Session session = sf.openSession();
	public Person CheckLogin(String uid, String pw){
		String q;
		Person p=null;
		Query query=null;
		if ("root".equals(uid) && "initialize".equals(pw)){
			p = new Admin();
			p.setId("root");
			p.setName("rootAdmin");
			p.setType("GodMode");
			p.setPassword("initialize");
			controllers.ConAdmin.addNewAdmin((Admin)p);
		}else{
			q = "FROM Person WHERE id = :uid AND password=:pw";

			query = session.createQuery(q);
			query.setParameter("uid", uid);
			query.setParameter("pw", pw);

			List r = query.list();
			if (!r.isEmpty()){
				System.out.println (r.get(0).getClass());
				p = (Person)r.get(0);
			}
		}
		
		return p;
	}
}
