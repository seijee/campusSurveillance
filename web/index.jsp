<%-- 
    Document   : index
    Created on : Aug 17, 2013, 12:55:37 PM
    Author     : SeiJee
--%>

<%@page import="objectClasses.people.*"%>
<%@page import="dao.SessionModule"%>
<%@page import="java.util.Set"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
	response.setHeader("Pragma", "no-cache");

	Person p;
	if (request.getParameter("SignIn") != null) {
		SessionModule c = new SessionModule();
		String uid = request.getParameter("user_id");
		String pw = request.getParameter("password");
		p = c.CheckLogin(uid, pw);
		if (p != null) {
			session.setAttribute("user", p);
		}
	}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link type="text/css" href="./css1/bootstrap.css" rel="stylesheet" />
		<link type="text/css" href="./css1/bootstrap-responsive.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
    <body>
		<%
			Person user = (Person) session.getAttribute("user");
			if (user == null) {%>

		<div class="well">
		<form action="" method="POST" class="form-horizontal offset4">
			<div class="control-group">
				<label class="control-label" for="user_id">User Id</label>
				<div class="controls">
					<input type="text" name="user_id" id="user_id" placeholder="User Id"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<input type="password" name="password" id="password" placeholder="Password"/>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox">
						<input type="checkbox"> Remember me
					</label>
					<button type="submit" name="SignIn" value="SignIn" class="btn">Sign in</button>
				</div>
			</div>
		</form>
		</div>
		<% } else {%>
		<a href=".SignOut" >logout</a>
		<%
		// if admin
				if (user.getClass().equals(Admin.class)) {
					response.sendRedirect("admin/home.jsp");
				}
		// if faculty
				if (user.getClass().equals(Faculty.class)) {
					response.sendRedirect("faculty/home.jsp");
				}

		// if student
				if (user.getClass().equals(Student.class)) {
					response.sendRedirect("student/home.jsp");
				}
			}
		%>
    </body>
</html>
