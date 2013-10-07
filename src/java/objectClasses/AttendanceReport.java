/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objectClasses;

import java.io.Serializable;
import java.util.Calendar;

/**
 *
 * @author SeiJee
 */
public class AttendanceReport implements Serializable{
	private String id, regards, writer, sessionId;
	private int attended, lecturesHeld;
	private Calendar begin,end, updatedOn;

	public AttendanceReport() {
		attended=0;
		lecturesHeld=0;
	}

	
	
	public int getAttended() {
		return attended;
	}

	public void setAttended(int attended) {
		this.attended = attended;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String faculty) {
		this.writer = faculty;
	}

	public Calendar getBegin() {
		return begin;
	}

	public void setBegin(Calendar from) {
		this.begin = from;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getLecturesHeld() {
		return lecturesHeld;
	}

	public void setLecturesHeld(int lecturesHeld) {
		this.lecturesHeld = lecturesHeld;
	}

	public String getRegards() {
		return regards;
	}

	public void setRegards(String regards) {
		this.regards = regards;
	}

	public Calendar getEnd() {
		return end;
	}

	public void setEnd(Calendar to) {
		this.end = to;
	}

	public Calendar getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}

 
}
