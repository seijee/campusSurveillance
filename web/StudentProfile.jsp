<%-- 
    Document   : GroupList
    Created on : Aug 19, 2013, 11:24:42 AM
    Author     : SeiJee
--%>

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
		<form>
			<input type="text" name="sid" value="" /><input type="submit" value="View" />
		</form>
        <%
			Student student = null;
			if (request.getParameter("sid")!=null)
			student = (Student)controllers.Person_DRL.getPerson(request.getParameter("sid"));
			if (student!=null){
				Set<Group> groups = student.getGroups();
		%>
		<table border="0">
				<tr>
					<td></td>
					<td><%=student.getId() %></td>
				</tr>
				<tr>
					<td></td>
					<td><%= student.getfName() %></td>
				</tr>
				<tr>
					<td></td>
					<td><%=student.getEmail() %></td>
				</tr>
				<tr>
					<td><%=student.getCategory() %></td>
					<td><%= groups.size() %></td>
				</tr>
		</table>
				
		<% 
			if (!groups.isEmpty()){
			for (Group g: groups){
				out.println(g.getGroup_id() + "<br/>"); 
			}
		}
		} %>
    </body>
</html>
