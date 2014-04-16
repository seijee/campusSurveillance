<%@include file="keyComponents/_initSession.jsp" %>

<html>
<head>
	<%@include file="keyComponents/_metroHead.jsp" %>
	<link href="css/home.css" rel="stylesheet" />
</head>
<body>
	<div class="metro">
	<div class="tile-area tile-area-dark">
		<h1 class="tile-area-title fg-white">WELCOME</h1>
        <div class="user-id">
            <div class="user-id-image">
                <span class="icon-user no-display1"></span>
                <img src="images/Battlefield_4_Icon.png" class="no-display">
            </div>
            <div class="user-id-name">
                <span class="first-name"><%=user.getName()%></span>
                <span class="last-name"><%=user.getType()%></span>
            </div>
			
        </div>
		
		<!-- Tile group -->
		<div class="tile-group six">

            <a class="tile double bg-lightBlue live" data-role="live-tile" data-effect="slideUp" data-click="transform">
                <div class="tile-content email">
                    <div class="email-image">
                        <img src="images/obama.jpg">
                    </div>
                    <div class="email-data">
                        <span class="email-data-title">Notification 1</span>
                        <span class="email-data-subtitle">Welcome</span>
                        <span class="email-data-text">CAMPUS SURVIELLANCE</span>
                    </div>
                </div>
                <div class="tile-content email">
                    <div class="email-image">
                        <img src="images/jolie.jpg">
                    </div>
                    <div class="email-data">
                        <span class="email-data-title">Notification 2</span>
                        <span class="email-data-subtitle">Welcome</span>
                        <span class="email-data-text">CAMPUS SURVIELLANCE</span>
                    </div>
                </div>
                <div class="tile-content email">
                    <div class="email-image">
                        <img src="images/shvarcenegger.jpg">
                    </div>
                    <div class="email-data">
                        <span class="email-data-title">Notification 3</span>
                        <span class="email-data-subtitle">Welcome</span>
                        <span class="email-data-text">CAMPUS SURVIELLANCE</span>
                    </div>
                </div>
                <div class="brand">
                    <div class="label"><h3 class="no-margin fg-white"><span class="icon-mail"></span></h3></div>
                    <div class="badge">3</div>
                </div>
            </a> <!-- end tile -->

            <a class="tile double bg-violet" data-click="transform">
                <div class="tile-content">
                    <div class="text-right padding10 ntp">
                        <h1 class="fg-white no-margin">1</h1>
                        <p class="fg-white">Tuesday</p>
                    </div>
                </div>
                <div class="brand">
                    <div class="label"><h3 class="no-margin fg-white"><span class="icon-calendar"></span></h3></div>
                </div>
            </a> <!-- end tile -->

            <!-- small tiles -->
            <a href="#addAdmin" role="button"  data-toggle="modal" class="tile bg-lightBlue" data-click="transform">
                <div class="tile-content icon">
                    <span class="icon-info"></span>
                </div>
                <div class="brand">
                    <div class="label">About Us</div>
                </div>
            </a>

            <a href="#" class="tile bg-darkOrange" data-click="transform">
                <div class="tile-content icon">
                    <span class="icon-help"></span>
                </div>
                <div class="brand">
                    <div class="label">Help+Tips</div>
                </div>
            </a>
            <!-- end small tiles -->

            <!-- small tiles -->
          

            <!-- end small tiles -->

            <a class="tile double double-vertical bg-darkGreen" data-click="transform">
                <div class="tile-content">
                    <div class="padding10">
                        <h1 class="fg-white ntm">57%</h1>
                        <h2 class="fg-white no-margin">Attendance</h2>
                   
                        <p class="tertiary-text fg-white no-margin">From</p>
                        <p class="tertiary-text fg-white">1st March 2014</p>
                        <p class="tertiary-text fg-white no-margin">To</p>
                        <p class="tertiary-text fg-white">31st March 2014</p>
                    </div>

                </div>
                <div class="tile-status">
                    <div class="label">{Warning/Msg}</div>
                </div>
            </a> <!-- end tile -->

            <div class="tile double" data-click="transform">
                <div class="tile-content image-set">
                    <img src="images/jeki_chan.jpg">
                    <img src="images/jek_vorobey.jpg">
                    <img src="images/jolie.jpg">
                    <img src="images/obama.jpg">
                    <img src="images/shvarcenegger.jpg">
                </div>
            </div> <!-- end tile -->

            

            <a class="tile double bg-lightBlue" data-click="transform">
                <div class="tile-content image">
                    <img src="images/windows_8_default_13_wallpaper.jpg">
                </div>
                <div class="brand">
                    <div class="label">Desktop</div>
                </div>
            </a>
			

            <a class="tile double bg-darkOrange" data-click="transform">
                <div class="tile-content icon">
                    <span class="icon-user"></span>
                </div>
                <div class="brand">
                    <div class="label">Profile</div>
                </div>
            </a>
			<a class="tile bg-lightBlue" data-click="transform">
                <div class="tile-content icon">
				<span class="icon-key"></span>
                </div>
            </a>
			<a href="user.SignOut" class="tile bg-red" data-click="transform"
				data-hint="Title|This is a hint for Me"
				data-hint-position="top">
                <div class="tile-content icon">
				<span class="icon-switch"></span>
                </div>
            </a>
        </div><!--end tile group -->
		
		
		<!-- Groups -->
<% int count = alliedGroups.size();
String tileGroupSize = "one";
if (count>3) tileGroupSize = "two";
else if (count>7) tileGroupSize = "three";
else if (count>11) tileGroupSize = "four";
else if (count>15) tileGroupSize = "five";
else if (count>19) tileGroupSize = "six";
else if (count>23) tileGroupSize = "seven";
%>
<div class="tile-group <%= tileGroupSize %>">
			<div class="tile-group-title">Groups</div>
			<a href="#" class="tile bg-lightBlue" data-click="transform">
                <div class="tile-content icon">
                    <span class="icon-plus-2"></span>
                </div>
				<div class="brand">
					<div class="label">Create Group</div>
				</div>
            </a>
			<% for (Group group : alliedGroups) {%>
				<a href="group.jsp?gid=<%=group.getGroup_id()%>" class="tile bg-darkGreen" data-click="transform">
				<div class="tile-content icon">
					<span class="icon-newspaper"></span>
                </div>
				<div class="brand">
					<div class="label"><%=group.getTitle()%></div>
				</div>
				</a>
			<%}%>
		</div>
	</div>
	</div>
	<script src="./js/bootstrap.min.js"></script>
	<%@include file="keyComponents/_forms.jsp" %>
</body>
</html>
