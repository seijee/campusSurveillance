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
@WebServlet(name = "UploadFile", urlPatterns = {"*.ImportStudents", "*.AddViaXLS"})
public class AddViaXLS extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List fileItemsList = null;
		float filesize = 0;
		String _fileLink;
		String groupName="";
		String groupId="";
		String _fileName = null;
		ServletConfig sc = getServletConfig();
		String _uploadDir = sc.getServletContext().getRealPath("/upload/");
		//Change upload with your directory
		String task = "";
		PrintWriter out = response.getWriter();
		out.print("xls");
		try {
			if (ServletFileUpload.isMultipartContent(request)) {
				ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
				try {
					fileItemsList = servletFileUpload.parseRequest(request);
				} catch (FileUploadException ex) {
					ex.printStackTrace();
				}
				String optionalFileName = "";
				FileItem fileItem1 = null;
				ArrayList<FileItem> flist = new ArrayList<FileItem>();
				Iterator it = fileItemsList.iterator();
				while (it.hasNext()) {
					FileItem fileItemTemp = (FileItem) it.next();
					if (fileItemTemp.isFormField()) {
						if (fileItemTemp.getFieldName().equals("filename")) {
							optionalFileName = fileItemTemp.getString();
						}if (fileItemTemp.getFieldName().equalsIgnoreCase("submit")){
							task = fileItemTemp.getString();
						}if (fileItemTemp.getFieldName().equalsIgnoreCase("group")){
							groupName = fileItemTemp.getString();	//used while adding a group
						}if (fileItemTemp.getFieldName().equalsIgnoreCase("gid")){
							groupId = fileItemTemp.getString();	//used while adding a group
							System.out.println(groupId);
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
						System.out.println(fileItemTemp.getName() + " check2");
					}
				}
				//if(!flist.isEmpty())

				for (FileItem fileItem : flist) {
					long size_long = fileItem.getSize();
					filesize = size_long / 1024;
					filesize = filesize / 1000;
					//If you want to limit the file size. Here 30MB file size is allowed you can change it
					if (filesize > 30.0) {
						//File size greater than 30 MB
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
								
								if (!file.getName().endsWith("xls")) {
									out.print("Are you sure the file was in .xls format?");
								} else {
									fileItem.write(file);
									
									if ("addStudents".equalsIgnoreCase(task)){
										List<Student> s = dao.Excel.ImportStudents(file);
										file.delete();
										request.setAttribute("newStudents", s);
										request.setAttribute("groupName", file.getName());
										RequestDispatcher dispatcher = request.getRequestDispatcher("./addStudent.jsp");
										if (dispatcher != null) {
											dispatcher.forward(request, response);
										}
									}else if ("uploadAttendance".equalsIgnoreCase(task)){
										List<objectClasses.AttendanceReport> s = dao.Excel.ImportPunctuality(file);
										//file.delete();
										request.setAttribute("newAttendanceReports", s);
										request.setAttribute("gid", groupId);
										
										RequestDispatcher dispatcher = request.getRequestDispatcher("./uploadAttendance.jsp");
										if (dispatcher != null) {
											dispatcher.forward(request, response);
										}
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	
	private static void addStudents(HttpServletRequest request, HttpServletResponse response ){
		
	}

	//<editor-fold defaultstate="collapsed" desc="do get do post">
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
	//</editor-fold>
}
