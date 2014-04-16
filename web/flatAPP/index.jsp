
<!DOCTYPE html>

<%@page import="objectClasses.people.*"%>
<%@page import="dao.SessionModule"%>
<%@page import="java.util.Set"%>



<html class=" js no-touch csstransitions">
<head>
	<%@include file="_components/head.jsp" %>
</head>
<body class="login no-animation">
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
<a href="" class="">

<img style="max-height: 60%; margin-top: 15px;float: right" src="./js_files/logo.png" alt="logo"/>

</a>
<%
			Person user = (Person) session.getAttribute("user");
			if (user == null) {%>
<div id="login-container">

<div class="tab-pane active" id="login-form-tab">
<form action="" method="post" id="login-form" class="form-horizontal">
<div class="form-group">
<div class="col-xs-12">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
<input type="text" id="login-email" name="user_id" class="form-control" placeholder="Email.." />
</div>
</div>
</div>
<div class="form-group">
<div class="col-xs-12">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
<input type="password" id="login-password" name="password" class="form-control" placeholder="Password.." />
</div>
</div>
</div>
<div class="form-group">
<div class="col-xs-12 clearfix">
<div class="pull-right">
	<button type="submit" name="SignIn" value="SignIn" class="btn btn-success remove-margin">Login</button>
</div>
<div class="pull-left login-extra-check">
</div>
</div>
</div>
</form>
</div>


</div>
<% } else {%>
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
	
	
	<%@include file="_components/javascripts.jsp" %>
</body>
</html>