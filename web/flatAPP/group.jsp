
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html class=" js no-touch csstransitions">
<head>
	<%@include file="_components/head.jsp" %>
	<% objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));%>
	<% List<Person> members = dao.GroupModule.getMembers(mygroup); %>
</head>
<body>
	<%@include file="_components/navbar.jsp" %>
	<% Map<String,Float> att = dao.PunctualityModule.getSubjectWiseAttendance(user, mygroup); %>
	
	<!--[if !IE]><!-->
	<% if (mygroup == null || !members.contains(user)) {%>
	<div id="pre-page-content">
		<h1>
			<i class="gi gi-group themed-color-cherry"></i>
			<span  class="text-danger">Error Occured!</span><br/>
			<small>Either the group has been deleted, Your you might not have permission to access its content</small>
		</h1>
	</div>
	<div id="page-content">
		<ul class="breadcrumb breadcrumb-top">
		<li><a href="home.jsp"><i class="gi gi-home"></i></a></li>
		<li><a href="groups.jsp">Groups</a></li>
		<li><a href="">Error</a></li>
		</ul>
	</div>
	<%}else{%>
	<div id="pre-page-content">
		<h1><i class="gi gi-group themed-color"></i><%= mygroup.getTitle() %>
			-<small><%= mygroup.getOwner() %></small>
		</h1>
			<p><%= mygroup.getDescription() %></p>
	</div>
	<div id="page-content">
		<ul class="breadcrumb breadcrumb-top">
		<li><a href="home.jsp"><i class="gi gi-home"></i></a></li>
		<li><a href="groups.jsp">Groups</a></li>
		<li><a href="groups.jsp#<%= mygroup.getType() %>"><%= mygroup.getType() %></a></li>
		<li><a href=""><%= mygroup.getTitle() %></a></li>
		</ul>
		<div class="block block-tiles block-tiles-animated clearfix">
			<% if (!user.getType().equals("student") && mygroup.getType().equalsIgnoreCase("Primary")) {%> 
			<a href="#uploadAttendance" role="button"  data-toggle="modal" class="tile tile-themed themed-background-dawn">
			<i class="fa fa-upload"></i>
			<div class="tile-info">Upload Attendance</div>
			</a>
			<% } %>
			<a href="#MessageMembers" role="button"  data-toggle="modal" class="tile tile-themed themed-background-ocean">
			<i class="gi gi-notes_2"></i>
			<div class="tile-info">Publish Circular</div>
			</a>
		</div>
<div class="block-tabs block-themed block-last">
	<ul class="nav nav-tabs" data-toggle="tabs">
		<li class="active"><a href="#members">Members</a></li>
	<% if (mygroup.getOwner().equals(user.getId())) {%>
		<li class=""><a href="#settings"><i class="fa fa-cog"></i> Settings</a></li>
	<% } %>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="members">
			<% for (Person member : members){ %>
				<div class="col-md-4" style="height: 100px;">
				<div class="media media-hover">
				<a href="" class="pull-left">
				<img src="img/template/image_64x64_dark.png" class="media-object img-circle" alt="Image">
				</a>
				<div class="media-body">
				<h4 class="media-heading"><%= member.getName()%> <small>[<%= member.getId() %>]</small></h4>
				<a href="" class="badge badge-success" data-toggle="tooltip" title="" data-original-title="Profile">
				<i class="fa fa-user"></i>
				</a>
				<a href="" class="badge badge-info"><%= member.getType() %></a>

				</div>
				</div>
				</div>
			<% } %>
			<div class="row row-items"><br/>
				<div class="media media-hover">
				</div>
			</div>
		</div>
			
			
		<% if (mygroup.getOwner().equals(user.getId())) {%>
		<div class="tab-pane" id="settings">
			<script src="js_files/editMembers.js" ></script>
			<style>
				.notRemoving{
					
				}
				.removing {
					text-decoration: line-through;
				}
			</style>
			<form action="<%=mygroup.getTitle()%>.AddMembers" method="POST">
				<input value="<%= mygroup.getGroup_id()%>" name="gid" hidden="hidden"/>
				<p class="text-danger">*only visible to Group Owner</p>
				<a href="<%=mygroup.getTitle() %>.Delete?gid=<%=mygroup.getGroup_id() %>&&submit=deleteGroup">Delete!!</a>
				<button type="submit" name="submit"  value="addMembers" id="submit" class="btn btn-success" >Save</button>
				<div class="row">
					<!-- new  Member List  -->
					<div class="col-xs-6">
						<div class="block-title" >Current Members</div>
						<div class="block-content">
							<ul id="memberList" class="fa-ul list">
							<% for (Person member : members){ %>
							<li id="m<%= member.getId() %>" onclick="toggleMembership('<%= member.getName()%>', '<%= member.getId() %>')" class="notRemoving">
								<%= member.getName()%> <small>[<%= member.getId() %>]</small>
							<% } %>
							</ul>
						</div>
					</div>
					<!-- /memberlist -->
					<div class="col-xs-6">
						<div class="block-title" >Other Members</div>
						<% List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(user); %>
						<div id="accordion" class="panel-group">
						<% for (Group group : alliedGroups) { %>
						<div class="panel panel-default">
							<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#G<%= group.getGroup_id() %>"><%= group.getTitle() %></a>
							</h4>
							</div>
							<div id="G<%= group.getGroup_id() %>" class="panel-collapse collapse" style="height: 0px;">
							<div class="panel-body">
							<%   List<Person> m = dao.GroupModule.getMembers(group); %>
							<% for (Person member : m) { %>
								<div onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a></div>
							<% } %>
							</div>
							</div>
						</div>
						<% } %>
						</div>
					</div>
				</div>
			</form>
		</div>
		<% } %>
	</div>

</div>
	
<% }%>
	
	<%@include file="_components/footer.jsp" %>
	<%@include file="_components/modals.jsp" %>
	<%@include file="_components/modalsForGroup.jsp" %>
	<%@include file="_components/javascripts.jsp" %>
</body>
</html>