/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SeiJee
 */
public class conn {
	private static SessionFactory sf;

	public static SessionFactory getSf() {
		if (sf==null){
			sf = new Configuration().configure().buildSessionFactory();
		}
		return sf;
	}

	public static void setSf(SessionFactory sf) {
		conn.sf = sf;
	}
	
}
