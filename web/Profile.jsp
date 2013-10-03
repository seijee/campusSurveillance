<%-- 
    Document   : GroupList
    Created on : Aug 19, 2013, 11:24:42 AM
    Author     : SeiJee
--%>

<%@page import="objectClasses.Person"%>
<%@page import="objectClasses.Student"%>
<%@page import="java.util.Set"%>
<%@page import="objectClasses.Group"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
Person p = (Person)session.getAttribute("user");
if (p==null){
	response.sendRedirect("index.jsp");
}
%>
		<table border="0">
				<tr>
					<td></td>
					<td><%=p.getId() %></td>
				</tr>
				<tr>
					<td></td>
					<td><%= p.getfName() %></td>
				</tr>
				<tr>
					<td></td>
					<td><%=p.getEmail() %></td>
				</tr>
				<tr>
					<td><%= p.getGender() %></td>
					<td><%= p.getType() %></td>
				</tr>
		</table>
				
<%
Set<Group> groups = p.getGroups();
if (!groups.isEmpty()){
	for (Group g: groups){
		out.println(g.getGroup_id() + "<br/>"); 
	}
}
%>
    </body>
</html>
