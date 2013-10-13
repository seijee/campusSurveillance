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
	private String  student, subject, updatedBy;
	private int id,thAttended, thTotal,lbsAttended ,lbsTotal,forSemester;
	private Calendar fromDate,toDate, updatedOn;

	public AttendanceReport() {
	}

	public AttendanceReport( String student, String subject, String updatedBy,
	int thAttended, int thTotal, int lbsAttended, int lbsTotal, int semester, 
	Calendar fromDate, Calendar toDate) {
		this.student = student;
		this.subject = subject;
		this.thAttended = thAttended;
		this.thTotal = thTotal;
		this.lbsAttended = lbsAttended;
		this.lbsTotal = lbsTotal;
		this.forSemester = semester;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.updatedOn = Calendar.getInstance();
		this.updatedBy = updatedBy;
	}
	
	
	@Override
	public String toString() {
		String s = subject+": "+student+" att "+thAttended+" outta "+thTotal+" from "+":"+forSemester+"sem";
		return s;
	}

	//<editor-fold defaultstate="collapsed" desc="getterSetters">
	public int getForSemester() {
		return forSemester;
	}
	
	public void setForSemester(int forSemester) {
		this.forSemester = forSemester;
	}
	
	public Calendar getFromDate() {
		return fromDate;
	}
	
	public void setFromDate(Calendar fromDate) {
		this.fromDate = fromDate;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getLbsAttended() {
		return lbsAttended;
	}
	
	public void setLbsAttended(int lbsAttended) {
		this.lbsAttended = lbsAttended;
	}
	
	public int getLbsTotal() {
		return lbsTotal;
	}
	
	public void setLbsTotal(int lbsTotal) {
		this.lbsTotal = lbsTotal;
	}
	
	public String getStudent() {
		return student;
	}
	
	public void setStudent(String student) {
		this.student = student;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public int getThAttended() {
		return thAttended;
	}
	
	public void setThAttended(int thAttended) {
		this.thAttended = thAttended;
	}
	
	public int getThTotal() {
		return thTotal;
	}
	
	public void setThTotal(int thTotal) {
		this.thTotal = thTotal;
	}
	
	public Calendar getToDate() {
		return toDate;
	}
	
	public void setToDate(Calendar toDate) {
		this.toDate = toDate;
	}
	
	public String getUpdatedBy() {
		return updatedBy;
	}
	
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	public Calendar getUpdatedOn() {
		return updatedOn;
	}
	
	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}
	//</editor-fold>
	
	
	
}
