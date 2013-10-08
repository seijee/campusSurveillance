/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses.people;

import java.util.List;
import objectClasses.Group;
import objectClasses.people.Person;
import java.util.Calendar;



public class Admin extends Person {
	
	private String  designation;
	private String qualifications;
	private Calendar join_date;
	
	public Admin(String designation, String qualifications, Calendar join_date, String id, String password, String gender, String father_name, String mother_name, String bloodgroup, String p_address, String r_address, String mobile, String email, String type, String photo, String Name, Calendar DOB, List<Group> groups, String display_pic) {
		super(id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
		this.designation = designation;
		this.qualifications = qualifications;
		this.join_date = join_date;
	}
	
	public void setAdminId(String aid){
		aid = this.email;
		super.setId(aid);
	}
	
	public String getAdminId (){
		return id;
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


	public String getQualifications() {
		return qualifications;
	}

	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	
	@Override
	public String toString() {
		return "ObjectClasses.Admin[ id="  + " ]";
	}
	
}
