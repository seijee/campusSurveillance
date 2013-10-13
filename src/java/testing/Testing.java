/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;

/**
 *
 * @author SeiJee
 */
public class Testing {
	public static void main(String[] args) {
		List s = GetTables();
		for (Object st : s) System.out.println(st);
	}
	public static List GetTables(){
		Session session = factory.conn.getSf().openSession();
		
		Query q = session.createSQLQuery("SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE()");
		List tables = q.list();

		session.close();
		return tables;
	}
	public static List GetTableData(String table){
		Session session = factory.conn.getSf().openSession();
		
		Query q = session.createSQLQuery("SELECT * FROM "+table);
		List tabledata = new ArrayList();
		ScrollableResults scroll = q.scroll();
		q = session.createSQLQuery("SELECT column_name FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='"+table+"'");
		
		int count=0;
		while (scroll.next()){
			if ((count++)%30==0)tabledata.add(q.list().toArray());
			Object[] array = scroll.get();
			tabledata.add(array);
			
		}
		session.close();
		return tabledata;
	}
}
