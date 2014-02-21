<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap-datepicker.js"></script>
<script>
	$(document).ready(function() {
		//$('.js-activated').dropdownHover().dropdown();
		$menu = $('.dropdown-menu');
		//$menu.css('max-height', ($('body').height()*0.7)+'px');
		//$menu.css('min-width', ($('body').width()*0.8)+'px');
		//$menu.css('overflow-y', ('scroll'));
	});
	$(window).resize(function() {
		$menu = $('.dropdown-menu');
		//$menu.css('max-height', ($('body').height()*0.7)+'px');
		//$menu.css('min-width', ($('body').width()*0.8)+'px');
	});
	
	$(document).ready($('.datepicker input').datepicker({
		format: "yyyy-M-dd",
		startDate: "1989-Jan-01",
		endDate: "1999-Jan-31",
		startView: 2,
		orientation: "auto",
		autoclose: true
	}));
	$(document).ready($('.recentdatepicker input').datepicker({
		format: "yyyy-M-dd",
		startDate: "2013-Jan-01",
		endDate: "today",
		todayBtn:"linked" ,
		startView: 1,
		orientation: "auto",
		autoclose: true
	}));
</script>