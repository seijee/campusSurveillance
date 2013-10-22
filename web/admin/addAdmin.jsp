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

<div class="main-left">
	
	<div class="header">
		<h1>Add New Administrator</h1>
	</div>

	<div class="content">
		<form action=".NewUser" method="POST">
			<h1>Basic Details</h1>
			<table>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" value="" size="20" placeholder="First Name"/></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
						<label><input type="radio" name="gender" value="male" />Male</label>
						<label><input type="radio" name="gender" value="female" />Female</label>
					</td>
				</tr>
				<tr>
					<td>DOB</td>
					<td>
						<select name="date">
							<%
							for (int i=1; i<=31; i++){
								out.println("<option value='"+i+"'>"+i+"</option>");
							}
							%>
						</select>
						<select name="month">
							<option value="0">JAN</option>
							<option value="1">FEB</option>
							<option value="2">MAR</option>
							<option value="3">APR</option>
							<option value="4">MAY</option>
							<option value="5">JUN</option>
							<option value="6">JUL</option>
							<option value="7">AUG</option>
							<option value="8">SEP</option>
							<option value="9">OCT</option>
							<option value="10">NOV</option>
							<option value="11">DEC</option>
						</select>
						
						<select name="year">
							<%
							for (int i=1940; i<2000; i++){
								out.println("<option value='"+i+"'>"+i+"</option>");
							}
							%>
						</select>
					</td>
				</tr>
				</table>
				<h1>Contact Details</h1>
				<table>
				<tr>
					<td>Mobile No</td>
					<td><input type="text" name="mobile" value="" size="40" placeholder="Mobile Number"/></td>
				</tr>
				<tr>
					<td>email Id</td>
					<td><input type="text" name="email" value="" size="40" placeholder="email ID"/></td>
				</tr>
				<tr>
					<td>address</td>
					<td><textarea name="raddress" rows="4" cols="20"></textarea></td>
				</tr>
				</table>
				<h1>Personal Details</h1>
				<table>
				<tr>
					<td>Father's Name</td>
					<td><input type="text" name="father" value="" size="40" placeholder="Father Name"/></td>
				</tr>
				<tr>
					<td>Mother's Name</td>
					<td><input type="text" name="mother" value="" size="40" placeholder="Mother Name"/></td>
				</tr>
				<tr>
					<td>Bloodgroup</td>
					<td><input type="text" name="bloodgroup" value="" size="40" placeholder="bloodgroup"/></td>
				</tr>
				
				
				<!-- Admin specific Properties-->
				<tr>
					<td>Designation</td>
					<td>
						<select name="designation">
							<option value="admin">Default</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Qualification</td>
					<td><input type="text" name="qualification" value="" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="addAdmin" name="submit" /></td>
				</tr>
			</table>
		</form>
	</div>

</div>

<div class="nav">
	
	<div class="logo"><span></span></div>

	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li><a href="home.jsp">Notifications</a></li>
		<li><a href="home.jsp">Messages</a></li>
		<li><a href="home.jsp">Logs</a></li>
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
			<li><a href="home.jsp">Browse People</a></li>
			<li><a href="home.jsp">Manage Groups</a></li>
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
