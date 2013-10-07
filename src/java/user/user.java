/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;
import objectClasses.Group;
import objectClasses.AttendanceReport;
import objectClasses.people.Person;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;



public class user {
	public static void main(String[] args) {
		String sid ="0812CS101032";
		addAttendance(sid, "test",500,500);
		float f = dao.PunctualityModule.calculatePunctuality(sid, "all");
		System.out.println(f);
	}
	static void addAttendance(String pid, String fid,int x, int y){
		AttendanceReport pr = new AttendanceReport();
		
		pr.setAttended(x);
		pr.setLecturesHeld(y);
		pr.setBegin(new GregorianCalendar(2013, Calendar.AUGUST, 15));
		pr.setEnd(new GregorianCalendar(2013, Calendar.AUGUST, 30));
		pr.setWriter(fid);
		pr.setRegards(pid);
		pr.setUpdatedOn(Calendar.getInstance());
		
		Session session = factory.conn.getSf().openSession();
		Transaction tx=null;
		
		try {
			tx = session.beginTransaction();
			session.save(pr);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	static void printMembers (Group g){
		List<String> mermbers = dao.GroupModule.getMermberNames(g);
		for (String p : mermbers){
			System.out.println(" "+p);
		}
	}
}
