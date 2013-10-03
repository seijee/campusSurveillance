/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package academics;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import objectClasses.Department;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SeiJee
 */
public class zAccess {
	private static SessionFactory sf = new Configuration().configure().buildSessionFactory();
	
	public static Set<Department> getDepartments(){
		Session session = sf.openSession();
		HashSet<Department> departmentSet = new HashSet<Department>();
		Query q= session.createQuery("FROM Department");
		//Query q= session.createQuery("SELECT distinct Department FROM Faculty");
		List<Department> l = q.list();
		for (Department d: l){
			departmentSet.add(d);
		}
		return departmentSet;
	}
	
	public static Department getDepartment(String dc){
		Session session = sf.openSession();
		Department d=null;
		Query q= session.createQuery("FROM Department WHERE departmentCode =:dc");
		q.setParameter("dc",dc);
		List<Department> l = q.list();
		if (!l.isEmpty()){
			d= l.get(0);
		}
		return d;
	}
}
