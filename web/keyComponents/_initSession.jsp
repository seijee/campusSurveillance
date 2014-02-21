<%@page import="objectClasses.Group"%>
<%@page import="java.util.List"%>
<%@page import="objectClasses.people.Person"%>
<%
	Person user = (Person)session.getAttribute("user");
	if (user==null){
		response.sendRedirect(".SignOut");
		return;
	}
	List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(user);
%>
