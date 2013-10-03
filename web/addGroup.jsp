<%-- 
    Document   : AddStudent
    Created on : Aug 17, 2013, 8:36:20 PM
    Author     : SeiJee
--%>

<%@page import="java.util.List"%>
<%@page import="objectClasses.Person"%>
<%@page import="objectClasses.Group"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<script>
			function addField(){
				$st = document.getElementById("studentTable");
				var start = parseInt(document.getElementById("start").value);
				var last = parseInt(document.getElementById("total").value)+start;
				$clgid = document.getElementById("collegeId").value;
				$branch = document.getElementById("branch").value;
				$prefix = document.getElementById("prefix").value;
				for ($i=start; $i<=last; $i++){
					$count = $st.rows.length;
					$row = $st.insertRow($count);
					
					if ($i<10){$enrol = "00"+$i;}
					else if ($i<100){$enrol = "0"+$i;}
					else if ($i<1000){$enrol = ""+$i;}
					$enrol = $clgid+$branch+$prefix+$enrol;
					
					$check = $row.insertCell(0);
					
					$check.innerHTML = "<input type='checkbox' value='OFF' />";
					$cell0 = $row.insertCell(1);
					$cell0.innerHTML = "<td><input type='text' name='student_ids' value='"+$enrol+"' size='25'  /></td>"
					
				}
			}
			
			function deleteRows(){
				$st = document.getElementById("studentTable");
				try {
            var table = document.getElementById("studentTable");
            var rowCount = table.rows.length-1;
 
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
 
 
            }
            }catch(e) {
                alert(e);
            }
				
			}
		</script>
		
    </head>
<%
	List<Person> people = controllers.ConPerson.getPeople();
%>
    <body>
		<div width ="100%" height="300px">
			<table align="center">
				<tr>
					<td><input type="text" id="collegeId" value="" size="5" /></td>
					<td><input type="text" id="branch" value="" size="3" /></td>
					<td><input type="text" id="prefix" value="" size="5" /></td>
					<td><input type="text" id="start" value="1" size="3" /></td>
					<td><input type="text" id="total" value="120" size="3" /></td>
				</tr>
			</table>
			<input onclick="addField();" type="button" value="Add" />
			<input onclick="deleteRows();" type="button" value="Delete" />
		</div>
		<div>
		<form action="AddGroupServlet" method="POST">
			<table id="studentTable" border="0">
				<tr>
						<td>
						<select name="gid">
<%
	Set<Group> groups = controllers.Group_DRL.getThemAll();
	for (Group g : groups){
		%>
							<option value="<%= g.getGroup_id() %>"><%= g.getGroup_id() %></option>
		<%
	}
%>
							<option value="new">New Group</option>
						</select></td>
				</tr>
				<tr>
					<td></td>
					<td>Enrollment No.</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>email</td>
				</tr>
			<% for (Person p : people) { %>
				<tr>
					<td><input type='checkbox' name="slected" value='OFF' /></td>
					<td><input type='text' name='student_ids' value='<%=p.getId()%>' size='25' readonly /> </td>
					<td><%=p.getName() %></td>
					<td><%=p.getEmail() %></td>
					<td><%=p.getMobile() %></td>
					
				</tr>
			<% }%>
			</table>
			<input type="submit" value="Add Students" name="add" />
		</form>
		</div>
    </body>
</html>
