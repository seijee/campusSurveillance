/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import objectClasses.AttendanceReport;
import objectClasses.Group;
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
					//System.out.println(rep);
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
			appeared = appeared + rep.getThAttended()+ 2*rep.getLbsAttended();
			
			total = total + rep.getThTotal()+ 2*rep.getLbsTotal();
		}
		System.out.println(appeared+"/"+total);
		float punctuality = (((float)appeared)/total);
		return ((float)Math.round(punctuality*10000))/100;
	}
	
	public static Map<String,Float> getSubjectWiseAttendance ( Person s, Group g ){
		Map <String,Integer> thattended = new HashMap<String, Integer>();
		Map <String,Integer> lbattended = new HashMap<String, Integer>();
		Map <String,Integer> thtotal = new HashMap <String,Integer>();
		Map <String,Integer> lbtotal = new HashMap <String,Integer>();
		Map <String,Float> att = new HashMap <String,Float>();
		List<AttendanceReport> reports = null;
		Session session = sf.openSession();
		try{
			String q;
			q = "FROM AttendanceReport A WHERE A.student=:pid and A.group_id=:gid ORDER BY A.subject";
			Query query = session.createQuery(q);
			query.setParameter("pid", s.getId());
			String gid = Long.toString(g.getGroup_id());
			query.setParameter("gid", gid);
			reports = query.list();
			if (reports.isEmpty()){
				reports = null;
				System.out.println("Reports not fetched :(");
			}else{
				for (AttendanceReport rep : reports){
					if (!thattended.containsKey(rep.getSubject())){
						thattended.put(rep.getSubject(), rep.getThAttended());
						lbattended.put(rep.getSubject(), rep.getLbsAttended());
						thtotal.put(rep.getSubject(), rep.getThTotal());
						lbtotal.put(rep.getSubject(), rep.getLbsTotal());
					}else{
						int temp1 = thattended.get(rep.getSubject());
						int temp2 = lbattended.get(rep.getSubject());
						int temp3 = thtotal.get(rep.getSubject());
						int temp4 = lbtotal.get(rep.getSubject());
						
						thattended.put(rep.getSubject(), temp1+rep.getThAttended());
						lbattended.put(rep.getSubject(), temp2+rep.getLbsAttended());
						thtotal.put(rep.getSubject(), temp3+rep.getThTotal());
						lbtotal.put(rep.getSubject(), temp4+rep.getLbsTotal());
					}
				}
				Set<String> subjects = thattended.keySet();
				for (String subject : subjects){
					int tha = thattended.get(subject);
					int lba = lbattended.get(subject);
					int tht = thtotal.get(subject);
					int lbt = lbtotal.get(subject);
					int attended = tha + 2*lba;
					int total = tht + 2*lbt;
					System.out.println(tht + " and "+ lbt);
					System.out.println(attended+"s/"+total);
					float attendance =  ((float)attended)/total;
					attendance = ((float)Math.round(attendance*10000))/100;
					att.put(subject,attendance );
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			return att;
		}
	}
}
