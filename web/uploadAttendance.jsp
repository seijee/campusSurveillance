
<%@include file="keyComponents/_initSession.jsp" %>

<%@page import="objectClasses.AttendanceReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="keyComponents/_head.jsp" %>
		<style>
			input {
				width: auto;
			}
			td, th {
				text-align: center;
			}
		</style>
        <title>Upload Attendance</title>
    </head>
    <body>
		<% List<AttendanceReport> reports = (List<AttendanceReport>) request.getAttribute("newAttendanceReports");%>
		<% objectClasses.Group mygroup = dao.GroupModule.getGroup( (String)request.getAttribute("gid"));%>
		<% List<Person> members = dao.GroupModule.getMembers(mygroup); %>
		<jsp:include page="keyComponents/_navbar.jsp" flush="true" />
		<%if (reports != null) {%>
		
		<div class="container">
			<h1><%= mygroup.getTitle() %></h1>
			<form name="Attendance" action="Attendance.New" method="POST" class="form-horizontal">
			<div class="form-group">
				<label for="from_date" class="control-label col-sm-1">From</label>
				<div class="recentdatepicker col-sm-2"><input id="from_date" name="from_date" type="text" placeholder="select a date" class="form-control" required="required" /></div>
				<label for="to_date" class="control-label col-sm-1">To</label>
				<div class="recentdatepicker col-sm-2"><input id="to_date" name="to_date" type="text" placeholder="select a date" class="form-control inline" required="required" /></div>
			</div>
				<div class="form-group">
					<label for="maxTheory" class="control-label col-sm-4" >Max Theory</label>
					<div class="col-sm-2"><input id="maxTheory" name="maxTheory" type="text" placeholder="Total Theory Lectures" class="form-control" required="required" /></div>
				</div>
				<div class="form-group">
					<label for="maxLabs" class="control-label col-sm-4" >Max Labs</label>
					<div class="col-sm-2"><input id="maxLabs" name="maxLabs" type="text" placeholder="Total Labs" class="form-control" required="required" /></div>
				</div>
			
			<div class="table-responsive center-block col-sm-8">
				<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>Student Id</th>
						<th>Student Name</th>
						<th >Theory</th>
						<th>Labs</th>
					</tr>
				</thead>
				<tbody>
					<% for (AttendanceReport ar : reports) {%>
					<% Person s = dao.ConPerson.getPerson(ar.getStudent()); %>
					<% if (members.contains(s)) {%>
					<tr>
						<td ><div class=""><input type="text" class="form-control input-sm" name="person_id" value="<%= ar.getStudent()%>" size="15" readonly="readonly" /></div></td>
						<td ><div class=""><%= s.getName() %></div></td>
						<td><div class="col-sm-offset-3 col-sm-6"><input type="number" class="form-control input-sm" name="theoryAttendance" value="<%= ar.getThAttended()%>" size="3" /></div></td>
						<td><div class="col-sm-offset-3 col-sm-6"><input type="number" class="form-control input-sm" name="practicalAttendance" value="<%= ar.getLbsAttended()%>" size="3" /></div></td>
					</tr>
					<% members.remove(s); %>
					<%}%>
					<%}%>
				</tbody>
			</table>
			</div>
			<input type="submit" class="btn btn-lg btn-primary btn-block" value="addAttendance" name="submit" />
		</form>
		</div>
		<% }%>
		<%@include file="keyComponents/_forms.jsp" %>
		<%@include file="keyComponents/_footer.jsp" %>
    </body>
</html>
