/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.List;
import objectClasses.Group;
import objectClasses.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author SeiJee
 */
public class ConPerson {
	private static SessionFactory sf = conn.getSf();
	
	public static HashSet<Group> getGroups(Person p){
		Session session = sf.openSession();
		Query q = session.createQuery("SELECT g FROM Group g join g.people sg "
				+ "WHERE sg.id =:sid");
		q.setParameter("sid", p.getId());
		List<Group> l = q.list();
		HashSet<Group> groups = new HashSet<Group>();
		for (Group g : l){
			groups.add(g);
		}
		return groups;
	}
	
	public static Person getPerson(String id){
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
	
	public static List<Person> getPeople(){
		
		Session session = sf.openSession();
		Query q = session.createQuery("FROM Student S Order By id");
		List<Person> l = q.list();
		HashSet<Person> pset = new HashSet<Person>();
		for (Person p : l){
			pset.add(p);
		}
		return l;
	}
}
