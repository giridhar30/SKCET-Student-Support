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
<title>SSS - Faculty Sign-in</title>
</head>
<body>

<h2 align="center" style="margin: 0 0;"><b style="background-color: red; color: white; font-family: monospace;"><% String s = request.getParameter("err"); if (s!=null && s.equals("wrong_credentials")) out.print("Incorrect credentials! Please try again!"); %></b></h2>

<div style="float: left;">
        <img src="img\img7.jpg" width="600px" height="600px" style="margin-top: 30px; margin-left: 50px;">
</div>


<div style="background-image: url('img\\img8.png'); width: 500px;height: 500px; float: right; margin-right: 160px; margin-top: 15px; ">


<form action="FacultyLogin" method="post">
<input name="facultyId" type="text" placeholder="Faculty Id" required style="margin-top: 220px;margin-left: 220px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 200px; height: 40px;"><br><br>
<input name="password" type="password" placeholder="Password" required style="margin-top: 80px;margin-left: 130px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 280px; height: 40px;"><br><br>
<input type="submit" value="SIGN-IN" style="border-radius: 10px;width: 150px;height: 50px; background-color: #38B6ff; margin-top: 60px;border-width: 0px; margin-left: 200px; font-family: verdana; font-style: bold;">
</form>

</div>



</body>
</html>