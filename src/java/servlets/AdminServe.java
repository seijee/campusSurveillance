/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objectClasses.Admin;
import objectClasses.Faculty;
import objectClasses.Student;

/**
 *
 * @author SeiJee
 */
@WebServlet(name = "AdminServe", urlPatterns = {"*.AdminServe"})
public class AdminServe extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean added=false;
		try {
			String task = request.getParameter("submit");
			if (task.equals("addAdmin")){
				added = addNewAdmin(request, response);
			}
			if (task.equals("addFaculty")){
				added = addFaculty(request, response);
			}
			if (task.equals("addStudents")){
				added = addStudent(request, response);
			}
		} finally {			
			out.close();
		}
	}

	private boolean addNewAdmin (HttpServletRequest request, HttpServletResponse response){
		Admin a = new Admin();
		Calendar d = Calendar.getInstance();
		a.setJoin_date(d);
		d = Calendar.getInstance();
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		d.set(year, month, date);
		
		a.setName(request.getParameter("name"));
		a.setGender(request.getParameter("gender"));
		a.setDOB(d);
		a.setMobile(request.getParameter("mobile"));
		a.setEmail(request.getParameter("email"));
		a.setFather_name(request.getParameter("father"));
		a.setMother_name(request.getParameter("mother"));
		a.setBloodgroup(request.getParameter("bloodgroup"));
		a.setR_address(request.getParameter("raddress"));

		a.setType("admin");
		a.setAdminId("");
		a.setPassword("aaa");
		a.setDesignation(request.getParameter("designation"));
		a.setQualifications(request.getParameter("qualification"));

		return dao.NewUserModule.addNewAdmin(a);
	}

	private boolean addFaculty (HttpServletRequest request, HttpServletResponse response){
		Faculty f = new Faculty();

		//setting general and contact details

		 Calendar d = Calendar.getInstance();
		 f.setJoin_date(d);
		 int year = Integer.parseInt(request.getParameter("year"));
		 int month = Integer.parseInt(request.getParameter("month"));
		 int date = Integer.parseInt(request.getParameter("date"));
		 d.set(year, month, date);

		 //person specific
		 f.setName(request.getParameter("fname"));
		 f.setGender(request.getParameter("gender"));
		 f.setDOB(d);
		 f.setMobile(request.getParameter("mobile"));
		 f.setEmail(request.getParameter("email"));
		 f.setFather_name(request.getParameter("father"));
		 f.setMother_name(request.getParameter("mother"));
		 f.setBloodgroup(request.getParameter("bloodgroup"));
		 f.setR_address(request.getParameter("raddress"));
		 f.setType("Faculty");

		 //faculty specific
		 f.setFacultyId("fac_"+f.getName());
		 String dc = request.getParameter("department");

		 //f.setDepartment(academics.zAccess.getDepartment(dc));
		 f.setQualification(null);
		 f.setDesignation(request.getParameter("designation"));

		 return  dao.NewUserModule.addNewFaculty(f);	
	}
	
	private boolean addStudent (HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		boolean added=false;
		try {
			out = response.getWriter();
			String[] id = request.getParameterValues("student_ids");
			String[] name = request.getParameterValues("names");
			String[] father = request.getParameterValues("father");
			String[] mother = request.getParameterValues("mother");
			String[] gender = request.getParameterValues("gender");
			String[] dob = request.getParameterValues("dob");
			String[] email = request.getParameterValues("email");
			String[] mobile = request.getParameterValues("mobile");
			String[] p_address = request.getParameterValues("per_address");
			String[] category = request.getParameterValues("category");
			String[] batch = request.getParameterValues("batch");
			String[] semester = request.getParameterValues("semester");
			String[] branch = request.getParameterValues("branch");
			Student s;
			
			for (int i=0; i<id.length; i++){
				
				s = new Student();
				s.setId(id[i]);
				s.setName(name[i]);
				s.setFather_name(father[i]);
				s.setMother_name(mother[i]);
				s.setGender(gender[i]);
				s.setDOB(extractDate(dob[i]));
				s.setEmail(email[i]);
				s.setMobile(mobile[i]);
				s.setP_address(p_address[i]);
				s.setCategory(category[i]);
				s.setBatch(batch[i]);
				s.setSemester(Integer.parseInt(semester[i]));
				s.setBranch(branch[i]);
				s.setPassword("aaa");
			
				added = dao.NewUserModule.addNewStudent(s);
				if (added){
					out.println(s.getId()+" ["+s.getName()+"] added!!<br/>");
				}
				else {
					out.print(s.getId()+" ["+s.getName()+"] could not be added!!<br/>");
				}
			}
			
		} catch (Exception ex) {
			Logger.getLogger(AdminServe.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			out.close();
			return added;
		}
	}
	
	private static Calendar extractDate(String date){
		Calendar cal = null;
		try {	
			System.out.println(date);
				Date d = new SimpleDateFormat("yyyy'-'MMM'-'dd").parse(date);
				cal = new GregorianCalendar();
				cal.setTime(d);
				System.out.println(cal.toString());
			} catch (ParseException ex) {}
		return cal;
	}
	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/** 
	 * Handles the HTTP <code>GET</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/** 
	 * Handles the HTTP <code>POST</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/** 
	 * Returns a short description of the servlet.
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
