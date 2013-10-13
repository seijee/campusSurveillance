
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
	//List<Person> peo = dao.GroupModule.getPeople(); 
%>

<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
	<title>jQuery UI Selectable - Serialize</title>
	<link rel="stylesheet" href="./jq/themes/base/jquery.ui.all.css"/>
	<script src="./jq/jquery-1.9.1.js"></script>
	<script src="./jq/ui/jquery.ui.core.js"></script>
	<script src="./jq/ui/jquery.ui.widget.js"></script>
	<script src="./jq/ui/jquery.ui.mouse.js"></script>
	<script src="./jq/ui/jquery.ui.selectable.js"></script>
	<script src="./jq/ui/jquery.ui.effect.js"></script>
	<script src="./jq/ui/jquery.ui.effect-blind.js"></script>
	<script src="./jq/ui/jquery.ui.effect-bounce.js"></script>
	<script src="./jq/ui/jquery.ui.effect-clip.js"></script>
	<script src="./jq/ui/jquery.ui.effect-drop.js"></script>
	<script src="./jq/ui/jquery.ui.effect-explode.js"></script>
	<script src="./jq/ui/jquery.ui.effect-fold.js"></script>
	<script src="./jq/ui/jquery.ui.effect-highlight.js"></script>
	<script src="./jq/ui/jquery.ui.effect-pulsate.js"></script>
	<script src="./jq/ui/jquery.ui.effect-scale.js"></script>
	<script src="./jq/ui/jquery.ui.effect-shake.js"></script>
	<script src="./jq/ui/jquery.ui.effect-slide.js"></script>
	
	<link rel="stylesheet" href="./jq/demos/demos.css"/>

	<style>
	#addTable{
			max-height:  0px;
			margin: 0px;
			padding: 0px;
			overflow: hidden;
		}
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting div { background: #FECA40; }
	#selectable .ui-selected div { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; width: 80%; cursor: default;}
	#selectable li { margin: 0px; padding: 0em; font-size: 1.4em; height: 30px; float: left; width: 23%;  }
	#selectable div {height: 100%; width: 100%; padding: 2px; vertical-align: middle;}
	
	::selection{
		color:#000000;
	}
	::-moz-selection{
		color:#000000;
	}
	</style>
	
</head>
<body>
	<div hidden="hidden" style="width:50px; height: 50px; background: red;" id="effect" >
	</div>

	<form action=".AddMembers" method="POST">
		<select name="gid" onchange="takeTitle(this.value)">
			<%for (Group g : groups){%>
			<option value="<%= g.getGroup_id() %>"><%= g.getGroup_id() %></option>
			<%}%>
			<option onfocus="takeTitle();" value="new">New Group</option>
		</select>
		<input type="text" name="group-title" id="groupTitle" hidden="hidden"/>
		<input type="submit" value="Add" />
		<script>
			function takeTitle($gid) {
				if ($gid=="new"){
					$('#groupTitle').attr("hidden", false);
				}else{
					$('#groupTitle').attr("hidden", true);
				}
			}
		</script>
		<div style="position: fixed; height: 0px; margin: 0px;bottom: 0px; overflow: hidden">
			<table id="addTable">	
			</table>
		</div>
	</form>

<%	for (Group g: groups) {
		List<Student> people = dao.GroupModule.getStudents(g); 
		//peo.addAll(people);
%>		<ol class="selectable">
			<% for (Student p : people){ %>
			<li class="ui-state-default" id="<%= p.getId() %>"  >
				<div><span><%= p.getName() %> [<%= p.getId() %>]</span></div>
			</li>
			<% } %>
		</ol><br/>
<%	} %>
<script>
	var people = [];
		
	$(function() {
		$( ".selectable" ).each(this.selectable({
			stop: function() {
				var addArray = [];
				var result = $( "#select-result" ).empty();
				$( ".ui-selected span", this ).each(function() {
					var index = $( ".selectable li span" ).index(this);
					result.append( " #" + ( people[index] ) );
					addArray.push(people[index]);
				});
				$st = document.getElementById("addTable");
				$st.innerHTML="";
				for (var i=0;i<addArray.length; i++ ){
					$count = $st.rows.length;
					
					$row = $st.insertRow($count);
					$check = $row.insertCell(0);
					$st.innerHTML += "<td><input type='text' name='student_ids' value='"+addArray[i]+"' hidden=hidden /></td>";
				}
			}
		}));
		var selectedEffect = "drop";
		for (var i=0; i<people.length; i++){
			$("#"+people[i]).delay(i*20).show( selectedEffect,{direction:"down", distance:"100px" },500 );	
		}
	});
	
	

		

		//$( "#selectable li" ).hide();

	</script>
<p id="feedback"><span>You've selected:</span> <span id="select-result">none</span>.</p>
<%}	%>
</body>
</html>
