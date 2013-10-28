<%@page import="java.util.List"%>
<%@page import="objectClasses.Department"%>
<!-- Modal -->
<div id="addFaculty" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Add Faculty Member</h3>
	</div>
	<form action="Faculty.New" method="POST">
		<div class="modal-body">
			<table border="0">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" value="" size="40" placeholder="Name"/></td>
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
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i + "</option>");
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
								for (int i = 1940; i < 2000; i++) {
									out.println("<option value='" + i + "'>" + i + "</option>");
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
					<td><input type="text" name="father_name" value="" size="40" placeholder="Father Name"/></td>
				</tr>
				<tr>
					<td>Mother's Name</td>
					<td><input type="text" name="mother_name" value="" size="40" placeholder="Mother Name"/></td>
				</tr>
				<tr>
					<td>Bloodgroup</td>
					<td><input type="text" name="bloodgroup" value="" size="40" placeholder="bloodgroup"/></td>
				</tr>
				<tr>
					<td>address</td>
					<td><textarea name="p_address" rows="4" cols="20"></textarea></td>
				</tr>

				<!-***************Faculty specific details -->
				<tr>
					<td>qualification</td>
					<td><input type="text" name="qualification" value="" size="30" /></td>
				</tr>
				<tr>
					<td>designation</td>
					<td><select name="designation">
							<option value="coordinator">Class Coordinator</option>
							<option value="lab">Lab Assistant</option>
							<option value="lecturer">Lecturer</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>department</td>
					<td>
						<select name="department">
							<option value="DD">Default Department</option>
							<% List<Department> departments = dao.DepartmentModule.getAllDepartments();%>
							<% for (Department department : departments) {%>
							<option value="<%=department.getDepCode()%>">[<%=department.getDepCode()%>] <%=department.getTitle()%></option>
							<%}%>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			<button  type="submit" name="submit" value="addFaculty" class="btn btn-primary">Add</button>
		</div>
	</form>
</div>






<div id="addAdmin" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Add New Admin</h3>
	</div>
	<div class="modal-body">
		<p>Admin</p>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button class="btn btn-primary">Add</button>
	</div>
</div>



<div id="addStudents" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Upload Excel Sheet</h3>
	</div>
	<form action=".AddViaXLS" method="POST" enctype="multipart/form-data">
	<div class="modal-body">
		<table>
			<tr>
				<td><input type="file" name="myFile" multiple="multiple" /></td>
			</tr>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button type="submit" name="submit" value="Upload it" class="btn btn-primary">Upload</button>
	</div>
	</form>
</div>


<div id="addDepartment" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Add Department</h3>
	</div>
	<form action="Department.New" method="POST">
	<div class="modal-body">
		<table>
			<tr>
				<td>Dep Code</td>
				<td><input type="text" name="code" value="" size="30" /></td>
			</tr>
			<tr>
				<td>Dep Name</td>
				<td><input type="text" name="title" value="" size="30" /></td>
			</tr>
			<tr>
				<td>HOD</td>
				<td>
					<select name="HOD">
						<optgroup label="Default">
						<%List<Person> fl = dao.DepartmentModule.getDepFaculties("DD"); %>
						<%for(Person p : fl) {%>
						<option value="<%= p.getId()%>" ><%= p.getName()%></option>
						<% } %>
						</optgroup>
						
						<%List<Department> dl = dao.DepartmentModule.getAllDepartments(); %>
						<% for (Department d : dl){ %>
						<optgroup label="<%= d.getTitle() %>">
							<%fl = dao.DepartmentModule.getDepFaculties(d.getDepCode()); %>
							<%for(Person p : fl) {%>
							<option value="<%= p.getId()%>" ><%= p.getName()%></option>
							<%}%>
						</optgroup>
						<%}%>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button type="submit" name="submit" value="addDepartment" class="btn btn-primary">Save Department</button>
	</div>
	</form>
</div>
						
						
						
						
						

<div id="createGroup" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Create Group</h3>
	</div>
	<form action="Group.Create" method="POST">
		<div class="modal-body">
			<table>
				<tr>
					<td>Group Title</td>
					<td><input type="text" name="group-title" value="" size="30" /></td>
				</tr>
				<tr>
					<td>Purpose</td>
					<td>
						<select name="type">
							<option value="general">General Purpose</option>
							<option value="concrete">Special Purpose</option>
						</select>
					</td>
				</tr>
			</table>

		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" name="submit" value="createGroup" class="btn btn-primary">Create</button>
		</div>
	</form>
</div>