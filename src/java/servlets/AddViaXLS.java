/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

//import bean.setNotification;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objectClasses.people.Student;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
/**
 *
 * @author Charchit
 */
@WebServlet(name = "UploadFile", urlPatterns = {"*.ImportStudents","*.AddViaXLS"})
public class AddViaXLS extends HttpServlet {
   
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     
	List fileItemsList = null;
	float filesize = 0;
	String _fileLink;
	String _fileName = null;
	 ServletConfig sc=getServletConfig();
	String _uploadDir = sc.getServletContext().getRealPath("/upload/");
	//Change upload with your directory
	HttpSession session = request.getSession();
	PrintWriter out = response.getWriter();

	try {
	 if (ServletFileUpload.isMultipartContent(request)) {
	 ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
		   try {
			fileItemsList = servletFileUpload.parseRequest(request);
		   } catch (FileUploadException ex) {

			   ex.printStackTrace();
			   //Change above line replace FileUploadExample with your file name
			   }
			   String optionalFileName = "";
			   FileItem fileItem1 = null;
				ArrayList<FileItem> flist= new ArrayList<FileItem>();
			   Iterator it = fileItemsList.iterator();
			   while (it.hasNext()) {
			   FileItem fileItemTemp = (FileItem) it.next();
				if (fileItemTemp.isFormField()) {
				   if (fileItemTemp.getFieldName().equals("filename")) {
					  optionalFileName = fileItemTemp.getString();
					  // System.out.println(optionalFileName+" check1");
				   }

				 /*
				 * If you want to pass some other data from JSP page. You can access then in this way.
				 * For each field you have do create if like below.
				 * if (fileItemTemp.getFieldName().equals("Name of other field like:Firstname")) {
				 * String Firstname = fileItemTemp.getString();
				 * }
				 */
				} else {
					  fileItem1 = fileItemTemp;
					  flist.add(fileItem1);
					  System.out.println(fileItemTemp.getName()+" check2");
				}
			 }
			   //if(!flist.isEmpty())

			 for (FileItem fileItem : flist) {
			   long size_long = fileItem.getSize();
			   filesize = size_long / 1024;
			   filesize = filesize / 1000;
			   //If you want to limit the file size. Here 30MB file size is allowed you can change it
			   if (filesize > 30.0) {
			   //Pass error message in session.
			   //setNotification _sN = new setNotification();
			   //_sN.setError("File size can't be more than 30MB");
			   //session.setAttribute("error", _sN);
			   } else {
			   _fileName = fileItem.getName();
			   if (fileItem.getSize() > 0) {
				  if (optionalFileName.trim().equals("")) {
					_fileName = FilenameUtils.getName(_fileName);
				  } else {
					_fileName = optionalFileName;
				  }
				   _fileLink = "../upload/" + _fileName;
				   try {
					   boolean a = new File(_uploadDir).mkdirs();

					File file = new File(new File(_uploadDir), fileItem.getName());
					fileItem.write(file);
					List<Student> s = dao.Excel.ImportStudents(file);
					request.setAttribute("newStudents", s);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("./addStudent.jsp");
					if (dispatcher != null){  
					  dispatcher.forward(request, response);  
					}
					if (s!=null)out.print(s.size());
				   } catch (Exception e) {
					e.printStackTrace();
				   }
				   //setNotification _sN = new setNotification();
				   //_sN.setError("File Uploaded to : " + _fileLink + "");
				   //session.setAttribute("error", _sN);
					}
				   }
			   
			 }
				//String referer = request.getHeader("Referer");
				//response.sendRedirect(referer);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}

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
    }// </editor-fold>

}
