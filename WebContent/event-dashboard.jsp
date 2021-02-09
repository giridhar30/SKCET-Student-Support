<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@page import="com.skcetstudentsupport.model.Student"%>
<%@page import="com.skcetstudentsupport.model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.skcetstudentsupport.service.EventDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	Object loggedIn = session.getAttribute("logged-in");
	Object user = session.getAttribute("user");
	
	if (loggedIn == null || !(Boolean)loggedIn) {
		response.sendRedirect("index.jsp");
	}
	
	boolean isStudent = user instanceof Student;
	Student student = null;
	Faculty faculty = null;
	if (isStudent) 
		student = (Student)user;
	else
		faculty = (Faculty)user;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SSS - Events</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="js/event.js"></script>

</head>
<body id="body-pd">

<% if (!isStudent) { %>

<button style="border-radius: 10px;width: 150px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left: 80%;"><font style="font-family: verdana;color: white;font-size: 20px;"><a href="add-event.jsp" style="text-decoration: none; color: white;">+ Add Event</a></font></button>

<%
}%>

<%
ArrayList<Event> events = new EventDao().fetchAllEvents();

for (Event event: events) {
	
	int id = event.getId();
	
	%>

	<div style="margin: 30px 2%; width:45%; display: inline-block; border-radius: 10px; background: #40c4ff; text-align: center;">
		<div class="event" style="width: 100%; text-align: center; padding: 20px 0;">
	
			<h5 style="color: #ffffff;font-family: verdana;font-size: 20px;"><%=event.getName() %> by <%=event.getOrganization() %></h5>
			<p style="color: #ffffff;font-size: 20px;">---------------------------------------------------</p>
			<h5 style="color: #ffffff; margin: 10px 0; font-family: verdana;font-size: 15px;"> Date: <%=event.getDate() %> </h5>
			<a href="<%=event.getLink() %>" style="color: #000;font-family: verdana;font-size: 15px;text-decoration: none;">click here to know more</a>
			
			<h5 style="color: #ffffff; margin: 10px 0; font-family: verdana;font-size: 15px;"><%=event.getDescription() %> </h5>
			<h5 style="margin: 10px 0; font-family: verdana;font-size: 15px;">Contact: <%=event.getContact() %></h5>
			<p style="color: #ffffff;font-size: 20px;">---------------------------------------------------</p>
			<% if (isStudent) { %>
			<button style="border-radius: 5px; background-color: #40c4ff; outline: none; border-width: 0; padding: 5px; font-size: 28px;" value="<%=id %>" onclick="updateInterest(<%="\'"+ student.getRegisterNo() +"\'"%>, this.value)"><i class="fa fa-heart" id="interested<%=id %>" style="margin-right: 2px; font-size:30px; cursor:pointer;"></i> <span id="count<%=id %>"></span></button>
			<script type="text/javascript">checkInterest(<%="\'"+ student.getRegisterNo() +"\'"%>, <%=id %>);</script>
			<% }%>
	
			<% if (!isStudent) { %>
			<button style="border-radius: 5px; background-color: #40c4ff; margin-left:10px; float: left; outline: none; border-width: 0; padding: 5px; font-size: 28px;"><i class="fa fa-heart" style="margin-right: 2px; font-size:30px; color:#f0a;"></i> <span id="count<%=id %>" style="font-size: 28px;"></span></button>
			<script type="text/javascript">getInterestCount(<%=id %>)</script>
	
			<button onclick="deleteEvent(<%=id %>)" style="float: right; margin-right:10px; margin-top:10px; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 5px;"><i class="fa fa-close" style="color:#FF0000;margin-right: 2px;"></i>Delete</button>

			<% }%>
	
			<br><br>
	
		</div>
	</div>
	<%
	
}

%>

<div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="#" class="nav__logo"><%if (isStudent) { %>Student<%} else { %>Faculty<%} %></a>
                    </div>
                    <div class="nav__list">
                        <a href="<%if (isStudent) { %>student-dashboard.jsp<%} else { %>faculty-dashboard.jsp<%} %>" class="nav__link">
                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Dashboard</span>
                        </a>
                        <a href="individualcgpa.jsp" class="nav__link">
                            <ion-icon name="school-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">CGPA</span>
                        </a>

                        <a href="<%if (isStudent) { %>achievements.jsp<%} else { %>FacultyAchievement.jsp<%} %>" class="nav__link">
                            <ion-icon name="<%if (isStudent) { %>trophy-outline<%} else { %>podium-outline<%} %>" class="nav__icon"></ion-icon>
                            <span class="nav__name"><%if (isStudent) { %>Achievements<%} else { %>Analysis<%} %></span>
                        </a>                       

                        <a href="" class="nav__link active">
                            <ion-icon name="calendar-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Events</span>
                        </a>
                       
                    </div>
                </div>

                <a href="Logout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav__name">Log Out</span>
                </a>
            </nav>
        </div>

     
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
       
        <!-- ===== MAIN JS ===== -->
        <script src="js/main.js"></script>


</body>
</html>