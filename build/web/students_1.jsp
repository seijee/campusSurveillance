
<%@page import="java.util.Set"%>
<%@page import="objectClasses.Group"%>
<%@page import="objectClasses.people.Person"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
<%
Person user = (Person)session.getAttribute("user");
if (user==null) response.sendRedirect(".SignOut");
List<Person> people = dao.GroupModule.getPeople();
%>
<!-- currently lists all registered students and 
facilitates to add them into an existing group or create a new group with selected students -->
<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
	<title>jQuery UI Selectable - Serialize</title>


	
</head>
<body>
	<div hidden="hidden" style="width:50px; height: 50px; background: red;" id="effect" >
	</div>

<form action=".AddMembers" method="POST">
	<select name="gid" onchange="takeTitle(this.value)">
<%
	Set<Group> groups = dao.GroupModule.getThemAll();
	for (Group g : groups){
%>
		<option value="<%= g.getGroup_id() %>"><%= g.getGroup_id() %></option>
<%	}	%>
<option onfocus="takeTitle();" value="new">New Group</option>
						</select>
<input type="text" name="group-title" id="groupTitle" hidden="hidden"/>
<input type="submit" value="Add" /><br/>
<script>
	function takeTitle($gid) {
		if ($gid=="new"){
			$('#groupTitle').attr("hidden", false);
		}else{
			$('#groupTitle').attr("hidden", true);
		}
	}
</script>
						
<select name="student_ids" multiple="multiple" size="40">	
	<% for (Person p : people){ %>
		<option value="<%= p.getId() %>"><%= p.getName() %> [<%= p.getId() %>]</option>
	<% } %>
</select>



</form>
</body>
</html>
