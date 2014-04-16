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
import objectClasses.Group;
import objectClasses.people.Person;



/**
 *
 * @author SeiJee
 */
@WebServlet(name = "AddGroupServlet", urlPatterns = {"*.AddMembers"})
public class GroupServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String task = request.getParameter("submit");
			out.print(task);
			/*if ("creategroup".equalsIgnoreCase(task)){
				Group ng = GroupCreater(request, response);
				response.sendRedirect("group.jsp?gid="+ng.getGroup_id());
			}else*/
			if ("addMembers".equalsIgnoreCase(task)){
				editMembers(request, response);
				String gid = request.getParameter("gid");
				response.sendRedirect("group.jsp?gid="+gid);
			}
		} finally {
			out.close();
		}
	}
	@Deprecated
	/*private static Group  GroupCreater (HttpServletRequest request, HttpServletResponse response){
		String title = request.getParameter("group-title");
		String type = request.getParameter("type");
		Person user = (Person) request.getSession(false).getAttribute("user");
		if (type == null || "".equals(type)) type = "general";
		Group group = dao.GroupModule.SaveGroup(new Group(title, user.getId(), type));
		if (group!=null){
				String[] x = {group.getOwner()};
				dao.GroupModule.addMembersToGroup(x, group);
		}
		return group;
	}*/
	private static boolean editMembers (HttpServletRequest request, HttpServletResponse response) throws IOException{
		String[] member_ids = request.getParameterValues("member_ids");
		String[] remove_ids = request.getParameterValues("remove_id");
		String gid = request.getParameter("gid");
		Person user = (Person) request.getSession(false).getAttribute("user");
		
		PrintWriter out = response.getWriter();
		out.print(gid);
		if (user!=null){
			objectClasses.Group g = null;
			if (!"new".equals(gid)) g=GroupModule.getGroup(gid);
			if (g==null) {
				out.println("group not found!");
			}
			GroupModule.addMembersToGroup(member_ids,g);
			GroupModule.removeMembersFromGroup(remove_ids, g);
		}
		return false;
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
