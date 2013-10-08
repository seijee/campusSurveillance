/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses.people;

import java.util.List;
import objectClasses.Group;
import objectClasses.people.Person;
import java.util.Calendar;
import objectClasses.Department;

/**
 *
 * @author SeiJee
 */
public class Faculty extends Person {
	
	private String qualification,designation ;
	private String department;
	private Calendar join_date;

	
	public Faculty(String qualification, String designation, String department, Calendar join_date, String id, String password, String gender, String father_name, String mother_name, String bloodgroup, String p_address, String r_address, String mobile, String email, String type, String photo, String Name, Calendar DOB, List<Group> groups, String display_pic) {
		super(id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
		this.qualification = qualification;
		this.designation = designation;
		this.department = department;
		this.join_date = join_date;
	}

	public Faculty() {
	}
	
	public void setFacultyId(String id){
		id = "fac_"+Name;
		super.setId(id);
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public Calendar getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Calendar join_date) {
		this.join_date = join_date;
	}


	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	
}
