
<%@include file="_initSession.jsp" %>
<%
	objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));
%>
<html>
    <head>
        <%@include file="_head.jsp" %>
    </head>
	<body>
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid">
<% if (mygroup==null){ %>
		<h4>No Group selected</h4>
<%}else{%>
		<h4><%=mygroup.getTitle()%> <small>(<%=mygroup.getType()%>)</small></h4>
		<%
			List<objectClasses.people.Person> gl = dao.GroupModule.getMembers(mygroup);
			for (objectClasses.people.Person p : gl  ){
		%>	
		<div class="span2 pull-left text-center">
			<h6><%=p.getName()%></h6>
		</div>
		<%}%>
<%}%>
		</div>
<%@include file="_forms.jsp" %>
<%@include file="_footer.jsp" %>
	</body>
</html>
