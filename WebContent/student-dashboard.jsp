<%@page import="com.skcetstudentsupport.service.EventDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.skcetstudentsupport.model.Event"%>
<%@page import="com.skcetstudentsupport.model.Student"%>
<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	
		Object loggedIn = session.getAttribute("logged-in");
		Object user = session.getAttribute("user");
		boolean isStudent = false;
		
		if (loggedIn == null || !(Boolean)loggedIn || user instanceof Faculty) {
			response.sendRedirect("index.jsp");
		} else isStudent = true;
		Student student = null;
		if(isStudent) student = (Student)user;
		
	

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <title>SSS - Student Dashboard</title>
        
         <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
        <script type="text/javascript">
        	function updatePass() {
        		document.getElementById("updatepass").style.display = "block";
        		document.getElementById("updateBtn").style.display = "none";
        	}
        
   function piechart()
   {

          
    	var ob=new XMLHttpRequest();

        ob.onreadystatechange=function ss()
        {
           if(ob.readyState==4)
           {
           		var details=ob.responseText.split("||"); 
            	google.charts.load('current', {'packages':['corechart']});
       			google.charts.setOnLoadCallback(drawChart);
           
       			function drawChart() {
 
			       // console.log(parseInt(details[0])+1,details[1]+1,details[2]+1)
			         //var details=[1,2,3,4,5,6,7];
			       //  var details=[1,2,3,4,5,6,7];
			          var data = google.visualization.arrayToDataTable([
			           ['Type of Achievement', 'Percentage'],
			           ['Others',     parseInt(details[0])],
			           ['Culturals', parseInt(details[1])],
			           ['WorkShop',  parseInt(details[2])],
			           ['Internship', parseInt(details[3])],
			           ['Hackathon',parseInt(details[4])],
			           ['Paper Presentation',parseInt(details[5])],
			           ['Sports', parseInt(details[6])]
			         ]);
			 
			         var options = {
			           title: 'My Achievement'
			         };
			 
			         var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			 
			         chart.draw(data, options);
			 	}
             }
          }
      
         
          var path="Analysis";

          ob.open("POST",path,true);
          ob.send(); 
          return true;
   }
   
   function piechart1()
   {
           var ob=new XMLHttpRequest();

          ob.onreadystatechange=function ss()
          {
           if(ob.readyState==4)
           {
            var details=ob.responseText.split("||"); 
            google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChart);
 
        function drawChart() {
 
       // console.log(parseInt(details[0])+1,details[1]+1,details[2]+1)
         //var  details=[9,8.5,6,7.8,9,8,9,7];
        // var  details=[9,8.5,6,7.8,9,8,9,7];
          var data = google.visualization.arrayToDataTable([
					   	          ['Type of Achievement', 'Percentage'],
					   	          ['Semester 1',     parseFloat(details[0])],
					   	          ['Semester 2', parseFloat(details[1])],
					   	          ['Semester 3',  parseFloat(details[2])],
					   	          ['Semester 4', parseFloat(details[3])],
					   	          ['Semester 5',parseFloat(details[4])],
					   	          ['Semester 6',parseFloat(details[5])],
					   	          ['Semester 7',    parseFloat(details[6])],
					   	          ['Semester 8',    parseFloat(details[7])]
					   	        ]);
 
         var options = {
           title: 'My Performance'
         };
 
         var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
 
         chart.draw(data, options);
       }
             }
          }
         
          var path="CgpaGraph";

          ob.open("POST",path,true);
          ob.send(); 
          return true;
   }
   
   function validatePass (form) {
	   if (form.pass.value.length < 6) {
		   alert("Password length must be atleast 6");
		   return false;
	   }
	   return true;
   }
   </script>
        
    </head>
    
    <body id="body-pd">
    
    <button id="updateBtn" onclick="updatePass()" style="font-family: verdana; color: white; font-size: 15px; border-radius: 10px;width: 200px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left:75%; margin-right: 2%; display:inline-block;">Update Password</button>
    
	<form id="updatepass" style="margin-left:70%; margin-right: 3%; display: none;" action="UpdatePassword" method="POST" onsubmit="return validatePass(this);">
		<input style="padding: 5px; font-family: verdana; font-size: 15px; border-radius: 10px; height: 40px; border-width: 1px;" type="password" name="pass" placeholder="new password" required>
		<input style="padding: 5px; font-family: verdana; color: white; font-size: 15px; border-radius: 10px; height: 40px; background-color: #fda50f; border-width: 0px;" type="submit" value="Update">
	</form>
	
	<h2 id="msg" style="">Hi, <% if (student!=null) out.print(student.getName()); %>!</h2>
	
	
	<div id="piechart" style="float: left;margin-left: 20px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;">
    	<script type="text/javascript">piechart();</script>
  	</div>

  	<div id="piechart1" style="float: right;margin-right: 20px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color:  #FFF5EE ;">
		<script type="text/javascript">piechart1();</script>
	</div>


        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="#" class="nav__logo">Student</a>
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

                        <a href="achievements.jsp" class="nav__link">
                            <ion-icon name="trophy-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Achievements</span>
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