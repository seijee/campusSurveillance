/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import factory.conn;
import objectClasses.Department;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class Department_DML {
	private static SessionFactory sf = conn.getSf();
	
	public static boolean addDepartment(Department d){
		Session s=null;
		Transaction trx=null ;
		try{
			s = sf.openSession();
			trx = s.beginTransaction();
			s.saveOrUpdate(d);
			trx.commit();
		}
		catch (Exception e){
			trx.rollback();
		}
		finally{
			s.close();
		}
		return true;
	}
}
