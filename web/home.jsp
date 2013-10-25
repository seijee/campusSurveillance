<%-- 
    Document   : home2
    Created on : Sep 14, 2013, 12:39:22 AM
    Author     : SeiJee
--%>
<%@page import="objectClasses.Group"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="objectClasses.people.Person"%>
<%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setHeader("Pragma", "no-cache");
	//if (!user.getClass().equals(objectClasses.people.Admin.class)) response.sendRedirect("unAuthorisedAccess");
%>


<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
<meta name="description" content="College Management system"/>
<meta name="keywords" content="keywords"/> 
<meta name="author" content="Charchit"/> 
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css" media="screen"/>
<title>Home</title>
</head>
<body>
	<%@include file="_navbar.jsp" %>
	<div class="container-fluid">
		
	</div>
</body>

</html>
