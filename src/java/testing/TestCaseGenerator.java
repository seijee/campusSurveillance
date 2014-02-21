/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;
import objectClasses.Department;
import objectClasses.Group;
import objectClasses.people.Faculty;
import objectClasses.people.Person;
import objectClasses.people.Student;
import org.hibernate.Hibernate;
import org.hibernate.Session;

/**
 *
 * @author SeiJee
 */
public class TestCaseGenerator {
	public static void main(String[] args) throws Exception {
		generateTestData();
		TestGroups.main(args);
	}
	
	public static void generateTestData(){
		testAddFaculty("ME_HOD", "ME");
		testAddFaculty("CS_HOD", "CS");
		testAddFaculty("IT_HOD", "IT");
		testAddFaculty("EC_HOD", "EC");
		addDepartment("ME","Mechanical", "ME_HOD");
		addDepartment("CS","Computer Science", "CS_HOD");
		addDepartment("IT","Information Technology", "IT_HOD");
		addDepartment("EC","Electrical", "EC_HOD");
		HugeData.addHugeFaculties();
		HugeData.addHugeStudentBatch();
	}
	static void addDepartment(String code, String dname, String hod){
		Department d = dao.DepartmentModule.SaveDepartment(new Department(code, dname, hod));
	}
	static void testAddFaculty(String name, String department){
		Faculty fac = new Faculty("BE", "professor", department, null, "fac_"+name, "fff", null, null, null, "B+", name+"address", null, null, name+"@gmail", "faculty", null, name, null, null, null);
		dao.NewUserModule.SaveFaculty(fac);
	}
	static void testAddStudents(){
		//
		Faculty f = new Faculty("Mtech", "lecturer", "CS", Calendar.getInstance(), "fac_tunisha", "fff", "female", "father", null, "B+", "address1", null, "986852", "tunisha@gmail.com", "faculty", null, "Tunisha Saxena", null, null, null);
		dao.NewUserModule.SaveFaculty(f);
		//
		File file = new File("E:/Book1.xls");
		List<Student> sl = dao.Excel.ImportStudents(file);
		for (Student s : sl){
			boolean added = dao.NewUserModule.SaveStudent(s);
			if (added) System.out.print("successfully added ");
			else System.out.print("could not add ");
			System.out.println(s);
		}
	}
	
}
