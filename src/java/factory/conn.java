/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package factory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SeiJee
 */
public class conn {
	private static SessionFactory sf;

	public static SessionFactory getSf() {
		if (sf==null || sf.isClosed()){
			sf = new Configuration().configure().buildSessionFactory();
		}
		return sf;
	}

	public static void setSf(SessionFactory sf) {
		conn.sf = sf;
	}
}
