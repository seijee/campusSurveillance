
<%@include file="keyComponents/_initSession.jsp" %>
<% objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));%>

<html>
    <head>
        <%@include file="keyComponents/_head.jsp" %>
    </head>
	<body>
		<jsp:include page="keyComponents/_navbar.jsp" flush="true" />

		<% if (mygroup == null || !mygroup.getOwner().equals(user.getId()) ) {%>
		<div class="container"><h4>Unauthorized access</h4></div>
		<% } else {%>
		<div class="container-fluid" >
			
			<div class="row-fluid">	
				<div class="span9 affix" style="margin-left: 0%; max-height: 80%; ">
					<ul class="nav nav-pills">
						<li class=""><a href="group.jsp?gid=<%=mygroup.getGroup_id() %>">Group Home</a></li>
						<li class="active"><a href="#">Edit </a></li>
						<li><a href="groupEditMembers.jsp?gid=<%=mygroup.getGroup_id() %>">Edit Members</a></li>
						<li><a href="<%=mygroup.getTitle() %>.Delete?gid=<%=mygroup.getGroup_id() %>&&submit=deleteGroup">Delete!!</a></li>
					</ul>
				</div>


				<!--div class="container-fluid span4 well" style="border: 1px solid red;"-->
				
				<!--/div-->
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
