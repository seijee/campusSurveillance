
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a href="home.jsp" class="brand">E-Campus</a>
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown"><strong><%=user.getName() %></strong></a>
						<ul class="dropdown-menu" style="padding-top: 5px;">
							<li class="text-right"><a href="user.SignOut">Sign Out</a></li>
						</ul>
					</li>
					</ul>
					
					<ul class="nav">
						<li class="dropdown">
							<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown">Groups</a>
							<ul class="dropdown-menu" style="padding-top: 5px;"></a></li>
								<li><a href="">Create</a></li>
								<li class="divider"></li>
								<%
								for (Group group : alliedGroups){
								%>
								<li><a href="group.jsp?gid=<%=group.getGroup_id()%>"><%=group.getTitle()%></a></li>	
								<%}%>
							</ul>
						</li>
						<% if (!user.getType().equals("student")){ %>
						<li class="dropdown">
							<a href="" class="dropdown-toggle js-activated" data-toggle="dropdown">Add New</a>
							<ul class="dropdown-menu" style="padding-top: 5px;">
								<% if (user.getType().equals("admin")) { %>
								<li><a href="#addAdmin" role="button"  data-toggle="modal">Admin</a></li>
								<li><a href="#addFaculty" role="button"  data-toggle="modal">Faculty</a></li>
								<%}%>
								<li><a href="#addStudents" role="button"  data-toggle="modal">Student Batch</a></li>
								<% if (user.getType().equals("admin")) { %>
								<li class="divider"></li>
								<li><a href="#addDepartment" role="button"  data-toggle="modal">Department</a></li>
								<%}%>
							</ul>
						</li>
						<% }%>
					</ul>
				</div>
			</div>
		</div>
	</div>
