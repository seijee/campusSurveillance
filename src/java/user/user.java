/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.util.List;
import java.util.Set;
import objectClasses.Group;
import objectClasses.Person;



public class user {
	public static void main(String[] args) {
		Group g = dao.GroupModule.getGroup("2");
		System.out.println("group title is "+g.getTitle());
		printMembers(g);
	}
	static void printMembers (Group g){
		List<String> mermbers = dao.GroupModule.getMermberNames(g);
		for (String p : mermbers){
			System.out.println(" "+p);
		}
	}
}
