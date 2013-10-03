/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import objectClasses.Faculty;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class ConFaculty {
	private static SessionFactory sf = conn.getSf();
	
	public static boolean addNewFaculty (Faculty f){
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
}
