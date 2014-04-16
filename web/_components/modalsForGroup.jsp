<div id="uploadAttendance" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Upload Attendance</h3>
	</div>
	<form action="Attendance.AddViaXLS" method="POST" enctype="multipart/form-data">
		<div class="modal-body">
			<table>
			<tr>
				<td><input type="file" name="myFile" multiple="multiple" /></td>
				<td><input type="text" name="gid" value="<%= request.getParameter("gid") %>" class="hidden" /></td>
			</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" name="submit" value="uploadAttendance" class="btn btn-primary">Upload</button>
		</div>
	</form>
		</div>
	</div>
</div>

<div id="MessageMembers" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">Message to Members</h3>
	</div>
	<form action="" method="POST">
		<div class="modal-body">
			<h4>Not yet Implemented</h4>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button type="submit" name="submit" value="createGroup" class="btn btn-primary">Send</button>
		</div>
	</form>
		</div>
		</div>
</div>