<%@page import="com.skcetstudentsupport.model.Student"%>
<%@page import="com.skcetstudentsupport.model.Faculty"%>
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
		<title>Analysis</title>
		
		<!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    
	    function piechart()
	    {
	    	var request;
	    	
	    	var url="FacultyAchievement?from="+document.getElementById("from").value+"?"+document.getElementById("to").value;  
	    	  
	    	if(window.XMLHttpRequest){  
	    		request=new XMLHttpRequest();  
	    	}  
	    	else if(window.ActiveXObject){  
	    		request=new ActiveXObject("Microsoft.XMLHTTP");  
	    	}  
	    	  
	    	try{  
		    	request.onreadystatechange = function getInfo() {
		    		
			    	if(request.readyState==4){  
			    		  
						if (request.responseText.length == 0) {
			    			document.getElementById('piechart').innerHTML = "Invalid department or Register No";
			    			return;
			    		}
			    		
			    		var details=request.responseText.split("||");
				        google.charts.load('current', {'packages':['corechart']});
				   	    google.charts.setOnLoadCallback(drawChart);
				   	    console.log(details);
				   	
				   	    function drawChart() {
				   	      		
				   	        	var data = google.visualization.arrayToDataTable([
				   	        		['Type of Achievement', 'Percentage'],
							           ['Others',     parseInt(details[6])],
							           ['Culturals', parseInt(details[5])],
							           ['WorkShop',  parseInt(details[4])],
							           ['Internship', parseInt(details[3])],
							           ['Hackathon',parseInt(details[2])],
							           ['Paper Presentation',parseInt(details[1])],
							           ['Sports', parseInt(details[0])]
					   	        ]);
				   	
					   	        var options = {
					   	          title: 'Achievement Analysis'
					   	        };
					   	
					   	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					   	
					   	        chart.draw(data, options);
					   	      } 
				  
				  }
		    	};  
		    	request.open("POST",url,true);  
		    	request.send();  
	    	}
	    	catch(e)
	    	{
	    		alert("Unable to connect to server");
	    	}  
	    }  
	    
	    function piechart2()
	    {
	    	var request;
	    	
	    	var url="FacultyCgpa?from="+document.getElementById("from").value+"?"+document.getElementById("to").value;  
	    	
	    	if(window.XMLHttpRequest){  
	    		request=new XMLHttpRequest();  
	    	}  
	    	else if(window.ActiveXObject){  
	    		request=new ActiveXObject("Microsoft.XMLHTTP");  
	    	}  
	    	  
	    	try{  
		    	request.onreadystatechange = function getInfo() {
		    		
			    	if(request.readyState==4){  
			    		  
			    		if (request.responseText.length == 0) {
			    			document.getElementById('piechart2').innerHTML = "Invalid department or Register No";
			    			return;
			    		}
			    		
			    		var details=request.responseText.split("||");
			    		
				        google.charts.load('current', {'packages':['corechart']});
				   	    google.charts.setOnLoadCallback(drawChart);
				   	
				   	    function drawChart() {
				   	      		
				   	        	var data = google.visualization.arrayToDataTable([
					   	          ['Semester', 'Cgpa'],
					   	          ['Semester 1',     parseFloat(details[0])],
					   	          ['Semester 2', parseFloat(details[1])],
					   	          ['Semester 3',  parseFloat(details[2])],
					   	          ['Semester 4', parseFloat(details[3])],
					   	          ['Semester 5',parseFloat(details[4])],
					   	          ['Semester 6',parseFloat(details[5])],
					   	          ['Semester 7',    parseFloat(details[6])],
					   	          ['Semester 8',    parseFloat(details[6])]
					   	        ]);
				   	
					   	        var options = {
					   	          title: 'CGPA Analysis'
					   	        };
					   	
					   	        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
					   	
					   	        chart.draw(data, options);
					   	      } 
				  
				  }
		    	};  
		    	request.open("POST",url,true);  
		    	request.send();  
	    	}
	    	catch(e)
	    	{
	    		alert("Unable to connect to server");
	    	}  
	    }
	    
	    function valid() {
	    	if (document.getElementById("from").value == "" || document.getElementById("to").value == "") {
	    		alert("Enter the details properly!");
	    		return false;
	    	}
	    	if (document.getElementById("from").value.search("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$")==-1
  				   || document.getElementById("to").value.search("^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$")==-1
  				   ||  document.getElementById("from").value.substring(0,6)!=document.getElementById("to").value.substring(0,6)) {
  			   alert("Invalid register numbers!");
  			   return false;
  		   }
	    	
	    	return true;
	    }
	    
	    </script>
	</head>
	<body id="body-pd">

		<font style="margin-left: 250px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo from : </b></font><input type="text" name="from" id="from" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 250px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<font style="margin-left: 250px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo to : </b></font><input type="text" name="to" id="to" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 270px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<button onclick="if (valid()) { piechart(); piechart2(); }" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 490px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff;"><b>Analyze</b></button><br>
		<div id="piechart" style="display: inline-block; margin-left: 40px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;"></div>
		<div id="piechart2"  style="display: inline-block; margin-left: 20px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;"></div>
		
		
		<div class="l-navbar" id="navbar">
	            <nav class="nav">
	                <div>
	                    <div class="nav__brand">
	                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                        <a href="#" class="nav__logo">Faculty</a>
	                    </div>
	                    <div class="nav__list">
	                        
	                        <a href="faculty-dashboard.jsp" class="nav__link">
	                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Dashboard</span>
	                        </a>
	                        
	                        <a href="individualcgpa.jsp" class="nav__link">
	                            <ion-icon name="school-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">CGPA</span>
	                        </a>
	
	                        <a href="" class="nav__link active">
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