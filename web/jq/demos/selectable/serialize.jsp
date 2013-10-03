<%@page import="objectClasses.Person"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
	<title>jQuery UI Selectable - Serialize</title>
	<link rel="stylesheet" href="./themes/base/jquery.ui.all.css"/>
	<script src="./jquery-1.9.1.js"></script>
	<script src="./ui/jquery.ui.core.js"></script>
	<script src="./ui/jquery.ui.widget.js"></script>
	<script src="./ui/jquery.ui.mouse.js"></script>
	<script src="./ui/jquery.ui.selectable.js"></script>
	<link rel="stylesheet" href="./demos/demos.css"/>

	<style>
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
	#selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
	</style>
	<script>
	$(function() {
		$( "#selectable" ).selectable({
			stop: function() {
				var result = $( "#select-result" ).empty();
				$( ".ui-selected", this ).each(function() {
					var index = $( "#selectable li" ).index( this );
					result.append( " #" + ( index + 1 ) );
				});
			}
		});
	});
	</script>
</head>
<body>

<p id="feedback">
<span>You've selected:</span> <span id="select-result">none</span>.
</p>
<% 
List<Person> people = controllers.Person_DRL.getPeople();
%>
<ol id="selectable">
	<% for (Person p : people){ %>
	<li class="ui-state-default"><%= p.getName() %> [<%= p.getId() %>]</li>
	<% } %>
</ol>

<div class="demo-description">
<p>Write a function that fires on the <code>stop</code> event to collect the index values of selected items.  Present values as feedback, or pass as a data string.</p>
</div>
</body>
</html>
