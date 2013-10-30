
<%@include file="keyComponents/_initSession.jsp" %>
<% objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));%>
<html>
    <head>
        <%@include file="keyComponents/_head.jsp" %>
    </head>
	<body>
		<%@include file="keyComponents/_navbar.jsp"%>

		<% if (mygroup == null) {%>
		<h4>No Group selected</h4>
		<% } else {%>
		
		
		<div class="container-fluid">
			<ul class="nav nav-pills span9">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="editGroup.jsp?gid=<%=mygroup.getGroup_id() %>">Edit</a></li>
					<li><a href="#">...</a></li>
			</ul>
			<div class="row-fluid">
				
					
				<div class="span9 well" style="border: 1px solid red; ">
					<div class="header"><h2><%= mygroup.getTitle()%> <span class="label"><h4><%= mygroup.getType()%></h4></span></h2></div>
					<h3>-<%= mygroup.getOwner() %></h3>
					<a href="editGroup.jsp?gid=<%= mygroup.getGroup_id() %>">Edit!</a>
				</div>
				
				
				<!-- List of members -->
				<div class="span3 well">
					<% List<Person> members = dao.GroupModule.getMembers(mygroup); %>
					<% for (Person member : members){ %>
						<div class="offset1" onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a></div>
					<%}%>
				</div>
			</div>
		</div>
		<% }%>
		
		
		<script>
			function addToList($name, $id ){
				$html = document.getElementById("memberList");
				$string = '<h6 class="span3">'+$name+'</h6><input value="'+$id+'" name="member_ids" hidden="hidden"/>';
				if ( $html.innerHTML.indexOf($id) < 0){
					$html.innerHTML = $string + $html.innerHTML;
				}
			}
		</script>

		<%@include file="keyComponents/_forms.jsp" %>
		<%@include file="keyComponents/_footer.jsp" %>
	</body>
</html>
