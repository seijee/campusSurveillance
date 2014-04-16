	<%@page import="objectClasses.people.Person"%>
<!-- backi to top -->
	<a href="" id="to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Modals --->
	
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

					<!-- Text input>  ---->
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
								<option>General</option>
								<% if (!user.getType().equalsIgnoreCase("student")){ %>
									<option>Primary</option>
								<% } %>
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

	
	
	<div id="modal-user-account" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body remove-padding">
					<div class="block-tabs block-themed">
						<div class="block-options">
							<a class="btn btn-option" data-dismiss="modal"><i class="gi gi-remove_2"></i></a>
						</div>
						<ul class="nav nav-tabs" data-toggle="tabs">
						<li class="active"><a href="http://pixelcave.com/demo/flatapp/page_ready_blank.php#modal-user-account-account"><i class="fa fa-cog"></i> Account</a></li>
						<li><a href="http://pixelcave.com/demo/flatapp/page_ready_blank.php#modal-user-account-profile"><i class="fa fa-user"></i> Profile</a></li>
						</ul>
						<div class="tab-content">
						<div class="tab-pane active" id="modal-user-account-account">
						<form action="http://pixelcave.com/demo/flatapp/index.php" method="post" class="form-horizontal" onsubmit="return false;">
						<div class="form-group">
						<label class="control-label col-md-4">Username</label>
						<div class="col-md-8">
						<p class="form-control-static">admin</p>
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-account-email">Email</label>
						<div class="col-md-8">
						<input type="text" id="modal-account-email" name="modal-account-email" class="form-control" value="admin@exampleapp.com">
						</div>
						</div>
						<h4 class="sub-header">Change Password</h4>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-account-pass">Current Password</label>
						<div class="col-md-8">
						<input type="password" id="modal-account-pass" name="modal-account-pass" class="form-control">
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-account-newpass">New Password</label>
						<div class="col-md-8">
						<input type="password" id="modal-account-newpass" name="modal-account-newpass" class="form-control">
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-account-newrepass">Retype New Password</label>
						<div class="col-md-8">
						<input type="password" id="modal-account-newrepass" name="modal-account-newrepass" class="form-control">
						</div>
						</div>
						</form>
						</div>
						<div class="tab-pane" id="modal-user-account-profile">
						<form action="http://pixelcave.com/demo/flatapp/index.php" method="post" class="form-horizontal" onsubmit="return false;">
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-profile-name">Name</label>
						<div class="col-md-8">
						<input type="text" id="modal-profile-name" name="modal-profile-name" class="form-control" value="John Doe">
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-profile-gender">Gender</label>
						<div class="col-md-4">
						<select id="modal-profile-gender" name="modal-profile-name" class="form-control">
						<option value="m">Male</option>
						<option value="f">Female</option>
						</select>
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-profile-birthdate">Birthdate</label>
						<div class="col-md-4">
						<div class="input-group">
						<input type="text" id="modal-profile-birthdate" name="modal-profile-birthdate" class="form-control input-datepicker-close">
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
						</div>
						</div>
						</div>
						<div class="form-group">
						<label class="control-label col-md-4" for="modal-profile-bio">Bio</label>
						<div class="col-md-8">
						<textarea id="modal-profile-bio" name="modal-profile-bio" class="form-control" rows="3" placeholder="Bio Information.."></textarea>
						</div>
						</div>
						</form>
						</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<button class="btn btn-success" data-dismiss="modal"><i class="fa fa-floppy-o"></i> Save</button>
				</div>
			</div>
		</div>
	</div>