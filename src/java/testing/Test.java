/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Scanner;
import javax.tools.FileObject;
import objectClasses.Department;
import objectClasses.people.Faculty;
import objectClasses.people.Student;

/**
 *
 * @author SeiJee
 */
public class Test {
	public static void main(String[] args) throws Exception {
		Faculty f = new Faculty();
		Department d = new Department("CS", "Computer Science", "");
	}
	
	void testStudentAdmission(){
		//
		File file = new File("E:/Book1.xls");
		List<Student> sl = dao.Excel.ImportStudents(file);
		
		for (Student s : sl){
			boolean added = dao.NewUserModule.addNewStudent(s);
			if (added) System.out.print("success fully added ");
			else System.out.print("could not add ");
			System.out.println(s);
		}
	}
}
