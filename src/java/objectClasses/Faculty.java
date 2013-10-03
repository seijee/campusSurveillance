/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses;

import java.util.Calendar;

/**
 *
 * @author SeiJee
 */
public class Faculty extends Person {
	private String qualification,designation ;
	private Department department;
	private Calendar join_date;
	
	
	public void setFacultyId(String id){
		id = "fac_"+Name;
		super.setId(id);
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
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
