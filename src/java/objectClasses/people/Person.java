/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses.people;

import java.util.Calendar;
import java.util.List;
import objectClasses.Group;

/**
 *
 * @author SeiJee
 */
public abstract class Person {
	protected String id, password;
	protected String gender,father_name, mother_name, bloodgroup,
	p_address, r_address, mobile,email, type, photo,Name;
	protected Calendar DOB;
	protected List<Group> groups;
	public String display_pic;

	public Person(String id, String password, String gender, String father_name, String mother_name, String bloodgroup, String p_address, String r_address, String mobile, String email, String type, String photo, String Name, Calendar DOB, List<Group> groups, String display_pic) {
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.father_name = father_name;
		this.mother_name = mother_name;
		this.bloodgroup = bloodgroup;
		this.p_address = p_address;
		this.r_address = r_address;
		this.mobile = mobile;
		this.email = email;
		this.type = type;
		this.photo = photo;
		this.Name = Name;
		this.DOB = DOB;
		this.groups = groups;
		this.display_pic = display_pic;
	}

	public Person() {
	}
	
	
	
	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}
	
	public Calendar getDOB() {
		return DOB;
	}

	public void setDOB(Calendar DOB) {
		this.DOB = DOB;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getDisplay_pic() {
		return display_pic;
	}

	public void setDisplay_pic(String display_pic) {
		this.display_pic = display_pic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getFather_name() {
		return father_name;
	}

	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMother_name() {
		return mother_name;
	}

	public void setMother_name(String mother_name) {
		this.mother_name = mother_name;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getR_address() {
		return r_address;
	}

	public void setR_address(String r_address) {
		this.r_address = r_address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	
}
