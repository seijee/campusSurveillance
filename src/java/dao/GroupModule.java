/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import factory.conn;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import objectClasses.Group;
import objectClasses.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class GroupModule {
	private static SessionFactory sf = conn.getSf();
	public static Group createGroup(String title,String owner){
		//Tested Working
		Session session = sf.openSession();
		Transaction tx = null;
		Group g=null;
		try{
			tx=session.beginTransaction();
			g = new Group();
			g.setOwner(owner);
			g.setTitle(title);
			session.save(g);
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			g=null;
			e.printStackTrace();
		}finally{
			session.close();
			return g;
		}
	}
	public static Group getGroup(String id) {
	/*Tested Working
	* returns the group object associated with specified group_id */
		Session session = sf.openSession();
		Long gid = null;
		try {
			gid = Long.parseLong(id);
		} catch (NumberFormatException e) {
			//e.printStackTrace();
			return null;
		}finally{
		Query q = session.createQuery("FROM Group WHERE group_id =:gid");
		q.setParameter("gid", gid);
		List<Group> l = q.list();
		if (l.isEmpty()){
			System.out.println("no such group found");
			return null;
		}else{
			Group group = (Group)l.get(0); 
			return group;
		}
		}
	}	
	public static boolean addMembersToGroup(String[] id,Group group){
		//Tested Working
		List<Person> personset = new ArrayList<Person>();
		List<Person> reallyNew = new ArrayList<Person>();
		Set<Person> set =  group.getPeople();
		for (Person tp: set){
			personset.add(tp);
		}
		Person p;
		
		for (String sid : id ){
			p = dao.ConPerson.getPerson(sid);
			reallyNew.add(p);
		}
		reallyNew.removeAll(personset);
		//*inline*group.addPeople(reallyNew);
		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		Query query;
		for (Person person : reallyNew){
			query = session.createSQLQuery("INSERT INTO people_group VALUES(?,?)");
			query.setLong(0, group.getGroup_id());
			query.setString(1, person.getId());
			query.executeUpdate();
		}
		t.commit();
		
		//this.people = reallyNew;
		session.close();
			
		return true;
	}
	public static List<String> getMermberNames(Group group){
		//Tested Working!
		List<String> members=null;
		Session session = sf.openSession();
		try{
			Query q = session.createQuery("SELECT pg.Name FROM Group g join g.people pg "
				+ "WHERE g.id =:id");
			q.setParameter("id", group.getGroup_id());
			members = q.list();
		}
		finally{
			session.close();
			return members;
		}
	}
	public static List<Person> getMermbers(Group group){
		//Tested Working
		List<Person> members=null;
		Session session = sf.openSession();
		try{
			Query q = session.createQuery("SELECT pg.Name FROM Group g join g.people pg"
				+ " WHERE g.id=:id");
			q.setParameter("id", group.getGroup_id());
			members = q.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			session.close();
			return members;
		}
	}
	
	public static List<Group> getAlliedGroups(Person p){
		return getAlliedGroups(p.getId());
	}
	public static List<Group> getAlliedGroups(String pid){
	//get all the groups of which a person has got MEMBERSHIP
		Session session = sf.openSession();
		Query q = session.createQuery("SELECT g FROM Group g join g.people p "
				+ "WHERE p.id =:id");
		q.setParameter("id", pid);
		List<Group> groups = q.list();
		session.close();
		return groups;
	}
	public static List<Group> getOwnedGroups(Person p){
		return getOwnedGroups(p.getId());
	}
	public static List<Group> getOwnedGroups(String pid){
		//get all the groups of which a person has got OWNERSHIP
		Session session = sf.openSession();
		Query q = session.createQuery("SELECT g FROM Group g "
				+ "WHERE owner =:id");
		q.setParameter("id", pid);
		List<Group> groups = q.list();
		//HashSet<Group> groups = new HashSet<Group>();
		return groups;
	}
	
	/*DEPRICATED*/ public static List<Person> getPeople(){
		//returns List of all the persons in database
		Session session = sf.openSession();
		Query q = session.createQuery("FROM Person Order By id");
		List<Person> l = q.list();
		HashSet<Person> pset = new HashSet<Person>();
		for (Person p : l){
			pset.add(p);
		}
		session.close();
		return l;
	}
	/*Depricated*/public static HashSet<Group> getThemAll(){
		Session session = sf.openSession();
		Query q = session.createQuery("FROM Group");
		
		List<Group> l = q.list();
		HashSet<Group> groups = new HashSet<Group>();
		for (Group g : l){
			groups.add(g);
		}
		session.close();
		return groups;
}
}