/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import objectClasses.people.Faculty;
import objectClasses.people.Student;

/**
 *
 * @author SeiJee
 */
public class HugeData {
	static Random r = new Random(1);
public static void main(String[] args) {
	//addHugeStudentBatch();
	addHugeFaculties();
}
static void addHugeStudentBatch(){
		String category = "genral";
		String id = "0812CS01033";
		String gender="male";
		String name="Charchit";
		String email="cg";
		int sem=1;
		List<Student> ls  = new ArrayList<Student>();
		for (int i=10001; i<10301; i++){
			id = "en"+i;
			name = "std_"+(i-10000)+" sur";
			email = id+"@dom"+(1+i%5)+".com";
			if (i%2==0) gender="Female"; else gender = "Male";
			if (i%60==0) sem++;
			Student s = new Student(category, "2014", "cs", sem, id, "sss", gender, null, null, null, null, null, null, email, "student", null, name, null, null, null);
			ls.add(s);
			//dao.NewUserModule.addNewStudent(s);
		}
		dao.NewUserModule.addNewStudentBatch(ls);
		System.out.println("300 students added");
}
static void addHugeFaculties(){
		String id = "0812CS01033";
		String gender="male";
		String name="Charchit";
		String email="cg";
	for (int i=301; i<311;i++){
			r.setSeed(Calendar.getInstance().getTimeInMillis());
			id = "fac"+i;
			name = "fac"+(i)+" sur";
			email = id+"@dom"+(1+i%5)+".com";
			String[] Deps = {"IT","CS","ME","EC"};
			if (i%2==0) gender="Female"; else gender = "Male";
			Faculty f =  new Faculty("MTech", "Assist. Prof", Deps[r.nextInt(500)%4],Calendar.getInstance() , id, "fff", gender, null, null, null, null, null, null, email, "faculty", null, name, null, null, null);
			dao.NewUserModule.addNewFaculty(f);
		}
		System.out.println("added 40 facuties! ");
}

}
