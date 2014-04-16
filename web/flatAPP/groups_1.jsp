<!DOCTYPE html>
<html class=" js no-touch csstransitions">
<head>
	<%@include file="_components/head.jsp" %>
</head>
<body>
	<%@include file="_components/navbar.jsp" %>
	<!--[if !IE]><!-->
	<div id="pre-page-content">
		<h1><i class="gi gi-group themed-color"></i>My Groups<br></h1>
		<i class="gi gi-plus"></i>Create your own Group!
		
	</div>
	<div id="page-content" >
		<ul class="breadcrumb breadcrumb-top">
			<li><a href="home.jsp"><i class="gi gi-home"></i></a></li>
			<li><a href="groups.jsp">Groups</a></li>
		</ul>
		<div class="block block-tiles block-tiles-animated clearfix">
		<% List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(user); %>
		<% for (Group group : alliedGroups) {%>
			<a href="group.jsp?gid=<%=group.getGroup_id()%>" class="tile tile-themed">
			<i class="fa fa-users"></i>
			<div class="tile-info"><%=group.getTitle()%></div>
			</a>
			
		<%}%>
		</div>
	</div>
	<%@include file="_components/footer.jsp" %>
	
	<%@include file="_components/modals.jsp" %>
	<%@include file="_components/javascripts.jsp" %>
</body>
</html>