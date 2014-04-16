<%@page import="java.util.Map"%>
<%@include file="_initSession.jsp" %>	
<header class="navbar navbar-inverse">
		<div class="row">
			<div class="col-sm-4 hidden-xs">
				<ul class="navbar-nav-custom pull-left">
				<li class="visible-md visible-lg">
				<a id="toggle-side-content">
				<i class="fa fa-bars"></i>
				</a>
				</li>
				<li class="divider-vertical"></li>
				</ul>
			</div>
			<div class="col-sm-4 col-xs-12 text-center">
				<form id="top-search" class="pull-left" action="search_results.jsp" method="post">
				<input type="text" id="search-term" class="form-control" name="search-term" placeholder="Search.." />
				</form>
				<a href="home.jsp" class="navbar-brand">
				<img style="max-height: 80%; margin-top: 5px;" src="./js_files/logo.png" alt="logo"/>
				</a>
				<div id="loading" class="display-none"><i class="fa fa-spinner fa-spin"></i></div>
			</div>
			<div id="header-nav-section" class="col-sm-4 col-xs-12 clearfix">
				<ul class="navbar-nav-custom pull-right">
					<li class="dropdown dropdown-theme-options">
						<a href="" class="dropdown-toggle" data-toggle="dropdown">UI Options</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li class="theme-extra visible-md visible-lg">
							<label for="theme-sidebar-sticky">
							<div class="icheckbox_square-grey" style="position: relative;"><input type="checkbox" id="theme-sidebar-sticky" name="theme-sidebar-sticky" class="input-themed" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255); border: 0px; opacity: 0; background-position: initial initial; background-repeat: initial initial;"></ins></div>
							Sticky Sidebar
							</label>
							</li>
							<li class="divider visible-md visible-lg"></li>
							<li class="theme-extra">
							<label for="theme-header-top">
							<div class="icheckbox_square-grey" style="position: relative;"><input type="checkbox" id="theme-header-top" name="theme-header-top" class="input-themed" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255); border: 0px; opacity: 0; background-position: initial initial; background-repeat: initial initial;"></ins></div>
							Top fixed header
							</label>
							<label for="theme-header-bottom">
							<div class="icheckbox_square-grey" style="position: relative;"><input type="checkbox" id="theme-header-bottom" name="theme-header-bottom" class="input-themed" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255); border: 0px; opacity: 0; background-position: initial initial; background-repeat: initial initial;"></ins></div>
							Bottom fixed header
							</label>
							</li>
							<li class="divider"></li>
							
						</ul>
					</li>
					<li class="divider-vertical"></li>
					<li class="dropdown dropdown-notifications">
						<a href="" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-exclamation-triangle"></i>
						<span class="badge badge-neutral">1</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
						<li>
						<div class="alert alert-danger">
						<i class="fa fa-bolt"></i> <strong>Notifications</strong> Will be implemented in next version!
						</div>
						</li>
						<li class="divider"></li>
						<li>
						<a href=""><i class="fa fa-exclamation-triangle pull-right"></i>Notification Center</a>
						</li>
						</ul>
					</li>
					<li class="dropdown dropdown-messages">
						<a href="" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-envelope-o"></i>
						<span class="badge badge-neutral">1</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
						<li>
						<div class="media">
						<a class="pull-left" href="" data-toggle="tooltip" title="" data-original-title="Newbie">
						<img src="./js_files/image_64x64_dark.png" alt="fakeimg" class="img-circle">
						</a>
						<div class="media-body">
						<div class="media-heading clearfix"><span class="label label-success">a while ago</span><a href="">Web Master</a></div>
						<div class="media">Will be implemented soon...</div>
						</div>
						</div>
						</li>
						<li class="divider"></li>
						<li>
						<a href="http://pixelcave.com/demo/flatapp/page_comp_inbox.php"><i class="fa fa-envelope-o pull-right"></i>Message Center</a>
						</li>
						</ul>
					</li>
				</ul>
				<ul class="navbar-nav-custom pull-left visible-xs visible-sm" id="mobile-nav">
					<li>
					<a  data-toggle="collapse" data-target=".navbar-main-collapse">
					<i class="fa fa-bars"></i>
					</a>
					</li>
					<li class="divider-vertical"></li>
				</ul>
			</div>
		</div>
</header>
	<aside id="page-sidebar" class="collapse navbar-collapse navbar-main-collapse sticky">
	<div class="side-scrollable">
		<div class="mini-profile">
			<div class="mini-profile-options">
				<a href="" class="badge badge-info loading-on" data-toggle="tooltip" data-placement="right" title="" data-original-title="Refresh">
				<i class="fa fa-refresh"></i>
				</a>
				<span data-toggle="tooltip" data-placement="right" title="" data-original-title="Create Group" >
					<a  href="#createGroup" role="button"  data-toggle="modal" class="badge badge-warning" >
					<i class="gi gi-plus"></i>
					</a>
				</span>
				<a href="#modal-user-account" class="badge badge-success enable-tooltip" role="button" data-toggle="modal" data-placement="right" title="" data-original-title="Settings">
				<i class="gi gi-cogwheel"></i>
				</a>
				<a href="user.SignOut" class="badge badge-danger" data-toggle="tooltip" data-placement="right" title="" data-original-title="Sign Out">
				<i class="fa fa-sign-out"></i>
				</a>
			</div>
			<a href="user_profile.php">
				<img src="./js_files/avatar2.jpg" alt="Avatar" class="img-circle">
			</a>
		</div>
		
		
		
		
		
		
		<div class="sidebar-tabs-con">
			<ul class="sidebar-tabs" data-toggle="tabs">
				<li class="active">
				<a href="#side-tab-menu"><i class="gi gi-list"></i></a>
				</li>
				<li>
				<a href="#side-tab-extra"><i class="gi gi-charts"></i></a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="side-tab-menu">
					<nav id="primary-nav">
					<ul>
						<li><a href="home.jsp"><i class="gi gi-display"></i>Dashboard</a></li>
						<li><a href="" class="menu-link"><i class="gi gi-group"></i>Groups</a>
						<ul>
							<li><a href="groups.jsp?#Primary">Primary<span>(for Attendance)</span></a></li>
							<li><a href="groups.jsp?#General">General<span></span></a></li>
							<li><a  href="#createGroup" role="button"  data-toggle="modal">Create Group<span><i class="gi gi-plus"></i></span></a></li>
						</ul>
						</li>
						<% if (!user.getType().equals("student")) {%>
						<li><a href="" class="menu-link"><i class="fa fa-plus"></i>Add New...</a>
						<ul>
							<% if (user.getType().equals("admin")) {%>
							<li><a href="#addAdmin" role="button"  data-toggle="modal"><i class="gi gi-user_add"></i>Admin</a></li>
							<li><a href="#addFaculty" role="button"  data-toggle="modal"><i class="gi gi-user_add"></i>Faculty</a></li>
							<li><a href="#addDepartment" role="button"  data-toggle="modal">Department</a></li>
							<%}%>
							<li><a href="#addStudents" role="button"  data-toggle="modal"><i class="fa fa-users"></i>Student Batch</a></li>
						</ul>
						</li>
						<% } %>
						<li><a href="user.SignOut"><i class="fa fa-power-off"></i>Sign Out</a></li>
					</ul>
					</nav>
				</div>
						
				<div class="tab-pane tab-pane-side" id="side-tab-extra">
				<% List<Group> pgroups =  dao.GroupModule.getGroups(user.getId(), "Primary"); %>
				<% for (Group g: pgroups){ %>
					<h5><i class="fa fa-bug pull-right"></i><a href="group.jsp?gid=<%=g.getGroup_id()%>" class="side-link"><%=g.getTitle()%></a></h5>
					<% Map<String,Float> map = dao.PunctualityModule.getSubjectWiseAttendance(user, g); %>
					<% for (String subject : map.keySet()){ %>
					<div><%=map.get(subject) %>% <%=subject%></div>
					<% } %>
				<% } %>
			</div>
		</div>
	</div>
	</aside>