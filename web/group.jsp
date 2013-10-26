<%-- 
    Document   : Group
    Created on : Oct 25, 2013, 8:11:04 AM
    Author     : SeiJee
--%>

<%@page import="java.util.List"%>
<%
	objectClasses.Group group = dao.GroupModule.getGroup(request.getParameter("gid"));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
		<link type="text/css" href="css/bootstrap-responsive.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
	<body>
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid">
<% if (group==null){ %>
		<h4>No Group selected</h4>
<%}else{%>
		<h4><%=group.getTitle()%> <small>(<%=group.getType()%>)</small></h4>
		<%
			List<objectClasses.people.Person> gl = dao.GroupModule.getMembers(group);
			for (objectClasses.people.Person p : gl  ){
		%>	
		<div class="span2 pull-left text-center">
			<h6><%=p.getName()%></h6>
		</div>
		<%}%>
<%}%>
		</div>
	</body>
</html>
