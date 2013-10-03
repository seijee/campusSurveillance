<%-- 
    Document   : deleteStudent
    Created on : Sep 15, 2013, 2:26:02 PM
    Author     : SeiJee
--%>

<%@page import="objectClasses.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<String> students = controllers.Student_DRL.getStudentIds();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action=".DeleteStudent">
			<table>
				<tr>
					<td>
						<select name="sid">
							<% for(String id : students){ %>
							<option value="<%= id %>"><%= id %></option>
							<% } %>
						</select>
					</td>
					<td><input type="submit" value="Delete" /></td>
				</tr>
			</table>
		</form>
    </body>
</html>
