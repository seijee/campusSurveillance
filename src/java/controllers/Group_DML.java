/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.Set;
import objectClasses.Group;
import objectClasses.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Group_DML {
	private static SessionFactory sf = conn.getSf();
	
	public static boolean addPeople(String[] id,String gid){
		Session session = sf.openSession();
		Transaction t=null;
		Group group = controllers.Group_DRL.getGroup(gid);
		
		Set<Person> personset = null;
		Set<Person> reallyNew = new HashSet<Person>();
		try {
			t = session.beginTransaction();
			if (group == null){
				group = createGroup();
			}
			personset = group.getPeople();
			Person p;
			for (String sid : id ){
				p = controllers.ConPerson.getPerson(sid);
				reallyNew.add(p);
			}
			reallyNew.removeAll(personset);
			//personset.addAll(reallyNew);
			group.addPeople(reallyNew);
			session.saveOrUpdate(group);
			t.commit();
		}catch(Exception e){
			t.rollback();
			return false;
		}
		finally{
			session.close();
		}
		return true;
	}
	
	public static Group createGroup(){
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Group g = new Group();
		session.save(g);
		tx.commit();
		return g;
	}
}