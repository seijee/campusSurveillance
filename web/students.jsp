<%@page import="objectClasses.people.Student"%>
<%@page import="objectClasses.Group"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Nemaji &amp Guptaji</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Le styles -->
		<link href="./css1/bootstrap.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'/>
		<style type="text/css">
			body {
				padding-top: 60px;
				padding-bottom: 40px;
			}
			.sidebar-nav {
				padding: 9px 0;
			}

			@media (max-width: 980px) {
				/* Enable use of floated navbar text */
				.navbar-text.pull-right {
					float: none;
					padding-left: 5px;
					padding-right: 5px;
				}
			}

			.square{
				width:100%;
				display: inline-block;
				position:relative;
			}
			.square:after {
				padding-top: 30%; /*16:9 ratio*/
				display: block;
				content: '';
			}
			.inner{
				position:absolute;
				top: 5%; bottom: 20%; right: 0; left: 0; /*fill parent*/
				/*background-color: rgb(0, 162, 232);*/
				padding:3%;

			}
			.thumbnail:hover{
				border: 1px solid rgb(0, 162, 232);
				background-color: #FECA40;
			}
			.thumbnail p{
				cursor:pointer;
			}
			
			.navbar-inverse .navbar-inner{
				background-image:url('http://wallpoper.com/images/00/43/41/48/green-lines-texture_00434148.jpg');
				background-size:cover;
				*http://versporttvonline.com/wp-content/uploads/2013/05/Colorful-texture-by-wyeko-on-deviantart.jpg
					*http://1.bp.blogspot.com/-Ra02xeZeGbo/TndRlPS9U5I/AAAAAAAAAFk/6-OdtXtet2Q/s400/01123_regalblue_1600x1200.jpg
					*http://wallpoper.com/images/00/43/41/48/green-lines-texture_00434148.jpg //green
			}

			.navbar-inverse .brand,
			.navbar-inverse .nav > li > a {
				color: #cccccc;
				text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
			}
		</style>

		<link href="./css/bootstrap-responsive.css" rel="stylesheet">

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		  <script src="../js/html5shiv.js"></script>
		<![endif]-->

		<!-- Fav and touch icons -->
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="./ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="./ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="./ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="./ico/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="./ico/favicon.png">
	</head>
	<%@page import="objectClasses.people.Person"%>
	<%@page import="java.util.List"%>
	<%
	Person user = (Person)session.getAttribute("user");
	if (user==null) {response.sendRedirect(".SignOut");}
	else {
		List<Group> allied = dao.GroupModule.getAlliedGroups(user);
		List<Group> owned = dao.GroupModule.getOwnedGroups(user);
	%>
	<body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="brand" href="#">theGifts.com</a>
					<div class="nav-collapse collapse">
						<p class="navbar-text pull-right">
							Logged in as <a href="#" class="navbar-link"><%=user.getName()%></a>
						</p>
						<ul class="nav">

							<li class="dropdown">
								<a href="#" class="dropdown-toggle js-activated" data-toggle="Men">Men</a>
								<ul class="dropdown-menu span5">

									<div class="row-fluid" style="padding:15px;">
										<div class="span4">
											<a>Birthday</a><br/>
											<a>Wedding</a><br/>
											<a>Anniversary</a><br/>
											<a>New Job</a><br/>
											<a>etc</a>
										</div>
										<div  class="span4">
											something
										</div>
										<div class="span4">
											something
										</div>
									</div>

								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle js-activated" data-toggle="Women">Women</a>
								<ul class="dropdown-menu span5">

									<div class="row-fluid" style="padding:15px;">
										<div class="span4">
											<a>Birthday</a><br/>
											<a>Wedding</a><br/>
											<a>Anniversary</a><br/>
											<a>New Job</a><br/>
											<a>etc</a>
										</div>
										<div  class="span4">
											something
										</div>
										<div class="span4">
											something
										</div>
									</div>

								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle js-activated" data-toggle="Teens">Teens</a>
								<ul class="dropdown-menu span5">

									<div class="row-fluid" style="padding:15px;">
										<div class="span4">
											<a>Birthday</a><br/>
											<a>Wedding</a><br/>
											<a>Anniversary</a><br/>
											<a>New Job</a><br/>
											<a>etc</a>
										</div>
										<div  class="span4">
											something
										</div>
										<div class="span4">
											something
										</div>
									</div>

								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle js-activated" data-toggle="Kids">Kids</a>
								<ul class="dropdown-menu span5">

									<div class="row-fluid" style="padding:15px;">
										<div class="span4">
											<a>Birthday</a><br/>
											<a>Wedding</a><br/>
											<a>Anniversary</a><br/>
											<a>New Job</a><br/>
											<a>etc</a>
										</div>
										<div  class="span4">
											something
										</div>
										<div class="span4">
											something
										</div>
									</div>

								</ul>
							</li>
						</ul>

					</div><!--/.nav-collapse -->
				</div>
			</div>
		</div>
		<h1>What the Font??</h1>
		<% for ( Group g : allied){ 
				List<Person> members = dao.GroupModule.getMembers(g);
		%>
		<h3><%= g.getTitle() %></h3>
		<ul class=" container-fluid thumbnails">
			<%for (Person member : members){%>
			<li class="span2">
				<div class="square thumbnail">
					<div class="inner" style="background:url('');background-size:contain;background-position:center; background-repeat:no-repeat;">
						<p class="pull-left"><%=member.getName() %><small> (<%=member.getType() %>)</small></p>
					</div>
					<div style="position:absolute; bottom:0;" >
						
					</div>
				</div>
			</li>
			<% } %>
		</ul>
		<% } %>
        <!--/span-->


		<hr/>

		<footer>
			<p>&copy; nemaji-guptaji 2013</p>
		</footer>

    </div><!--/.fluid-container-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap-transition.js"></script>
    <script src="./js/bootstrap-alert.js"></script>
    <script src="./js/bootstrap-modal.js"></script>
    <script src="./js/bootstrap-dropdown.js"></script>
    <script src="./js/bootstrap-scrollspy.js"></script>
    <script src="./js/bootstrap-tab.js"></script>
    <script src="./js/bootstrap-tooltip.js"></script>
    <script src="./js/bootstrap-popover.js"></script>
    <script src="./js/bootstrap-button.js"></script>
    <script src="./js/bootstrap-collapse.js"></script>
    <script src="./js/bootstrap-carousel.js"></script>
    <script src="./js/bootstrap-typeahead.js"></script>
    <script src="./js/drophover.js"></script>

	<script>
		$(document).ready(function() {
			$('.js-activated').dropdownHover().dropdown();
			$menu = $('.dropdown-menu');
			$menu.css('min-width', ($('body').width()*0.2)+'px');
		});
		$(window).resize(function() {
			$menu = $('.dropdown-menu');
			$menu.css('min-width', ($('body').width()*0.3)+'px');
		});
	</script>


</body>
</html>
<%}%>
