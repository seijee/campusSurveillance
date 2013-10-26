/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import factory.conn;
import java.util.List;
import objectClasses.Department;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class DepartmentModule {
	private static SessionFactory sf = conn.getSf();
	public static Department createDepartment(Department d){
		Session s = sf.openSession();
		Transaction trx=null ;
		try{
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
		return d;
	}
	public static Department getDepartment(String code){
		Session session = sf.openSession();
		Department department=null;
		try{
			Query q = session.createQuery("FROM Department WHERE depCode=:code");
			q.setParameter("code", code);
			department = (Department) q.uniqueResult();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			return department;
		}
	}
	public static List<Department> getAllDepartments(){
		Session session = sf.openSession();
		List<Department> department=null;
		try{
			Query q = session.createQuery("FROM Department");
			department = q.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			return department;
		}
	}
}
