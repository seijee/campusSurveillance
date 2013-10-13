/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.GroupModule;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author SeiJee
 */
@WebServlet(name = "AddGroupServlet", urlPatterns = {"*.AddMembers"})
public class AddGroupServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String[] student_ids = request.getParameterValues("student_ids");
			String gid = request.getParameter("gid");
			objectClasses.people.Person user = (objectClasses.people.Person) request.getSession(false).getAttribute("user");
			
			objectClasses.Group g = null;
			if (!"new".equals(gid))g=GroupModule.getGroup(gid);
			if (g==null) {
				String title = request.getParameter("group-title");
				String type = request.getParameter("type");
				if (type == null || type=="") type = "general";
				g=GroupModule.createGroup(title,user.getId(),type);
			}
			//ArrayList<String> s= new ArrayList<String>(student_ids);
			GroupModule.addMembersToGroup(student_ids,g);
		} finally {
			out.close();
		}
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
