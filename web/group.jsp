
<%@include file="keyComponents/_initSession.jsp" %>
<%@page autoFlush="true" %>
<% objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));%>
<% List<Person> members = dao.GroupModule.getMembers(mygroup); %>
<html>
    <head>
        <%@include file="keyComponents/_head.jsp" %>
    </head>
	<body>
		<jsp:include page="keyComponents/_navbar.jsp" flush="true" />
		<% if (mygroup == null || !members.contains(user)) {%>
		<h4>No Group selected</h4>
		
		<%}else{%>
		<div class="container">
				<div class="col-md-9 well" style="border: 1px solid red; ">
					<div class="header"><h2><%= mygroup.getTitle()%> <span class="label"><h4><%= mygroup.getType()%></h4></span></h2></div>
					<h3>-<%= mygroup.getOwner() %></h3>
				</div>
				<!-- List of members -->
				<div class="col-md-3 well">
					
					<% for (Person member : members){ %>
						<div class="" ><a onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')" ><%= member.getName()%></a></div>
					<%}%>
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
