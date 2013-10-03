<%-- 
    Document   : index
    Created on : Aug 17, 2013, 9:15:56 AM
    Author     : SeiJee
--%>

<%@page import="java.util.Set"%>
<%@page import="objectClasses.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);
%> 
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action=".AdminServe" method="POST">
			<table border="0">
				<tr>
					<td>Name</td>
					<td><input type="text" name="fname" value="" size="40" placeholder="First Name"/>
						<input type="text" name="lname" value="" size="40" placeholder="Last Name"/></td>
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
				<tr>
					<td>Mobile No</td>
					<td><input type="text" name="mobile" value="" size="40" placeholder="Mobile Number"/></td>
				</tr>
				<tr>
					<td>email Id</td>
					<td><input type="text" name="email" value="" size="40" placeholder="email ID"/></td>
				</tr>
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
				<tr>
					<td>address</td>
					<td><textarea name="address" rows="4" cols="20"></textarea></td>
				</tr>
				
				<!-***************Faculty specific details -->
				<tr>
					<td>qualification</td>
					<td><input type="text" name="qualification" value="" size="30" /></td>
				</tr>
				<tr>
					<td>designation</td>
					<td><select name="designation">
							<option value="HOD">HOD</option>
							<option value="coordinator">Class Coordinator</option>
							<option value="lab">Lab Assistant</option>
							<option value="lecturer">Lecturer</option>
						</select></td>
				</tr>
				
				<tr>
					<td>department</td>
					<td><select name="department">
							<%
							Set<objectClasses.Department> departments = academics.zAccess.getDepartments();
							for (Department d : departments){
							%>
							<option value="<%=d.getDepartmentCode()%>"><%= d.getTitle()+" " %><%="["+d.getDepartmentCode()+"]" %></option>
							<% } %>
						</select></td>
				</tr>
		</table>
			<input type="submit" name="submit" value="addFaculty" />
		</form>
    </body>
</html>
