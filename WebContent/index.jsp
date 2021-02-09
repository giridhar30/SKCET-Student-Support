<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	Object loggedIn = session.getAttribute("logged-in");
	
	if (loggedIn != null && (Boolean)loggedIn) {
		if (session.getAttribute("user") instanceof Faculty)
			response.sendRedirect("faculty-dashboard.jsp");
		else
			response.sendRedirect("student-dashboard.jsp");
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SSS - SKCET Student Support</title>
</head>
<body style="margin-top: 0;">

	<h1 style="text-align: center; font-family: sans-serif; font-weight: bold; margin-bottom: 30px; text-decoration: underline; text-decoration-color: red;">SKCET Student Support</h1>

 <div style="float: left;">
        <img src="img\img1.jpg" width="700px" height="500px" style="margin-top: 30px;">
</div>


 

<div style="background-image: url('img\\img2.png'); width: 500px;height: 500px; float: right; margin-right: 130px; margin-top: 10px;">

    <button style="border-radius: 10px;width: 150px;height: 50px; background-color: #38B6ff; margin-top: 200px;border-width: 0px; margin-left: 300px;"><font style="font-family: verdana;color: white;font-size: 20px;"><a href="student-login.jsp" style="text-decoration: none; color: white;">Sign In</a></font></button>

    <button style="border-radius: 10px;width: 150px;height: 50px; background-color: #38B6ff; margin-top: 110px;border-width: 0px; margin-left: 300px;"><font style="font-family: verdana;color: white;font-size: 20px;"><a href="faculty-login.jsp" style="text-decoration: none; color: white;">Sign In</a></font></button>

 
 
</div>




</body>
</html>