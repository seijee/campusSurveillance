/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.List;
import objectClasses.Group;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Group_DRL {
	private static SessionFactory sf = conn.getSf();
	
	public static HashSet<Group> getThemAll(){
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

	public static Group getGroup(String id) {
		Session session = sf.openSession();
		
		Long gid = null;
		try {
			gid = Long.parseLong(id);
		} catch (NumberFormatException numberFormatException) {
			return null;
		}finally{
		Query q = session.createQuery("FROM Group WHERE group_id =:gid");
		q.setParameter("gid", gid);
		List<Group> l = q.list();
		if (l.isEmpty()){
			return null;
		}else{
			Group group = (Group)l.get(0); 
			return group;
		}
		}
	}
}