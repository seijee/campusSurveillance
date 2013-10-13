<%-- 
    Document   : tableViewer
    Created on : Oct 10, 2013, 8:34:23 AM
    Author     : SeiJee
--%>

<%@page import="org.hibernate.ScrollableResults"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
			body{
				width: 100%;
			}
			td{
				border:1px solid #F0F0F0;
				margin: 0px;
				padding:1px 6px;
			}
			table{
				table-layout: fixed;
				min-width: 80%;
				margin-left: 10%;
				font-size: 50%;
			}
		</style>
    </head>
	<%
		List tables = testing.Testing.GetTables();
		String task = request.getParameter("task");
	%>
    <body>

		<form action="" method="POST">
			<select name="table">
				<% for(Object table : tables){ %>
				<option value="<%=table%>"><%=table%></option>
				<%}%>
			</select>
			<input type="submit" value="select" name="task" />
		</form>
				<% if ("select".equals(task)){
						List<Object[]> data = testing.Testing.GetTableData(request.getParameter("table"));
						%><table border="1"><%
						for (Object[] array : data){
							out.println("<tr>");
							for (Object ent :array){
								out.print("<td>");
								out.print(ent);
								out.print("</td>");
							}
							out.println("</tr>");
						}
						%></table><%
				%>
					
				<%}%>
    </body>
</html>
