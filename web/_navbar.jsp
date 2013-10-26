<%-- 
    Document   : navbar
    Created on : Oct 25, 2013, 12:06:50 PM
    Author     : SeiJee
--%>
<%@page import="objectClasses.Group"%>
<%@page import="java.util.List"%>
<%@page import="objectClasses.people.Person"%>
<%
	Person user = (Person)session.getAttribute("user");
	if (user==null) response.sendRedirect(".SignOut");
	List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(user);
%>
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a href="home.jsp" class="brand">Facebook</a>
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
					<li class="dropdown">
						<a href="" class="dropdown-toggle js-activated" data-toggle="user"><strong><%=user.getName() %></strong></a>
						<ul class="dropdown-menu" style="padding-top: 5px;">
							<li class="text-right"><a href="user.SignOut">Sign Out</a></li>
						</ul>
					</li>
					</ul>
					
					<ul class="nav">
						<li class="dropdown">
							<a href="" class="dropdown-toggle js-activated" data-toggle="Groups">Groups</a>
							<ul class="dropdown-menu" style="padding-top: 5px;"></a></li>
								<li><a href="">Create</a></li>
								<li class="divider"></li>
								<%
								for (Group g : alliedGroups){
								%>
								<li><a href="group.jsp?gid=<%=g.getGroup_id()%>"><%=g.getTitle()%></a></li>	
								<%}%>
							</ul>
						<% if (!user.getType().equals("student")){ %>
						<li class="dropdown">
							<a href="" class="dropdown-toggle js-activated" data-toggle="NewUser">New User</a>
							<ul class="dropdown-menu" style="padding-top: 5px;"></a></li>
								<li><a href="">Add New Admin</a></li>
								<li><a href="">Add New Faculty</a></li>
								<li><a href="">Add Student Batch</a></li>
							</ul>
						</li>
						<% }%>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="./js/jquery.js"></script>
    <script src="./js/bootstrap-transition.js"></script>
    <script src="./js/bootstrap-alert.js"></script>
    <script src="./js/bootstrap-modal.js"></script>
    <script src="./js/bootstrap-dropdown.js"></script>
    <script src="./js/bootstrap-scrollspy.js"></script>
    <script src="./js/bootstrap-tab.js"></script>
    <script src="./js/bootstrap-tooltip.js"></script>
    <script src="./js/bootstrap-popover.js"></script>
    <script src="./js/bootstrap-button.js"></script>
    <script src="./js/bootstrap-collapse.js"></script>
    <script src="./js/bootstrap-carousel.js"></script>
    <script src="./js/bootstrap-typeahead.js"></script>
    <script src="./js/drophover.js"></script>
	<script>
		$(document).ready(function() {
			$('.js-activated').dropdownHover().dropdown();
			$menu = $('.dropdown-menu');
			$menu.css('min-width', ($('body').width()*0.15)+'px');
		});
		$(window).resize(function() {
			$menu = $('.dropdown-menu');
			$menu.css('min-width', ($('body').width()*0.15)+'px');
		});
	</script>