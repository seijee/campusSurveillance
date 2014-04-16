<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class=" js no-touch csstransitions">
<head>
	<meta charset="utf-8" />
	<%@include file="_components/head.jsp" %>
</head>
<body>
	<%@include file="_components/navbar.jsp" %>
	<!--[if !IE]><!-->
	<div id="pre-page-content">
		<h1><i class="gi gi-home themed-color"></i>Dashboard<br/><small>Welcome, <%= user.getName() %></small></h1>
	</div>
	<div id="page-content">
		<div class="block block-tiles block-tiles-animated clearfix">
			<a href="" class="tile tile-height-2x tile-themed themed-background-tulip">
			<i class="gi gi-envelope"></i>
			<div class="tile-info">
			<div class="pull-left">Messages</div>
			<div class="pull-right"><strong>1</strong></div>
			</div>
			</a>
			<a href="" class="tile tile-height-2x tile-themed themed-background-cherry">
			<i class="gi gi-bell"></i>
			<div class="tile-info">
			<div class="pull-left">Notifications</div>
			<div class="pull-right"><strong>1</strong></div>
			</div>
			</a>
			<a href="" class="tile tile-width-2x tile-height-2x tile-themed themed-background-stone">
				<i class="gi gi-user"></i>
			<div class="tile-info">Profile</div>
			</a>
			<a href="" class="tile tile-height-2x tile-themed themed-background-night">
			<i class="gi gi-stats"></i>
			<div class="tile-info">
			<div class="pull-left">Attendance</div>
			<div class="pull-right"><strong><%= dao.PunctualityModule.calculatePunctuality(user.getId(), 0) %></strong></div>
			</div>
			</a>
			<a href="" class="tile tile-height-2x tile-themed themed-background-city">
			<i class="gi gi-cloud-download"></i>
			<div class="tile-info">
			<div class="pull-left">Downloads</div>
			<div class="pull-right"><strong>1.5m</strong></div>
			</div>
			</a>
			<a href="groups.jsp" class="tile tile-width-2x tile-themed themed-background-amethyst">
			<i class="gi gi-group"></i>
			<div class="tile-info">
			<div class="pull-left">Groups</div>
			<% List<Group> alliedGroups = dao.GroupModule.getAlliedGroups(user); %>
			<div class="pull-right"><strong><%=alliedGroups.size()%></strong></div>
			</div>
			</a>
			<a href="" class="tile tile-themed themed-background-sun">
			<i class="fa fa-smile-o"></i>
			<div class="tile-info"><strong>10k</strong> Smiles!</div>
			</a>
			
			<a href="" class="tile tile-themed themed-background-deepsea">
			<i class="si si-facebook"></i>
			<div class="tile-info">
			<div class="pull-left">Likes</div>
			<div class="pull-right"><strong>212k</strong></div>
			</div>
			</a>
			<a href="" class="tile tile-themed themed-background-ocean">
			<i class="si si-twitter"></i>
			<div class="tile-info">
			<div class="pull-left">Followers</div>
			<div class="pull-right"><strong>153k</strong></div>
			</div>
			</a>
			<a href="user.SignOut" class="tile tile-themed themed-background-fire">
			<i class="fa fa-power-off"></i>
			<div class="tile-info"><strong>Sign Out</strong></div>
			</a>
			
		</div>
	</div>
	<%@include file="_components/footer.jsp" %>
	<%@include file="_components/modals.jsp" %>
	<%@include file="_components/javascripts.jsp" %>
</body>
</html>