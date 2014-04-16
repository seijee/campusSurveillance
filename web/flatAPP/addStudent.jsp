
<%@page import="java.util.Locale"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="objectClasses.people.Student"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class=" js no-touch csstransitions">
<head>
	<%@include file="_components/head.jsp" %>
			<script>
			function addField(){
				$st = document.getElementById("studentTable");
				var start = parseInt(document.getElementById("start").value);
				var last = parseInt(document.getElementById("total").value)+start;
				$clgid = document.getElementById("collegeId").value;
				$branch = document.getElementById("branch").value;
				$prefix = document.getElementById("prefix").value;
				for ($i=start; $i<=last; $i++){
					$count = $st.rows.length;
					$row = $st.insertRow($count);
					
					if ($i<10){$enrol = "00"+$i;}
					else if ($i<100){$enrol = "0"+$i;}
					else if ($i<1000){$enrol = ""+$i;}
					$enrol = $clgid+$branch+$prefix+$enrol;
					$x=0;
					$check = $row.insertCell($x++);
					$check.innerHTML = "<input type='checkbox' value='OFF' />";
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="student_ids" value="'+$enrol+'" size="25" readonly="readonly" /></td>'
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="fnames" size="30" placeholder="First Name"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="lnames" size="30" placeholder="Last Name"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="mobile" size="10" placeholder="Mobile Number"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="email" value="" size="60" placeholder="email"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="father" value="dad" size="40" placeholder="father"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="mother" value="mom" size="40" placeholder="mother"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="category" value="general" size="40" placeholder="category"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="batch" value="2014" size="40" placeholder="batch"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="semester" value="6" size="40" placeholder="semester"/></td>';
					$cell = $row.insertCell($x++);
					$cell.innerHTML = '<td><input type="text" name="branch" value="CS" size="40" placeholder="branch"/></td>';
				}
			}
			
			function deleteRows(){
				$st = document.getElementById("studentTable");
				try {
					var table = document.getElementById("studentTable");
					var rowCount = table.rows.length;
 
					for(var i=1; i<rowCount; i++) {
						var row = table.rows[i];
						var chkbox = row.cells[0].childNodes[0];
						if(null != chkbox && true == chkbox.checked) {
                    
							table.deleteRow(i);
							rowCount--;
							i--;
						}
 
 
					}
				}catch(e) {
					alert(e);
				}
				
			}
		</script>
</head>
<body>
	<%@include file="_components/navbar.jsp" %>
	<!--[if !IE]><!-->
	<div id="pre-page-content">
		<h1><i class="gi gi-brush themed-color"></i>Blank<br><small>Create your content!</small></h1>
		
	</div>
	<div id="page-content" style="min-height: 483px;">
		<ul class="breadcrumb breadcrumb-top">
		<li><a href="home.jsp"><i class="gi gi-home"></i></a></li>
		<li><a href="master.jsp">Master</a></li>
		</ul>
		<% List<Student> s = (List<Student>) request.getAttribute("newStudents");%>
		<%if (s != null) {%>
		<% String groupTitle = (String) request.getAttribute("groupName"); %>
		<div class="block block-tiles block-tiles-animated clearfix">
			<form action="StudentBatch.New" method="POST">
				<table>
				<tr>
					<td>Group Title</td>
					<td><input type="text" name="group-title" value="<%=groupTitle%>" size="30" /></td>
				</tr>
				<tr>
					<td>Purpose</td>
					<td>
						<select name="type">
							<option value="Primary">Primary (Attendance)</option>
							<option value="General">General</option>
						</select>
					</td>
				</tr>
				</table>
				<input type="submit" value="addStudents" name="submit" />
				<div class="col-sm-12 table-responsive" style="overflow-y: scroll">
				<table class="table table-stripped " id="studentTable" border="0">
					<%
						Collections.sort(s, Student.c);
						for (Student st : s) {%>
					<tr>
						<td><input type="text" name="id" value="<%= st.getId()%>" readonly="readonly"  /></td>
						<td><input type="text" name="name"			value="<%= st.getName()%>"		size="35" placeholder="Name"/></td>
						<td><input type="text" name="father_name"		value="<%= (st.getFather_name() != null) ? st.getFather_name() : ""%>"	size="35"  placeholder="father"/></td>
						<td><input type="text" name="mother_name"		value="<%= (st.getMother_name() != null) ? st.getMother_name() : ""%>"	size="35"  placeholder="mother"/></td>
						<td><input type="text" name="gender"		value="<%= (st.getGender() != null) ? st.getGender() : ""%>"		size="35"	placeholder="Gender"/></td>
						<td><input type="text" name="dob"			
								   value="<%= st.getDOB().get(Calendar.YEAR)%>-<%= st.getDOB().getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.ENGLISH)%>-<%= st.getDOB().get(Calendar.DAY_OF_MONTH)%>"size="10" placeholder="DOB"/></td>
						<td><input type="text" name="bloodgroup"		value="<%= (st.getBloodgroup() != null) ? st.getBloodgroup() : "NA"%>"	size="35" placeholder="branch"/></td>
						<td><input type="text" name="email"		value="<%= (st.getEmail() != null) ? st.getEmail() : ""%>"	size="35" placeholder="email"/></td>
						<td><input type="text" name="mobile"		value="<%= (st.getMobile()) != null ? st.getMobile() : ""%>"		size="35"	 placeholder="Mobile Number"/></td>
						<td><textarea name="p_address" cols="22" rows="1"	placeholder="Address"><%= (st.getP_address() != null) ? st.getP_address() : ""%></textarea></td>
						<td><textarea name="r_address" cols="22" rows="1"	placeholder="Residential Address"><%= (st.getR_address() != null) ? st.getR_address() : ""%></textarea></td>
						<td><input type="text" name="category"	value="<%= (st.getCategory() != null) ? st.getCategory() : ""%>"	size="35" placeholder="category"/></td>
						<td><input type="text" name="batch"		value="<%= (st.getBatch() != null) ? st.getBatch() : ""%>"	size="35" placeholder="batch"/></td>
						<td><input type="text" name="semester"	value="<%= (st.getSemester() != 0) ? st.getSemester() : "0"%>" size="35" placeholder="semester"/></td>
						<td><input type="text" name="branch"		value="<%= (st.getBranch() != null) ? st.getBranch() : ""%>"	size="35" placeholder="branch"/></td>
					</tr>
					<% }%>
				</table>
				</div>
				<input type="submit" value="addStudents" name="submit" />
			</form>
		</div>
		<%}%>
	</div>
	<%@include file="_components/footer.jsp" %>
	
	<%@include file="_components/modals.jsp" %>
	<%@include file="_components/javascripts.jsp" %>
</body>
</html>