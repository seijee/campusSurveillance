/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import objectClasses.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class ConStudent {
	private static SessionFactory sf = conn.getSf();
	
	public static boolean addNewStudent(Student s) {
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
}
