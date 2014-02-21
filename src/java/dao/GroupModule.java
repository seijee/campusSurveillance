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
import objectClasses.people.Person;
import objectClasses.people.Student;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class GroupModule {
	private static SessionFactory sf = conn.getSf();
	
	
	public static Group SaveGroup(Group g){
		Session session = sf.openSession();
		Transaction tx = null;
		try{
			tx=session.beginTransaction();
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
	public static boolean deleteGroup (Group g){
		Session session = sf.openSession();
		Transaction tx = null;
		try{
			tx=session.beginTransaction();
			Query q = session.createSQLQuery("Delete from people_group where group_id=?");
			q.setLong(0, g.getGroup_id());
			q.executeUpdate();
			q= session.createSQLQuery("Delete from groups where group_id=?");
			q.setLong(0, g.getGroup_id());
			q.executeUpdate();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
			return false;
		}finally{
			session.close();
			return true;
		}
	}
	public static Group updateGroup (Group g){
		Session session = sf.openSession();
		Transaction tx = null;
		try{
			tx=session.beginTransaction();
			session.update(g);
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
		Group g = null;
		try {
			if (!id.equalsIgnoreCase("") || id!=null)
				gid = Long.parseLong(id);
			Query q = session.createQuery("FROM Group WHERE group_id =:gid");
			q.setParameter("gid", gid);
			g = (Group) q.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			g = null;
		}finally{
			session.close();
			return g;
		}
	}	
	
	
	public static boolean addMembersToGroup(String[] id,Group group){
		//Tested Working
		Session session = sf.openSession();
		Transaction t = null;
		List<Person> personset = new ArrayList<Person>();
		List<Person> reallyNew = new ArrayList<Person>();
		try {
			List<Person> set =  getMembers(group);
			if (set!= null)
				personset.addAll(set);
			Person p;

			for (String sid : id ){
				p = dao.ConPerson.getPerson(sid);
				if (p!=null) reallyNew.add(p);
			}
			reallyNew.removeAll(personset);
			//*inline*group.addPeople(reallyNew);

			Query query;
			t = session.beginTransaction();
			int count =0;
			for (Person person : reallyNew){
				System.out.println(person.getId());
				query = session.createSQLQuery("INSERT INTO people_group VALUES(?,?)");
				query.setLong(0, group.getGroup_id());
				query.setString(1, person.getId());
				query.executeUpdate();
				if ((count++)%100==0){
					session.flush();
					session.clear();
				}
			}
			t.commit();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			//this.people = reallyNew;
			session.close();
			return true;
		}
			
		
	}
	public static List<String> getMemberNames(Group group){
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
	public static List<Person> getMembers(String gid){
		return getMembers(getGroup(gid));
	}
	public static List<Person> getMembers(Group group){
		//Tested Working
		List<Person> members=null;
		Session session = sf.openSession();
		try{
			Query q = session.createQuery("SELECT DISTINCT pg FROM Group g join g.people pg"
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
	public static List<Person> getNonStudents(Group group){
		//Tested working
		List<Person> members=null;
		Session session = sf.openSession();
		try{
			Query q = session.createQuery("SELECT pg FROM Group g join g.people pg"
				+ " WHERE g.id=:id AND pg.type!='student'");
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
	public static List<Student> getMemberStudents(Group group){
		//Tested working
		List<Student> members=null;
		Session session = sf.openSession();
		try{
			Query q = session.createQuery("SELECT pg FROM Group g join g.people pg"
				+ " WHERE g.id=:id AND pg.type='student'");
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
		Query q = session.createQuery("SELECT DISTINCT g FROM Group g join g.people p "
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
		session.close();
		return groups;
	}
	
	@Deprecated
	public static List<Person> getAllStudents(){
		//returns List of all the students in database
		Session session = sf.openSession();
		//Query q = session.createQuery("FROM Faculty Order By id");
		Query q = session.createQuery("FROM Student Order By id");
		List<Person> l = q.list();
		HashSet<Person> pset = new HashSet<Person>();
		for (Person p : l){
			pset.add(p);
		}
		session.close();
		return l;
	}
	@Deprecated
	public static List<Group> getAllGroups(){
		Session session = sf.openSession();
		Query q = session.createQuery("FROM objectClasses.Group g order by g.type");
		
		List<Group> groups = q.list();
		
		session.close();
		return groups;
}

}