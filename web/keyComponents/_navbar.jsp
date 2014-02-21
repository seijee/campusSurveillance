<%@include file="_initSession.jsp" %>
<div class="navbar-wrapper">
	<div class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.jsp">eCampus</a>
            </div>



			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown"><strong><%=user.getName()%></strong></a>
						<ul class="dropdown-menu">
							<li class="text-right"><a href="user.SignOut">Sign Out</a></li>
						</ul>
					</li>
				</ul>

				<ul class="nav navbar-nav" id="main_menu">

					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown">Groups</a>
						<ul class="dropdown-menu dynamic" style="padding-top: 15px;">
							<li><a href="#createGroup" role="button"  data-toggle="modal">Create</a></li>
							<li class="divider"></li>
							
							<% for (Group group : alliedGroups) {%>
							<li><a  href="group.jsp?gid=<%=group.getGroup_id()%>"><%=group.getTitle()%></a></li>
							<%}%>
						</ul>
					</li>

					<% if (!user.getType().equals("student")) {%>
					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown">Add New</a>
						<ul class="dropdown-menu" style="padding-top: 5px;">
							<% if (user.getType().equals("admin")) {%>
							<li><a href="#addAdmin" role="button"  data-toggle="modal">Admin</a></li>
							<li><a href="#addFaculty" role="button"  data-toggle="modal">Faculty</a></li>
							<%}%>
							<li><a href="#addStudents" role="button"  data-toggle="modal">Student Batch</a></li>
							<% if (user.getType().equals("admin")) {%>
							<li class="divider"></li>
							<li><a href="#addDepartment" role="button"  data-toggle="modal">Department</a></li>
							<%}%>
						</ul>
					</li>
					<% }%>





					
					<% if (request.getParameter("gid")!=null) {%>
					<% objectClasses.Group nav_group = dao.GroupModule.getGroup(request.getParameter("gid")); %>
					<% if (nav_group != null) {%>
					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown">Actions</a>
						<ul class="dropdown-menu" style="padding-top: 5px;">
							<% if (!user.getType().equals("student")) {%>
							<li><a href="#uploadAttendance" role="button"  data-toggle="modal">Upload Attendance</a></li>
							<%}%>
							<li><a href="#MessageMembers" role="button"  data-toggle="modal">Message Members</a></li>
							<% if (nav_group.getOwner().equals(user.getId())) {%>
							<li><a href="groupSettings.jsp?gid=<%= nav_group.getGroup_id()%>" role="button"  data-toggle="modal">Settings</a></li>
							<%}%>
						</ul>
					</li>
					<% }%>
					<% }%>
				</ul>
			</div>
		</div>
	</div>			
</div>
<%
if (request.getParameter("gid")!=null) {%>
<%@include file="groupComponents/_groupForms.jsp" %>
<%}%>