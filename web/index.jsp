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
		} else {
		}
	}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link type="text/css" href="./css/bootstrap3.css" rel="stylesheet" />
		<link type="text/css" href="./css/login.css" rel="stylesheet" />
        <title>Login</title>
    </head>
    <body>
		<%
			Person user = (Person) session.getAttribute("user");
			if (user == null) {%>

		<div class="container">
			<form action="" method="POST" class="form-signin" role="form">
				<h2 class="form-signin-heading">Sign in</h2>
				<input type="text" name="user_id" class="form-control" placeholder="User Name" required autofocus>
				<input type="password" name="password" class="form-control" placeholder="Password" required>
				<!--label class="checkbox">
				  <input type="checkbox" value="remember-me"> Remember me
				</label-->
				<button class="btn btn-lg btn-primary btn-block" type="submit" name="SignIn" value="SignIn">Sign in</button>
			</form>
		</div>
		<% } else {%>
		<a href=".SignOut" >logout</a>
		<%
				// if admin
				if (user.getClass().equals(Admin.class)) {
					response.sendRedirect("home.jsp");
				}
				// if faculty
				if (user.getClass().equals(Faculty.class)) {
					response.sendRedirect("./home.jsp");
				}

				// if student
				if (user.getClass().equals(Student.class)) {
					response.sendRedirect("home.jsp");
				}
			}
		%>
    </body>
</html>
