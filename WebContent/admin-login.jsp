<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	Object adminLoggedIn = session.getAttribute("admin-logged-in");

	if (session.getAttribute("logged-in") != null || (adminLoggedIn != null && (Boolean)adminLoggedIn))
		response.sendRedirect("admin-dashboard.jsp");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SSS - Admin Login</title>

<script type="text/javascript">
	function validate() {
		
		if (!document.forms[0].email.value.endsWith("@skcet.ac.in")) {
			alert("Invalid mail Id!");
			admin_login.email.focus();
			return false;
		}
		else {
			return true;
		}
		
	}
</script>

</head>
<body>



	<h2 align="center" style="margin: 0 0;"><b style="background-color: red; color: white; font-family: monospace;"><% String s = request.getParameter("err"); if (s!=null && s.equals("wrong_credentials")) out.print("Incorrect credentials! Please try again!"); %></b></h2>

	<div style="float: left;">
        <img src="img/img3.jpg" width="600px" height="600px" style="margin-top: 30px; margin-left: 50px;">
</div>


<div style="background-image: url('img//img6.png'); width: 500px;height: 500px; float: right; margin-right: 160px; margin-top: 15px; ">
	


	<form action="AdminLogin" method="post" name="admin_login" onsubmit="return validate();">
		<input name="email" type="email" style="margin-top: 220px;margin-left: 220px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 200px; height: 40px;" required><br><br>
		<input name="password" type="password"  style="margin-top: 80px;margin-left: 130px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 280px; height: 40px;" required><br><br>
		<input type="submit" value="LOGIN" style="border-radius: 10px;width: 150px;height: 50px; background-color: #38B6ff; margin-top: 60px;border-width: 0px; margin-left: 200px; font-family: verdana; font-style: bold;">
	</form>

	
</div>

</body>
</html>