<%-- 
    Document   : home2
    Created on : Sep 14, 2013, 12:39:22 AM
    Author     : SeiJee
--%>
<%@page import="objectClasses.people.Person"%>
<%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setHeader("Pragma", "no-cache");
	Person user = (Person)session.getAttribute("user");
	if (user==null) response.sendRedirect(".SignOut");
	if (!user.getClass().equals(objectClasses.people.Admin.class)) response.sendRedirect("unAuthorisedAccess");
%>


<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
<meta name="description" content="College Management system"/>
<meta name="keywords" content="keywords"/> 
<meta name="author" content="Charchit"/> 
<link rel="stylesheet" type="text/css" href="../css/default.css" media="screen"/>
<title>Fluid Solution</title>
</head>

<body>
<div class="header">
		<div style="background: red;height: 3%;margin-top:-40px; "></div>
</div>
<div class="main-left">
	
	<div class="header">
		<h2><span>message to be displayed</span></h2>
	</div>

	<div class="content">

		<h1>Notificaton #1</h1>
		<div class="descr">Jun 13, 2006 by Vulputate</div>

		<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Porttitor <a href="home.jsp">nunc eget pretium</a>, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>

		<blockquote><p>wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment </p></blockquote>
		<blockquote><p>party rockers... eureka!</p></blockquote>
		
		<h1>Notificaton #2</h1>
		<div class="descr">Jun 13, 2006 by Vulputate</div>

		<p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Porttitor <a href="home.jsp">nunc eget pretium</a>, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>

		<blockquote><p>wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment wow this is an awesome comment </p></blockquote>
		
	</div>

</div>

<div class="nav">
	
	<div class="logo"><span></span></div>

	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li><a href="home.jsp">Profile</a></li>
		<li><a href="home.jsp">People</a></li>
		<li><a href="home.jsp">Groups</a></li>
		<li><a href="home.jsp">Departments</a></li>
		<li><a href="home.jsp">Commerce</a></li>
		<li><a href=".SignOut">Sign Out</a></li>
	</ul>

</div>

<div class="main-right">

	<div class="round">		
		<div class="roundtl"><span></span></div>
		<div class="roundtr"><span></span></div>
		<div class="clearer"><span></span></div>
	</div>

	<div class="subnav">
		
		<h1>Profile</h1>
		<ul>
			<li><a href="home.jsp">Personal details</a></li>
			<li><a href="home.jsp">Public details</a></li>
			<li><a href="home.jsp">Contact details</a></li>
			<li><a href="home.jsp">Change Password</a></li>
		</ul>
		<h1>New User</h1>
		<ul>
			<li><a href="addAdmin.jsp">Add admin</a></li>
			<li><a href="addFaculty.jsp">Recruit Faculty</a></li>
			<li><a href="addStudent.jsp">Admissions</a></li>
		</ul>
		<h1>People</h1>
		<ul>
			<li><a href="../students.jsp">Browse People</a></li>
			<li><a href="deleteStudent.jsp">Delete Student</a></li>
			<li><a href="home.jsp">Manage Groups</a></li>
			<li><a href="../jq/shopping-cart.jsp">Manage Groups2</a></li>
			<li><a href="home.jsp">Publish Notice</a></li>
		</ul>
		
		<h1>Management Tasks</h1>
		<ul>
			<li><a href="home.jsp">Departments</a></li>
			<li><a href="home.jsp">Commerce</a></li>
		</ul>
	</div>

	<div class="round">
		<div class="roundbl"><span></span></div>
		<div class="roundbr"><span></span></div>
		<span class="clearer"></span>
	</div>

</div>

<div class="footer">

	<div class="left">&copy; 2013 <a href="home.jsp">Campus.com</a>.</div>
	
	<div class="right"><a href="">Designed</a> by <a href="">Charchit</a></div>

	<div class="clearer">&nbsp;</div>

</div>

</body>

</html>
