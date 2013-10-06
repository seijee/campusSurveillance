/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import factory.conn;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class NewUserModule {
	private static SessionFactory sf = conn.getSf();
	
	public static boolean addNewAdmin(objectClasses.Admin newAdmin){
		Session session = sf.openSession();
		Transaction t=null;
		try {
			t = session.beginTransaction();
			session.saveOrUpdate(newAdmin);
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
	public static boolean addNewFaculty (objectClasses.Faculty f){
		Session session = sf.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();
			session.saveOrUpdate(f);
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
	public static boolean addNewStudent(objectClasses.Student s) {
		Session session = sf.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();
			session.saveOrUpdate(s);
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
	/*Not yet implemented*/public static boolean addNewStudentBatch(List<objectClasses.Student> studenList){
		//NOT TESTED, NOT RELIABLE, DO NOT USE
		//implements batch processing, which is faster
		//should work well with save, may crash with update operations.
		Session session = sf.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();
			int count=0;
			for (objectClasses.Student s : studenList){
				session.saveOrUpdate(s);
				if (++count%50 == 0){
					session.flush();
					session.clear();
				}
			}
			t.commit();
		}catch(Exception e){
			t.rollback();
			return false;
		}
		finally{
			session.close();
		}
		return false;
	}
}