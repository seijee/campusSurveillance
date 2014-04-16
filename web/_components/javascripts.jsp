<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8"></meta>
<!--[if lte IE 8]><script src="js_files/helpers/excanvas.min.js"></script><![endif]-->

<script src="./js_files/jquery.min.js"></script>
<script src="./js_files/bootstrap.min-1.5.js"></script>
<script src="./js_files/plugins-1.5.js"></script>
<script src="./js_files/main-1.5.js"></script> 
<script>
	
	$(document).ready($('.datepicker input').datepicker({
		format: "yyyy-mm-dd",
		startDate: "1989-01-01",
		endDate: "1999-01-31",
		startView: 2,
		orientation: "auto",
		autoclose: true
	}));
	$(document).ready($('.recentdatepicker input').datepicker({
		format: "yyyy-mm-dd",
		startDate: "2013-01-01",
		endDate: "today",
		todayBtn:"linked" ,
		startView: 1,
		orientation: "auto",
		autoclose: true
	}));
</script>
