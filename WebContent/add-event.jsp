<%@page import="com.skcetstudentsupport.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	Object loggedIn = session.getAttribute("logged-in");
	Object user = session.getAttribute("user");
	
	if (loggedIn == null || !(Boolean)loggedIn || user instanceof Student) {
		response.sendRedirect("index.jsp");
	}

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SSS - Add Event</title>
</head>

<script type="text/javascript">

	function validate(form) {
		var pattern = new RegExp('^(https?:\\/\\/)'+ 
	            '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|'+ 
	            '((\\d{1,3}\\.){3}\\d{1,3}))'+ // 
	            '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+
	            '(\\?[;&amp;a-z\\d%_.~+=-]*)?'+ 
	            '(\\#[-a-z\\d_]*)?$','i');
		if (form.name.value.search("^[a-zA-Z0-9]*$")==-1 
			|| form.organization.value.search("^[a-zA-Z0-9]*$")==-1
			|| !pattern.test(form.link.value)
		) {
			alert("Enter valid credentials!");
			return false;
		}
		
		return true;
	}

</script>

<body>

	<div style="float: left;margin: 100px;"> 
                <img src="img\img13.jpg" width="500px" height="300px" style="margin-top: 90px;">
    </div>


    <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin: 40px; background: #4DC9FF;">

                <div  style="margin: 30px;">

                    <b style="color: white;"><font size="5px">Add Event</font></b><br>
                    <b style="color: white;">--------------------------</b><br><br>

                    <form action="AddEvent" method="post" onsubmit="return validate(this);">

                    	<b style="color: white;"> <font size="4px">Name: </font></b>
                    	<input type="text" name="name" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
						<b style="color: white;"> <font size="4px">Organization: </font></b>
						<input type="text" name="organization" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
						<b style="color: white;"> <font size="4px">Description: </font></b>
						<textarea name="description" rows="5" cols="10" style="border-radius: 5px ;height: 120px;border-width: 0px; margin-left: 10px; width: 330px;"></textarea><br><br>
						<b style="color: white;"> <font size="4px">Date: </font></b>
						<input type="date" name="date" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
						<b style="color: white;"> <font size="4px">Expiry Date: </font></b>
						<input type="date" name="expiry_date" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
						<b style="color: white;"> <font size="4px">Link: </font></b>
						<input type="text" name="link" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
						<input type="submit" value="Add Event" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;">

                        
                        

                    </form>

                </div>
                
                

            </div>




</body>
</html>