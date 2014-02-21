/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.util.Calendar;
import java.util.List;
import java.util.Random;
import objectClasses.Group;
import objectClasses.people.Faculty;
import objectClasses.people.Person;
import objectClasses.people.Student;

/**
 *
 * @author SeiJee
 */
public class TestGroups {
	static Random  r= new Random(1);
	public static void main(String[] args) {
//		Faculty f = (Faculty) dao.ConPerson.getPerson("fac302");
//		List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(f);
//		
//		for (Group g: alliedGroups){
//			System.out.println(g.getGroup_id());
//		}
		groupGenerator();
		
		for (int i=1;i<=11; i++){
			Group group = dao.GroupModule.getGroup(i+"");
			List<Person> fm = dao.GroupModule.getNonStudents(group);
			System.out.println("****"+i+"*****");
			for (Person f : fm){
				//Faculty f = (Faculty) fac;
				System.out.println(f.getId()+" "+f.getName());
			}
		}
	}
	
	static void groupGenerator(){
		Group g = null;
		for (int i=1; i<=100; i++){
			g = new Group("group900"+i, "fac30"+i, "concrete","description");
			dao.GroupModule.SaveGroup(g);
			int x = (i-1)*30;
			System.out.println(x+" "+(x+30)+" "+g.getGroup_id());
			testAddMembers(x, x+30, g.getGroup_id()+"");
		}
	}
	static void testAddMembers(int i, int n, String gid){
		Group g = dao.GroupModule.getGroup(gid);
		System.out.println(gid);
		System.out.println(g.getTitle()+" "+g.getOwner()+" "+g.getType());
		List<Person> l = dao.GroupModule.getAllStudents();
		String[] x = new String[n+5];
		int index =0;
		for (  ; i<n && i<l.size(); i++){
			x[index++] = l.get(i).getId();
		}
		System.out.println("adding...");
		
		if ("concrete".equals(g.getType())){
			for (int j=1; j<=5; j++){
				r.setSeed(Calendar.getInstance().getTimeInMillis());
				int id = 301+(r.nextInt(j*1000))%j;
				x[index++] = "fac"+id;
				System.out.println("added fac"+id);
			}
		}
		dao.GroupModule.addMembersToGroup(x, g);
	}
}
