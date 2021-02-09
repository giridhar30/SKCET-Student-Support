<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@page import="com.skcetstudentsupport.model.Student"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SSS - Cgpa</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">

<% if (!isStudent) { %>

	function individualcgpa()
   		{   
		
			  if (document.getElementById("reg_no").value == "") {
				  alert("Reg No could not be empty!");
				  return;
			  }
			  var ob=new XMLHttpRequest();
		      ob.onreadystatechange=function ss()
		      {
			if(ob.readyState==4)
			{
				document.getElementById("sgpa").innerHTML=ob.responseText;
				
			}
		  }
		var path="IndividualCgpa?reg_no="+document.getElementById("reg_no").value;
		
		  ob.open("POST",path,true);
		  ob.send();
		  return true;
		}
	
	<% } else { %> 
	
function individualcgpa2(regno)
{   var ob=new XMLHttpRequest();
    ob.onreadystatechange=function ss()
    {
		if(ob.readyState==4)
		{
			document.getElementById("sgpa").innerHTML=ob.responseText;
			
		}
}
	var path="IndividualCgpa";

ob.open("POST",path,true);
ob.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
ob.send("reg_no="+regno);
return true;
	}
	
	<%}%>
</script>
</head>
<body id="body-pd">

	<% if (isStudent) { %>

<button style="border-radius: 10px;width: 150px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left: 80%;"><font style="font-family: verdana;color: white;font-size: 20px;"><a href="add-cgpa.jsp" style="text-decoration: none; color: white;">+ Add CGPA</a></font></button>

<%
}%>

<%if (!isStudent) { %>

	<button style="font-family: verdana; color: white; font-size: 15px; border-radius: 10px;width: 200px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left:3%; margin-right: 2%; display:inline-block;">
		<a href="add-credits.jsp" style="text-decoration: none; color: white;">+Add Credit Points</a>
	</button>

	<font style="margin-left: 400px;margin-top: 0;font-color: #696969"><b>Enter the Roll Number</b></font>
	<input type="text" id="reg_no" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 30px; width: 200px;background-color: #F0FFF0;padding: 5px;margin-top: 10px;"></input>
	<button onclick="individualcgpa()" style="border-radius: 5px ;height: 25px;border-width: 0px; margin-left: 65%; width: 100px;background: #38b6ff;margin-top: 10px;color: #ffffff;"><b>View Cgpa</b></button><br>
	
<%} else {%>
	<script type="text/javascript">
		individualcgpa2('<%=(String)session.getAttribute("user_id")%>');
	</script>
<%} %>
	<img alt="" src="img/img.jpg" style="width:700px; height:450px; float: left; display: inline-block; margin-top: 7%;">
	<div id="sgpa" style="float: right; display: inline-block; margin-right: 15%; margin-top: 5%;"></div>
	
	
	
	
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
                        <a href="" class="nav__link active">
                            <ion-icon name="school-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">CGPA</span>
                        </a>

                        <a href="<%if (isStudent) { %>achievements.jsp<%} else { %>FacultyAchievement.jsp<%} %>" class="nav__link">
                            <ion-icon name="<%if (isStudent) { %>trophy-outline<%} else { %>podium-outline<%} %>" class="nav__icon"></ion-icon>
                            <span class="nav__name"><%if (isStudent) { %>Achievements<%} else { %>Analysis<%} %></span>
                        </a>                       

                        <a href="event-dashboard.jsp" class="nav__link">
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
