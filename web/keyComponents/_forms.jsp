<%@page import="java.util.List"%>
<%@page import="objectClasses.Department"%>
<!-- Modal -->
<div class="modal fade" id="addFaculty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Faculty</h3>
			</div>
			<form action="Faculty.New" method="POST" class="form-horizontal">
				<div class="modal-body">

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="name">Name*</label>
						<div class="col-sm-9">
							<input id="name" name="name" type="text" placeholder="Name" class="form-control" required="required">
						</div>
					</div>

					<!-- Multiple Radios (inline) -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="gender">Gender*</label>
						<div class="col-sm-9">
							<label class="radio inline" for="gender-0">
								<input type="radio" name="gender" id="gender-0" value="male" checked="checked" >
								male
							</label>
							<label class="radio inline" for="gender-1">
								<input type="radio" name="gender" id="gender-1" value="female" >
								female
							</label>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="dob">DOB*</label>
						<div class="col-sm-9" >
							<div class=" datepicker"><input id="dob" name="dob" type="text" placeholder="select Date of Birth" class="form-control" required readonly style="cursor:pointer; background-color:white;" ></div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="mobile">Mobile No*</label>
						<div class="col-sm-9">
							<input id="mobile" name="mobile" type="text" placeholder="Mobile Number" class="form-control" required="required" >
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="email ID*">Email</label>
						<div class="col-sm-9">
							<input id="email" name="email" type="text" placeholder="email address" class="form-control" required="required" >
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="father_name">Father</label>
						<div class="col-sm-9">
							<input id="father_name" name="father_name" type="text" placeholder="Father" class="form-control">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="mother_name">Mother</label>
						<div class="col-sm-9">
							<input id="mother_name" name="mother_name" type="text" placeholder="Mother's Name" class="form-control">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="bloodgroup">Blood Group</label>
						<div class="col-sm-9">
							<select id="bloodgroup" name="bloodgroup" class="form-control">
								<option value="">-- Select Blood Group --</option>
								<option>A+</option>
								<option>A-</option>
								<option>B+</option>
								<option>B-</option>
								<option>AB+</option>
								<option>AB-</option>
								<option>O+</option>
								<option>O-</option>
							</select>
						</div>
					</div>

					<!-- Textarea -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="p_address">Permanent Address</label>
						<div class="col-sm-9">                     
							<textarea id="p_address" class="form-control" name="p_address" placeholder="permanent address"></textarea>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="qualification">Qualification</label>
						<div class="col-sm-9 control-label">
							<input id="qualification" name="qualification" type="text" placeholder="Qualification" class="form-control">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="designation">Designation</label>
						<div class="col-sm-9 control-label">
							<select id="designation" name="designation" class="form-control">
								<option value="coordinator">coordinator</option>
								<option>lab</option>
								<option>lecturer</option>
							</select>
						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="department">Department</label>
						<div class="col-sm-3 control-label">
							<select id="department" name="department" class="form-control">
								<option value="DD">DD</option>
								<% List<Department> departments = dao.DepartmentModule.getAllDepartments();%>
								<% for (Department department : departments) {%>
								<option value="<%=department.getDepCode()%>">[<%=department.getDepCode()%>] <%=department.getTitle()%></option>
								<%}%>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button  type="submit" name="submit" value="addFaculty" class="btn btn-primary">Add</button>
				</div>
			</form>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>





<div id="addFacultyOld" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
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
	</div>
</div>

<div class="modal fade" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Admin</h3>
			</div>
			<form action="Admin.New" method="POST" class="form-horizontal">
				<div class="modal-body">

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="name">Name*</label>
						<div class="col-sm-9">
							<input id="name" name="name" type="text" placeholder="Name" class="form-control" required="required">
						</div>
					</div>

					<!-- Multiple Radios (inline) -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="gender">Gender*</label>
						<div class="col-sm-9">
							<label class="radio inline" for="gender-0">
								<input type="radio" name="gender" id="gender-0" value="male" checked="checked" >
								male
							</label>
							<label class="radio inline" for="gender-1">
								<input type="radio" name="gender" id="gender-1" value="female" >
								female
							</label>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="dob">DOB*</label>
						<div class="col-sm-9" >
							<div class=" datepicker"><input id="dob" name="dob" type="text" placeholder="select Date of Birth" class="form-control" required readonly style="cursor:pointer; background-color:white;" ></div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="mobile">Mobile No*</label>
						<div class="col-sm-9">
							<input id="mobile" name="mobile" type="text" placeholder="Mobile Number" class="form-control" required="required" >
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="email ID*">Email</label>
						<div class="col-sm-9">
							<input id="email" name="email" type="text" placeholder="email address" class="form-control" required="required" >
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="father_name">Father</label>
						<div class="col-sm-9">
							<input id="father_name" name="father_name" type="text" placeholder="Father" class="form-control">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="mother_name">Mother</label>
						<div class="col-sm-9">
							<input id="mother_name" name="mother_name" type="text" placeholder="Mother's Name" class="form-control">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="bloodgroup">Blood Group</label>
						<div class="col-sm-9">
							<select id="bloodgroup" name="bloodgroup" class="form-control">
								<option value="">-- Select Blood Group --</option>
								<option>A+</option>
								<option>A-</option>
								<option>B+</option>
								<option>B-</option>
								<option>AB+</option>
								<option>AB-</option>
								<option>O+</option>
								<option>O-</option>
							</select>
						</div>
					</div>

					<!-- Textarea -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="p_address">Permanent Address</label>
						<div class="col-sm-9">                     
							<textarea id="p_address" class="form-control" name="p_address" placeholder="permanent address"></textarea>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="qualification">Qualification</label>
						<div class="col-sm-9 control-label">
							<input id="qualification" name="qualification" type="text" placeholder="Qualification" class="form-control">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="designation">Designation</label>
						<div class="col-sm-9 control-label">
							<select id="designation" name="designation" class="form-control">
								<option value="coordinator">coordinator</option>
								<option>lab</option>
								<option>lecturer</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">

					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button  type="submit" name="submit" value="addAdmin" class="btn btn-primary">Add</button>
				</div>

			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>

<div id="addAdminold" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Add New Admin</h3>
	</div>
	<form action="Admin.New" method="POST">
		<div class="modal-body">
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
					<td>address</td>
					<td><textarea name="raddress" rows="4" cols="20"></textarea></td>
				</tr>
				<tr>

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
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button  type="submit" name="submit" value="addAdmin" class="btn btn-primary">Add</button>
		</div>
	</form>
</div>

<div id="addStudents" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
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
					<button type="submit" name="submit" value="addStudents" class="btn btn-primary">Upload</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="addDepartment" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Add Department</h3>
			</div>
			<form action="Department.New" method="POST" class="form-horizontal">
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="code">Dep Code*</label>
						<div class="col-sm-9">
							<input name="code" type="text" placeholder="Department code" class="form-control" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="title">Name*</label>
						<div class="col-sm-9">
							<input id="name" name="title" type="text" placeholder="Department Name" class="form-control" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="hod">HOD</label>
						<div class="col-sm-9 control-label">
							<select id="hod" name="hod" class="form-control">
								<optgroup label="Default">
									<%List<Person> fl = dao.DepartmentModule.getDepFaculties("DD");%>
									<%for (Person p : fl) {%>
									<option value="<%= p.getId()%>" ><%= p.getName()%></option>
									<% }%>
								</optgroup>

								<%List<Department> dl = dao.DepartmentModule.getAllDepartments();%>
								<% for (Department d : dl) {%>
								<optgroup label="<%= d.getTitle()%>">
									<%fl = dao.DepartmentModule.getDepFaculties(d.getDepCode());%>
									<%for (Person p : fl) {%>
									<option value="<%= p.getId()%>" ><%= p.getName()%></option>
									<%}%>
								</optgroup>
								<%}%>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" name="submit" value="addDepartment" class="btn btn-primary">Save Department</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="createGroup" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Create Group</h3>
			</div>
			<form action="Group.New" method="POST" class="form-horizontal">
				<div class="modal-body">
					<div class="form-group" >
						<label class="col-sm-3 control-label" for="title">Name*</label>
						<div class="col-sm-9">
							<input id="name" name="group-title" type="text" placeholder="Group Title" class="form-control" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="type">Type</label>
						<div class="col-sm-9 control-label">
							<select id="type" name="type" class="form-control">
								<option value="general">General Purpose</option>
								<option value="concrete">Special Purpose</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="description">Group Description</label>
						<div class="col-sm-9">                     
							<textarea id="group-description" class="form-control" name="description" placeholder="Group Description"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" name="submit" value="createGroup" class="btn btn-primary">Create</button>
				</div>
			</form>
		</div>
	</div>
</div>
