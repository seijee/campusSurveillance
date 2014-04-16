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
		<%@include file="keyComponents/_metroHead.jsp" %>
        <title>Login</title>
    </head>
    <body class="metro">
		<%
			Person user = (Person) session.getAttribute("user");
			if (user == null) {%>
		
	<div class="tile-area tile-area-dark">
		<a class="tile bg-darkBlue" data-click="transform">
			<div class="tile-content icon">
				<span class="icon-user"></span>
			</div>
		</a>
		<form action="" method="POST" class="form-signin" role="form">
		<div class="input-control text size2">
		<input type="text" name="user_id" class="form-control" placeholder="User Name" required autofocus/>
		<button class="btn-clear"></button>
		</div>

		<div class="input-control password size2 ">
		<input type="password" name="password" class="form-control" placeholder="Password" required/>
		<button class="btn-reveal"></button>
		</div>
			<button type="submit" name="SignIn" value="SignIn" class="primary">Button</button>
		</form>
	</div>
			
			
			
		<!--div class="container">
			<form action="" method="POST" class="form-signin" role="form">
				
				<input type="text" name="user_id" class="form-control" placeholder="User Name" required autofocus>
				<input type="password" name="password" class="form-control" placeholder="Password" required>
				<!--label class="checkbox">
				  <input type="checkbox" value="remember-me"> Remember me
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit" name="SignIn" value="SignIn">Sign in</button>
			</form>
		</div-->
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
