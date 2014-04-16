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
	public Person CheckLogin(String uid, String pw){
		String q;
		Person p=null;
		Query query=null;
		Session session = sf.openSession();
		p = dao.ConPerson.getPerson(uid);
		
		if (p==null){
			//hardcoded root admin
			if ("root".equals(uid) && "init".equals(pw)){
				p =new Admin("master", "isowner", null, "root", "init", null, null, null, null, null, null, null, null, "admin", "default.jpg", "rootAdmin", null, null, "notShared.jpg");
				p.setId("root");
				p.setName("rootAdmin");
				p.setPassword("init");
				dao.NewUserModule.SaveAdmin((Admin)p);
			}
		}else if (!pw.equals(p.getPassword())){ 
			p=null; 
		}else{
			System.out.println(p.getName()+"["+p.getId()+"] logged in!\n");
			p.setLastseen(Calendar.getInstance());
			dao.NewUserModule.savePerson(p);
		}
		return p;
	}
}
