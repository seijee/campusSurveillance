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
	public static List<AttendanceReport> fetchAttendanceof(String pid, String sesn){
		return fetchAttendanceof(dao.ConPerson.getPerson(pid),sesn);
	}
	public static List<AttendanceReport> fetchAttendanceof(Person person,String sesn){
		Session session = sf.openSession();
		List<AttendanceReport> reports = null;
		try{
			String q;
			if (sesn.equals("") || sesn==null ||sesn.equalsIgnoreCase("all"))
				q = "FROM AttendanceReport WHERE regards=:pid";
			else q = "FROM AttendanceReport WHERE regards=:pid AND sessionId=:sesn";
			Query query = session.createQuery(q);
			query.setParameter("pid", person.getId());
			if (!(sesn.equals("") || sesn==null ||sesn.equalsIgnoreCase("all")))
				query.setParameter("sesn", sesn);
			reports = query.list();
			if (reports.isEmpty()){
				reports = null;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			return reports;
		}
	}
	public static Float calculatePunctuality(String pid, String sesn){
		List<AttendanceReport> reports = fetchAttendanceof(pid, sesn);
		if (reports == null) return 0f;
		int appeared=0,total=0;
		for (AttendanceReport rep : reports){
			appeared += rep.getAttended();
			total += rep.getLecturesHeld();
		}
		return ((0f+appeared)/total)*100;
	}
}
