
<%@page import="objectClasses.people.Student"%>
<%@page import="java.util.Set"%>
<%@page import="objectClasses.Group"%>
<%@page import="objectClasses.people.Person"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
<%
Person user = (Person)session.getAttribute("user");
if (user==null) {response.sendRedirect(".SignOut");}
else {
	List<Group> groups = dao.GroupModule.getAlliedGroups(user);
	List<Person> peo = dao.GroupModule.getPeople(); 
%>
<!-- currently lists all registered students and 
facilitates to add them into an existing group or create a new group with selected students -->
<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
	<title>jQuery UI Selectable - Serialize</title>
	<script src="./jq/jquery-1.9.1.js"></script>
</head>
<body width="100%">
	<div hidden="hidden" style="width:50px; height: 50px; background: red;" id="effect" >
	</div>

<form action=".AddMembers" method="POST">
	<select name="gid" onchange="takeTitle(this.value)">
	<%
	//	Set<Group> groups = dao.GroupModule.getThemAll();
	for (Group g : groups){
	%>
		<option value="<%= g.getGroup_id() %>"><%= g.getGroup_id() %></option>
		<%	}%>
		<option onfocus="takeTitle();" value="new">New Group</option>
	</select>
	<input type="text" name="group-title" id="groupTitle" hidden="hidden"/>
	<input type="submit" value="Add" /><br/>
<script>function takeTitle($gid) {
		if ($gid=="new"){
			$('#groupTitle').attr("hidden", false);
		}else{
			$('#groupTitle').attr("hidden", true);
		}
	}</script>

<%for (Group g : groups){
	List<Student> people = dao.GroupModule.getStudents(g); 
%>
	<select name="student_ids" multiple="multiple" size="20" style="min-width:20%;display:inline-block; float: left; ">	
		<% for (Person p : people){ %>
			<option value="<%= p.getId() %>" >
				<%= p.getName() %> [<%= p.getId() %>]
			</option>
		<% } %>
	</select>
<%}%>


</form>
<%}%>
</body>
</html>
