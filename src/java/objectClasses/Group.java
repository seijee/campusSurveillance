/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses;


import objectClasses.people.Person;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author SeiJee
 */
public class Group implements Serializable {
	private Long group_id;
	//private Person owner;
	private Set<Person> people =  new HashSet <Person>();
	private String Title, owner;

	public Long getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Long group_id) {
		this.group_id = group_id;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public Set<Person> getPeople() {
		return people;
	}

	public void setPeople(Set<Person> people) {
		this.people = people;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
}
