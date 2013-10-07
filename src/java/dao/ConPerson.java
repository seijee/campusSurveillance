/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import objectClasses.people.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author SeiJee
 */
public class ConPerson {
	private static SessionFactory sf = factory.conn.getSf();
	public static Person getPerson(String id){
	//return the person with specified person_id
		Person s=null;
		Session session = sf.openSession();
		Query q= session.createQuery("FROM Person WHERE id=:id");
		q.setParameter("id", id);
		List l = q.list();
		if (!l.isEmpty()){
			s= (Person) l.get(0);
		}
		session.close();
		return s;
	}
}