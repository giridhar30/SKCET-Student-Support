<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	Object adminLoggedIn = session.getAttribute("admin-logged-in");

	if (adminLoggedIn == null || !(Boolean)adminLoggedIn) 
		response.sendRedirect("index.jsp");

%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
		<title>SSS - Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/styles.css">
        
        <script type="text/javascript">
        
        function validateStudent(form) {
        	
        	var regno = "^[\\d]{2}[a-zA-Z]{4}[\\d]{3}$";
        	var name = "^[a-zA-Z\\.]*$";
        	var phone = "^[6789]{1}[\\d]{9}$";
        	
        	if (form.registerNo.value.search(regno)==-1) {
        		alert("Invalid RegisterNo");
        		return false;        		
        	}
        	if (form.name.value.search(name)==-1) {
        		alert("Invalid Name");
        		return false;        		
        	}
        	if (form.phone.value.search(phone)==-1) {
        		alert("Invalid phone number");
        		return false;        		
        	}
        	if (form.section.value.length != 1) {
        		alert("Invalid section!");
        		return false;        		
        	}
        	
        	
        	return true;
        	
        }
        
		function validateFaculty(form) {
        	
        	var facId = "^[\\d]{2}[a-zA-Z]{2}[\\d]{4}$";
        	var name = "^[a-zA-Z\\.]*$";
        	var phone = "^[6789]{1}[\\d]{9}$";
        	
        	if (form.registerNo.value.search(facId)==-1) {
        		alert("Invalid RegisterNo");
        		return false;        		
        	}
        	if (form.name.value.search(name)==-1) {
        		alert("Invalid Name");
        		return false;        		
        	}
        	if (form.phone.value.search(phone)==-1) {
        		alert("Invalid phone number");
        		return false;        		
        	}
        	if (!form.phone.email.endsWith("@skcet.ac.in")) {
        		alert("Invalid mail id");
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

        <div id="Content"></div>

        <div id="addFaculty" style="display:none;">
        
        <form action="FacultyUpload" style="margin-left:60%; margin-right: 3%;" method="post" enctype="multipart/form-data">
			<input type="file" accept=".csv" required style="padding: 5px; font-family: verdana; font-size: 15px; border-radius: 10px; height: 40px; border-width: 1px;" name="faculty-file"></input>
			<input type="submit" style="padding: 5px; font-family: verdana; color: white; font-size: 15px; border-radius: 10px; height: 40px; background-color: #fda50f; border-width: 0px;"></input>
		</form><br>

           
            <div style="float: left; margin-right: 100px;">
                <img src="img\img11.jpg" width="500px" height="300px" style="margin-top: 90px;">
            </div>


            <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0; background:  #FFCCBB;">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px;">

                    <b style="color: white;"><font size="5px">Add Faculty</font></b><br>
                    <b style="color: white;">--------------------------</b><br><br>

                    <form action="AddFaculty" method="post" onsubmit="return validateFaculty(this);">

                        <b style="color: white;"> <font size="4px">Faculty ID</font></b>
                        <input name="facultyId" type="text"  required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        <b style="color: white;"> <font size="4px">Name</font></b>
                        <input name="name" type="text" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                         
                        <b style="color: white;"> <font size="4px">Phone</font></b>
                        <input name="phone" type="text" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        <b style="color: white;"> <font size="4px">Email</font></b>
                        <input name="email" type="email" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        
                        <input type="submit" value="ADD FACULTY" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;">


                    </form>

                </div>
               
               

            </div>
           
        </div>


        <div id="addStudent" style="display:none;">
        
        <form action="StudentUpload" style="margin-left:60%; margin-right: 3%;" method="post" enctype="multipart/form-data">
			<input accept=".csv" required style="padding: 5px; font-family: verdana; font-size: 15px; border-radius: 10px; height: 40px; border-width: 1px;" type="file" name="student-file"></input>	
			<input style="padding: 5px; font-family: verdana; color: white; font-size: 15px; border-radius: 10px; height: 40px; background-color: #fda50f; border-width: 0px;" type="submit"></input>
		</form><br>

           
            <div style="float: left; margin-right: 100px;">
                <img src="img\img12.jpg" width="500px" height="300px" style="margin-top: 90px;">
            </div>


            <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0px; background:  #FFCCBB;">

                <div class="studentsadd" style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px;">

                    <b style="color: white;"><font size="5px">Add Student</font></b><br>
                    <b style="color: white;">--------------------------</b><br><br>

                    <form action="AddStudent" method="post" name="student" onsubmit="return validateStudent(this);">

                        <b style="color: white;"> <font size="4px">Register no</font></b>
                        <input name="registerNo" type="text"  required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        <b style="color: white;"> <font size="4px">Name</font></b>
                        <input name="name" type="text"  required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        
                        <b style="color: white;"> <font size="4px">Section</font></b>
                        <select name="section" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">
                                <option>Select</option>
                                <option value="A">Section A</option>
                                <option value="B">Section B</option>
                                <option value="C">Section C</option>
                        </select><br><br>
                        <b style="color: white;"> <font size="4px">Phone</font></b>
                        <input name="phone" type="text" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        
                        <input type="submit" value="ADD STUDENT" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;">


                    </form>

                </div>
               
               

            </div>
           
        </div>
        
        
        <div id="Delete" style="display: none;">
        
        	<div style="float: left; padding: 15px; border-radius: 10px; overflow: hidden; width: 500px; margin-left: 60px; margin-right: 100px;background:  #FFCCBB;">
        	
        		<b style="color: white;"><font size="5px">Delete Faculty</font></b><br>
                <b style="color: white;">-------------------------------</b><br><br>
        		
        		<form action="DeleteFaculty" method="post">
        			<b style="color: white; font-size: 20px;">Faculty Id</b><input style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;" type="text" name="facultyId" required>
        			<br><br><input style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;" type="submit" value="Delete">
        		</form>
        	
        	</div>
        	
        	<div style="padding: 15px; border-radius: 10px; overflow: hidden; width: 500px; margin-top: 10%; background:  #FFCCBB;">
        	
        		<b style="color: white;"><font size="5px">Delete Students</font></b><br>
                <b style="color: white;">------------------------------------</b><br><br>
        		
        		<form action="DeleteStudents" method="post" onsubmit="return validatefromto(this);">
        			<b style="color: white; font-size: 20px;">From</b><input style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;" type="text" name="from" required>
        			<br><br>
        			<b style="color: white; font-size: 20px;">To</b><input style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;" type="text" name="to" required>
        			<br><br>
        			<input type="submit" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;" value="Delete">
        		</form>
        	
        	</div>
        
        </div>




       

        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="#" class="nav__logo">Admin</a>
                    </div>
                    <div class="nav__list">
                        
                        <a href="#" class="nav__link active" onclick="document.getElementById('Content').innerHTML=document.getElementById('addFaculty').innerHTML";>
                            <ion-icon name="person-add-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Add Faculty</span>
                        </a>
                        
                        <a href="#" class="nav__link" onclick="document.getElementById('Content').innerHTML=document.getElementById('addStudent').innerHTML";>
                            <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Add Student</span>
                        </a>
                        
                        <a href="#" class="nav__link" onclick="document.getElementById('Content').innerHTML=document.getElementById('Delete').innerHTML";>
                            <ion-icon name="trash-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Delete</span>
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
        <script type="module" src="https://unpkg.com/ionicons@5.1.2/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule="" src="https://unpkg.com/ionicons@5.1.2/dist/ionicons/ionicons.js"></script>
       
        <!-- ===== MAIN JS ===== -->
        <script src="js/main.js"></script>
        <%
        	String add = request.getParameter("add");
        	if (add != null && add.equals("student")) {
        %>
        <script type="text/javascript">document.getElementById('Content').innerHTML=document.getElementById('addStudent').innerHTML;</script>
        <% } else { %>
        <script type="text/javascript">document.getElementById('Content').innerHTML=document.getElementById('addFaculty').innerHTML;</script>
        <% } %>
        
    </body>
</html>
