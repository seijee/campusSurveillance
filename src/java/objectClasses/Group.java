/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author SeiJee
 */
public class Group implements Serializable {
	private Long group_id;
	private Set<Person> people = new HashSet<Person>();
	private String Title;

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

	
	
	public void addPeople(Set<Person> personset) {
		SessionFactory sf = controllers.conn.getSf();
		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		Query query = session.createSQLQuery("DELETE FROM people_group where groupid = '"+this.group_id+"'");
		//int executeUpdate = query.executeUpdate();
		for (Person p : personset){
			query = session.createSQLQuery("INSERT INTO people_group VALUES(?,?)");
			query.setLong(0, group_id);
			query.setString(1, p.getId());
			query.executeUpdate();
		}
		t.commit();
		this.people = personset;
		session.close();
	}
	
}
