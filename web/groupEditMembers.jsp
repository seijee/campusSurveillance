
<%@include file="keyComponents/_initSession.jsp" %>
<% objectClasses.Group mygroup = dao.GroupModule.getGroup(request.getParameter("gid"));%>
<% if (mygroup!=null){%>
<% session.setAttribute("mygroup", mygroup);  %>
<% session.setAttribute("selection", "group");  %>
<%}%>
<html>
    <head>
        <%@include file="keyComponents/_head.jsp" %>
    </head>
	<body>
		<jsp:include page="keyComponents/_navbar.jsp" flush="true" />

		<% if (mygroup == null) {%>
		<h4>No Group selected</h4>
		<% } else {%>
		<div class="container-fluid" >
			
			<div class="row-fluid">	
				<div class="span9 affix" style="margin-left: 0%; max-height: 80%; ">
					<div class="span11 well" style="border: 1px solid red; max-height: 80%; overflow-y:scroll; ">
					<div class="header"><h2><%= mygroup.getTitle()%>  <span class="badge"><%= mygroup.getType()%></span></h2></div>
					<% List<objectClasses.people.Person> gl = dao.GroupModule.getMembers(mygroup);%>
					<form action="<%=mygroup.getTitle()%>.AddMembers" id="memberList" method="POST">
						<input value="<%= mygroup.getGroup_id()%>" name="gid" hidden="hidden"/>
						<input type="submit" name="submit"  value="addMembers" id="submit" hidden="hidden" />
						<div class="span12">
							<% for (objectClasses.people.Person p : gl) {%>	
							<h6 class="span2"><%= p.getName()%></h6><input value="<%= p.getId()%>" name="member_ids" hidden="hidden"/>
							<% }%>
						</div>
					</form>
					<button type="submit" name="dfgfd" onclick="document.getElementById('submit').click()" class="btn btn-primary pull-right">Save</button>
					</div>
				</div>


				<!--div class="container-fluid span4 well" style="border: 1px solid red;"-->
				<div class="accordion well span3 pull-right" id="accordion2">
					<% List<Group> groups = dao.GroupModule.getAllGroups();%>
					<%for (Group group : groups) {%>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#<%= group.getGroup_id()%>">
								<%= group.getTitle()%> <span class="label"><%= group.getType()%></span>
							</a>
						</div>
						<% List<Person> members = dao.GroupModule.getMembers(group);%>
						<div id="<%= group.getGroup_id()%>" class="accordion-body collapse">
							<div class="accordion-inner">
								<% for (Person member : members) {%>
								<div class="offset1" onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a></div>
								<%}%>
							</div>
						</div>
					</div>
					<%}%>




					<% if (!user.getType().equalsIgnoreCase("student")) {%>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#allfaculties">
								Faculties <span class="badge badge-green">All</span>
							</a>
						</div>
						<% List<Person> members = dao.ConPerson.getAllFaculties();%>
						<div id="allfaculties" class="accordion-body collapse">
							<div class="accordion-inner">

								<h6>Default</h6>
								<%List<Person> facl = dao.DepartmentModule.getDepFaculties("DD");%>
								<% for (Person member : facl) {%>
								<div class="offset1" onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a> </div>
								<%}%>

								<% List<Department> depl = dao.DepartmentModule.getAllDepartments();%>
								<% for (Department d : depl) {%>

								<h6><%= d.getTitle()%></h6>
								<%facl = dao.DepartmentModule.getDepFaculties(d.getDepCode());%>
								<% for (Person member : facl) {%>
								<div class="offset1" onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a> </div>
								<%}%>
								<%}%>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#allstudents">
								Students <span class="label label-green">All</span>
							</a>
						</div>
						<% members = dao.GroupModule.getAllStudents();%>
						<div id="allstudents" class="accordion-body collapse">
							<div class="accordion-inner">
								<% for (Person member : members) {%>
								<div class="offset1" onclick="addToList('<%= member.getName()%>','<%= member.getId()%>')"><a><%= member.getName()%></a> </div>
								<%}%>
							</div>
						</div>
					</div>

					<%}%>
				</div>
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
	<% session.removeAttribute("mygroup"); %>
	<% session.setAttribute("selection", "group"); %>
</html>
