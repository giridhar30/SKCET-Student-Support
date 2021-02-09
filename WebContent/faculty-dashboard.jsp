<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@page import="com.skcetstudentsupport.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	Object loggedIn = session.getAttribute("logged-in");
	Object user = session.getAttribute("user");
	
	if (loggedIn == null || !(Boolean)loggedIn || user instanceof Student) {
		response.sendRedirect("index.jsp");
	}
	Faculty faculty = null;
	if (user instanceof Faculty) faculty = (Faculty)user;

%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>SSS - Faculty Dashboard</title>
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
        <script type="text/javascript">
        	
        	function updatePass() {
        		document.getElementById("updatepass").style.display = "block";
        		document.getElementById("updateBtn").style.display = "none";
        	}
        	
        	function validatePass (form) {
        		   if (form.pass.value.length < 6) {
        			   alert("Password length must be atleast 6");
        			   return false;
        		   }
        		   return true;
        	}   
        	
        	function validatefromto (form) {
     		   if (form.from.value.search("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$")==-1
     				   || form.to.value.search("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$")==-1
     				   ||  form.from.value.substring(0,6)!=form.to.value.substring(0,6)) {
     			   alert("Invalid register numbers!");
     			   return false;
     		   }
     		   return true;
     		}   
        	
        </script>        
        
	</head>
	<body id="body-pd">
	
	<% String s = request.getParameter("err"); if (s!=null && s.equals("wrong_cred")) { %>
		<h2 align="center" style="margin: 0 0;"><b style="background-color: red; color: white; font-family: monospace;">
			Invalid Entries!
		</b></h2>
	<%} %>
	
	<% if (s!=null && s.equals("diff_dept")) { %>
		<h2 align="center" style="margin: 0 0;"><b style="background-color: red; color: white; font-family: monospace;">
			Entries belong to different department!
		</b></h2>
	<%} %>
	
	<button id="updateBtn" onclick="updatePass()" style="font-family: verdana; color: white; font-size: 15px; border-radius: 10px;width: 200px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left:75%; margin-right: 2%; display:inline-block;">Update Password</button>
    
	<form id="updatepass" onsubmit="validatePass(this)" style="margin-left:70%; margin-right: 3%; display: none;" action="UpdatePassword" method="POST">
		<input style="padding: 5px; font-family: verdana; font-size: 15px; border-radius: 10px; height: 40px; border-width: 1px;" type="password" name="pass" placeholder="new password" required>
		<input style="padding: 5px; font-family: verdana; color: white; font-size: 15px; border-radius: 10px; height: 40px; background-color: #fda50f; border-width: 0px;" type="submit" value="Update">
	</form>
	
	<h2 id="msg" style="">Hi, <% if (faculty!=null) out.print(faculty.getName()); %>!</h2>
	
	<form style="margin-top: 5%;" action="GetReport" onsubmit="return validatefromto(this);">
	<font style="margin-left: 250px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo from : </b></font><input type="text" required name="from" id="from" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 250px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<font style="margin-left: 250px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo to : </b></font><input type="text" required name="to" id="to" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 270px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<input type="submit" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 290px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff; display: inline;" value="Students report" name="student">
		<input type="submit" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 30px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff; display: inline;" value="Achievements report" name="achievement">
		<input type="submit" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 30px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff; display: inline;" value="CGPA report" name="cgpa"><br>
	</form>
	
		<div class="l-navbar" id="navbar">
	            <nav class="nav">
	                <div>
	                    <div class="nav__brand">
	                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                        <a href="#" class="nav__logo">Faculty</a>
	                    </div>
	                    <div class="nav__list">
	                        
	                        <a href="#" class="nav__link active">
	                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Dashboard</span>
	                        </a>
	                        
	                        <a href="individualcgpa.jsp" class="nav__link">
	                            <ion-icon name="school-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">CGPA</span>
	                        </a>
	
	                        <a href="FacultyAchievement.jsp" class="nav__link">
	                            <ion-icon name="podium-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Analysis</span>
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