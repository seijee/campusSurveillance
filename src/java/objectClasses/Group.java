/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses;


import objectClasses.people.Person;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author SeiJee
 */
public class Group implements Serializable {
	private Long group_id;
	private Set<Person> people= new HashSet<Person>(), groupAdmin = new HashSet<Person>();
	private String Title, owner, type,description;

	public Group(String Title, String owner, String type, String description) {
		this.Title = Title;
		this.owner = owner;
		this.type = type;
		this.description = description;
	}
	/*public Group(String Title, String owner, String type) {
		this.Title = Title;
		this.owner = owner;
		this.type = type;
		people.add(dao.ConPerson.getPerson(owner));
	}*/
	public Group() {
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
