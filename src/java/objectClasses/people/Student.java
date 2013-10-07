/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses.people;


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
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final Student other = (Student) obj;
		if ((this.id == null) ? (other.id != null) : !this.id.equals(other.id)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		String print = getId()+"<br/>"+getName();
		getGroups();
		
		return  print;
	}
	
	

	@Override
	public int hashCode() {
		int hash = 3;
		hash = 83 * hash + (this.id != null ? this.id.hashCode() : 0);
		return hash;
	}
}
