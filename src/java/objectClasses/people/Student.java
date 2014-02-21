/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses.people;


import java.util.Calendar;
import objectClasses.people.Person;
import java.util.Comparator;
import java.util.List;
import objectClasses.Group;

/**
 *
 * @author SeiJee
 */
public class Student extends Person {
	private String category;
	private String batch, branch;
	private int semester;

	public Student(String category, String batch, String branch, int semester, String id, String password, String gender, String father_name, String mother_name, String bloodgroup, String p_address, String r_address, String mobile, String email, String type, String photo, String Name, Calendar DOB, List<Group> groups, String display_pic) {
		super(id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
		this.category = category;
		this.batch = batch;
		this.branch = branch;
		this.semester = semester;
	}

	public Student() {
	}

	
	
	public static Comparator<Student> c =  new Comparator<Student>() {

		@Override
		public int compare(Student o1, Student o2) {
			return String.CASE_INSENSITIVE_ORDER.compare(o1.getId(), o2.getId());
		}
	};
	
	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	
	
	@Override
	public List<Group> getGroups() {
		groups = dao.GroupModule.getAlliedGroups(this);
		return groups;
	}
	

	@Override
	public String toString() {
		String print = getId()+"\t"+getName()+"\t\t\t"+getEmail();
		return  print;
	}
	
	


}
