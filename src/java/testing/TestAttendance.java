/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;
import objectClasses.AttendanceReport;
import objectClasses.Group;
import objectClasses.people.Person;
import objectClasses.people.Student;

/**
 *
 * @author SeiJee
 */
public class TestAttendance {
	public static void main(String[] args) {
		Calendar begin = new GregorianCalendar(2014, Calendar.OCTOBER,1),
				 end = new GregorianCalendar(2014, Calendar.OCTOBER, 15);
		Group g = dao.GroupModule.getGroup("1");
		List<Student> members = dao.GroupModule.getMemberStudents(g);
		Random r = new Random(574);
		int i=1;
		for(Student per : members){
			//if (!"student".equals(per.getType())) continue;
			r.setSeed((i++)*576);
			//AttendanceReport ar = new AttendanceReport(per.getId(), r.nextInt(18), 20 ,begin , end, "fac306",((Student)per).getSemester());
		
			/*AttendanceReport ar =	new AttendanceReport( 
					per.getId(), "Sub1", "fac301", 
					r.nextInt(30),30 ,  r.nextInt(6), 6, per.getSemester()+7,
					begin, end);
			
			dao.PunctualityModule.addNewAttendenceReport(ar); 
			 * 
			 */
		}
		for(Person per : members){
			Float punct = dao.PunctualityModule.calculatePunctuality(per.getId(), 0);
			System.out.print(punct);
			//dao.PunctualityModule.getAttendanceof(per, "all");
		}
	}
}
