<%-- 
    Document   : index
    Created on : Aug 17, 2013, 12:55:37 PM
    Author     : SeiJee
--%>

<%@page import="objectClasses.Faculty"%>
<%@page import="objectClasses.Admin"%>
<%@page import="objectClasses.Student"%>
<%@page import="objectClasses.Person"%>
<%@page import="user.UserController"%>
<%@page import="java.util.Set"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setHeader("Pragma", "no-cache");

Person p;
if (request.getParameter("SignIn")!=null){
	UserController c = new UserController();
	String uid = request.getParameter("user_id");
	String pw = request.getParameter("password");
	p = c.CheckLogin(uid, pw);
	if (p!=null){
		session.setAttribute("user", p);
	}
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link type="text/css" href="./css/home.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
    <body>
<% 
Person user = (Person)session.getAttribute("user");
if (user==null){ %>
		<form action="" method="POST">
			<table border="0">
				<tr>
					<td>User Id</td>
					<td><input type="text" name="user_id" value="" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" value="" size="50" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="SignIn" name="SignIn" /></td>
				</tr>
			</table>
			<a href="jq/demos/index.html">jquery demo</a>
		</form>
<% }else{ 
//response.sendRedirect("StudentHome");
	%>

	<a href=".SignOut" >logout</a>
<% 
// Admin tasks
if (user.getClass().equals(Admin.class)){
	response.sendRedirect("admin/home.jsp");
}
// Faculty Tasks
if (user.getClass().equals(Faculty.class)){
	response.sendRedirect("faculty/home.jsp");
} 

// Student Tasks
if (user.getClass().equals(Student.class)){
	response.sendRedirect("student/home.jsp");
} 
}
%>
    </body>
</html>
