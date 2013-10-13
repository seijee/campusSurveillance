<%-- 
    Document   : AddStudent
    Created on : Aug 17, 2013, 8:36:20 PM
    Author     : SeiJee
--%>

<%@page import="java.util.Locale"%>
<%@page import="objectClasses.people.Person"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="objectClasses.people.Student"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
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
		<style>
			.student{
				float: left;
				margin: 5px;
				padding: 15px;
			}
			.student:hover{
				background: orange;
			}
			.student input, .student textarea{
				border-color: lavender;
				border-style: solid;
				font-size: 1em;
			}
		</style>
    </head>
	
    <body>
		<div width ="100%" height="300px">
			<% List<Student> s = (List<Student>)request.getAttribute("newStudents");
			
			if (s==null){
%>
			
			<table align="center">
				<tr>
					<td><input type="text" id="collegeId" value="" size="5" /></td>
					<td><input type="text" id="branch" value="" size="3" /></td>
					<td><input type="text" id="prefix" value="" size="5" /></td>
				</tr>
				<tr>
					<td><input type="text" id="start" value="1" size="3" /></td>
					<td><input type="text" id="total" value="120" size="3" /></td>
					<td><input onclick="addField();" type="button" value="Add" /></td>
					<td><input onclick="deleteRows();" type="button" value="Delete" /></td>
				</tr>
				
			</table>
			<% } %>
		</div>
		<form action=".ImportStudents" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<td><input type="file" name="myFile" multiple="multiple" /></td>
				<td> <input type="submit" value="Upload it" /> </td>
			</tr>
		</table>
		</form>
		<div>
		<form action="*.AdminServe" method="POST">
			<table id="studentTable" border="0">
			</table>
<% 
if (s!=null)
Collections.sort(s,Student.c);
if (s!=null)
for (Student st : s) { %>
<table class="student">
<tr><td></td><td><b><%= st.getId() %></b><input type="text" name="id"	value="<%= st.getId() %>" hidden="hidden"		readonly="readonly"/></td></tr>
<tr><td>Name</td><td><input type="text" name="name"			value="<%= st.getName() %>"		size="35" placeholder="Name"/></td></tr>
<tr><td>Father</td><td><input type="text" name="father_name"		value="<%= (st.getFather_name()!=null)? st.getFather_name():"" %>"	size="35"  placeholder="father"/></td></tr>
<tr><td>Mother</td><td><input type="text" name="mother_name"		value="<%= (st.getMother_name()!=null)? st.getMother_name():"" %>"	size="35"  placeholder="mother"/></td></tr>
<tr><td>Gender</td><td><input type="text" name="gender"		value="<%= (st.getGender()!=null)? st.getGender():"" %>"		size="35"	placeholder="Gender"/></td></tr>
<tr><td>DOB</td><td><input type="text" name="dob"			
	value="<%= st.getDOB().get(Calendar.YEAR)%>-<%= st.getDOB().getDisplayName(Calendar.MONTH,Calendar.SHORT,Locale.ENGLISH)%>-<%= st.getDOB().get(Calendar.DAY_OF_MONTH)%>"size="10" placeholder="DOB"/></td></tr>
<tr><td>Blood Group</td><td><input type="text" name="bloodgroup"		value="<%= (st.getBloodgroup()!=null)? st.getBloodgroup():"NA" %>"	size="35" placeholder="branch"/></td></tr>
<tr><td>email</td><td><input type="text" name="email"		value="<%= (st.getEmail()!=null)? st.getEmail():"" %>"	size="35" placeholder="email"/></td></tr>
<tr><td>mobile</td><td><input type="text" name="mobile"		value="<%= (st.getMobile())!=null? st.getMobile():"" %>"		size="35"	 placeholder="Mobile Number"/></td></tr>
<tr><td>P address</td><td><textarea type="text" name="p_address" cols="22" rows="4"	placeholder="Address"/><%= (st.getP_address()!=null)? st.getP_address():"" %></textarea></td></tr>
<tr><td>R address</td><td><textarea type="text" name="r_address" cols="22" rows="4"	placeholder="Residential Address"/><%= (st.getR_address()!=null)? st.getR_address():"" %></textarea></td></tr>
<tr><td>category</td><td><input type="text" name="category"	value="<%= (st.getCategory()!=null)? st.getCategory():"" %>"	size="35" placeholder="category"/></td></tr>
<tr><td>batch</td><td><input type="text" name="batch"		value="<%= (st.getBatch()!=null)? st.getBatch():"" %>"	size="35" placeholder="batch"/></td></tr>
<tr><td>semester</td><td><input type="text" name="semester"	value="<%= (st.getSemester()!=0)?st.getSemester():"0" %>" size="35" placeholder="semester"/></td></tr>
<tr><td>branch</td><td><input type="text" name="branch"		value="<%= (st.getBranch()!=null)? st.getBranch():"" %>"	size="35" placeholder="branch"/></td></tr>
</table>
<% } %>
			</table>
			<input type="submit" value="addStudents" name="submit" />
		</form>
		</div>
    </body>
</html>
