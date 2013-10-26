/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objectClasses.Group;
import objectClasses.people.Admin;
import objectClasses.people.Faculty;
import objectClasses.people.Student;

/**
 *
 * @author SeiJee
 */
@WebServlet(name = "NewUser", urlPatterns = {"*.NewUser"})
public class NewUser extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean added=false;
		try {
			String task = request.getParameter("submit");
			out.print(task);
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
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		
		String designation = request.getParameter("designation");
		String qualifications = request.getParameter("qualification");
		Calendar join_date = Calendar.getInstance();
		String id = request.getParameter("email");
		String password = "aaa";
		String gender = request.getParameter("gender");
		String father_name = request.getParameter("father_name");
		String mother_name = request.getParameter("mother_name");
		String bloodgroup = request.getParameter("bloodgroup"); 
		String p_address = request.getParameter("p_address"); 
		String r_address = request.getParameter("r_address"); 
		String mobile = request.getParameter("mobile"); 
		String email = request.getParameter("email"); 
		String type = "admin"; 
		String photo = "default.jpg"; 
		String Name = request.getParameter("name"); 
		Calendar DOB = new GregorianCalendar(year, month, date);
		List<Group> groups=null;
		String display_pic = "notShared.jpg";
		
		Admin a = new Admin(designation, qualifications, join_date, id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
		
		return dao.NewUserModule.addNewAdmin(a);
	}

	private boolean addFaculty (HttpServletRequest request, HttpServletResponse response){
		
		 int year = Integer.parseInt(request.getParameter("year"));
		 int month = Integer.parseInt(request.getParameter("month"));
		 int date = Integer.parseInt(request.getParameter("date"));
		 
		String designation = request.getParameter("designation");
		String qualifications = request.getParameter("qualification");
		Calendar join_date = Calendar.getInstance();
		String department = request.getParameter("department");
		String id = request.getParameter("email");
		String password = "aaa";
		String gender = request.getParameter("gender");
		String father_name = request.getParameter("father_name");
		String mother_name = request.getParameter("mother_name");
		String bloodgroup = request.getParameter("bloodgroup"); 
		String p_address = request.getParameter("p_address"); 
		String r_address = request.getParameter("r_address"); 
		String mobile = request.getParameter("mobile"); 
		String email = request.getParameter("email"); 
		String type = "faculty"; 
		String photo = "default.jpg"; 
		String Name = request.getParameter("name"); 
		Calendar DOB = new GregorianCalendar(year, month, date);
		List<Group> groups=null;
		String display_pic = "notShared.jpg";
		
		Faculty f = new Faculty(qualifications, designation, department, join_date, id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
		
		return  dao.NewUserModule.addNewFaculty(f);	
	}
	
	private boolean addStudent (HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		boolean added=false;
		try {
			out = response.getWriter();
			
			String[] id_s = request.getParameterValues("id");
			String[] gender_s = request.getParameterValues("gender");
			String[] father_names_s = request.getParameterValues("father_name");
			String[] mother_name_s = request.getParameterValues("mother_name");
			String[] bloodgroup_s = request.getParameterValues("bloodgroup"); 
			String[] p_address_s = request.getParameterValues("p_address"); 
			String[] r_address_s = request.getParameterValues("r_address"); 
			String[] mobile_s = request.getParameterValues("mobile"); 
			String[] email_s = request.getParameterValues("email");  
			String[] Name_s = request.getParameterValues("name"); 
			String[] DOB_s = request.getParameterValues("dob");
			String[] batch_s = request.getParameterValues("batch");
			String[] semester_s = request.getParameterValues("semeseter");
			String[] branch_s = request.getParameterValues("branch");
			
			Student s;
			List<Student> sl = new ArrayList<Student>();
			for (int i=0; i<id_s.length; i++){
//				int year=Integer.parseInt(year_s[i]);
//				int month=Integer.parseInt(month_s[i]);
//				int date=Integer.parseInt(date_s[i]);
				//s = new Student();
				String category=null;
				String batch=null;
				String branch=null;
				int semester=0;
				String id = id_s[i];
				String password = "sss";
				String gender = gender_s[i];
				String father_name = father_names_s[i];
				String mother_name = mother_name_s[i];
				String bloodgroup = bloodgroup_s[i]; 
				String p_address = p_address_s[i]; 
				String r_address = r_address_s[i]; 
				String mobile = mobile_s[i]; 
				String email = email_s[i]; 
				String type = "student"; 
				String photo = "default.jpg"; 
				String Name = Name_s[i]; 
				Calendar DOB = extractDate(DOB_s[i]);
				List<Group> groups=null;
				String display_pic = "notShared.jpg";
				
				s=new Student(category, batch, branch, semester, id, password, gender, father_name, mother_name, bloodgroup, p_address, r_address, mobile, email, type, photo, Name, DOB, groups, display_pic);
				sl.add(s);
//				added = dao.NewUserModule.addNewStudentBatch(sl);
//				if (added){
//					out.println(s.getId()+" ["+s.getName()+"] added!!<br/>");
//				}
//				else {
//					out.print(s.getId()+" ["+s.getName()+"] could not be added!!<br/>");
//				}
			}
			added = dao.NewUserModule.addNewStudentBatch(sl);
			
		} catch (Exception ex) {
			throw ex;
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

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
