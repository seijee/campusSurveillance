/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.List;
import objectClasses.Group;
import objectClasses.Student;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author SeiJee
 */
public class Student_DRL {
	private static SessionFactory sf = conn.getSf();
	
	
	public static HashSet<Group> getGroups(Student student){
		Session session = sf.openSession();
		Query q = session.createQuery("SELECT g FROM Group g join g.people sg "
				+ "WHERE sg.id =:sid");
		q.setParameter("sid", student.getId());
		List<Group> l = q.list();
		HashSet<Group> groups = new HashSet<Group>();
		for (Group g : l){
			groups.add(g);
		}
		return groups;
	}
	public static List<String> getStudentIds (){
		Session session = sf.openSession();
		Query q = session.createQuery("SELECT id FROM Student");
		List<String> l = q.list();
		
		return l;
	}
}
