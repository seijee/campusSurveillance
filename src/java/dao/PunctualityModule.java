/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import objectClasses.AttendanceReport;
import objectClasses.people.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class PunctualityModule {
	private static SessionFactory sf = factory.conn.getSf();
	
	public static boolean addNewAttendenceReport(AttendanceReport atndnce){
		Session session = sf.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(atndnce);
			tx.commit();
		}catch (Exception e){
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}
	public static List<AttendanceReport> getAttendanceof(String pid, int sesn){
		return getAttendanceof(dao.ConPerson.getPerson(pid),sesn);
	}
	public static List<AttendanceReport> getAttendanceof(Person person,int sem){
		Session session = sf.openSession();
		List<AttendanceReport> reports = null;
		try{
			String q;
			if (sem==0)
				q = "FROM AttendanceReport WHERE student=:pid";
			else q = "FROM AttendanceReport WHERE student=:pid AND semester=:sesn";
			Query query = session.createQuery(q);
			query.setParameter("pid", person.getId());
			if (sem!=0)
				query.setParameter("sesn", sem);
			reports = query.list();
			if (reports.isEmpty()){
				reports = null;
			}else{
				for (AttendanceReport rep : reports){
					System.out.println(rep);
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			return reports;
		}
	}
	public static Float calculatePunctuality(String pid, int sesn){
		List<AttendanceReport> reports = getAttendanceof(pid, sesn);
		if (reports == null) return 0f;
		int appeared=0,total=0;
		for (AttendanceReport rep : reports){
			appeared += rep.getThAttended()+2*rep.getLbsAttended();
			total += rep.getThTotal()+rep.getLbsTotal();
		}
		return ((0f+appeared)/total)*100;
	}
}
