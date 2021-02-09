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
<title>SSS - Add Credits</title>

<script type="text/javascript">
	function getSubject(val) {
		if(val=="")
				return ;
		var ob=new XMLHttpRequest();
		ob.onreadystatechange=function ss()
	    {
			if(ob.readyState==4)
			{
				document.getElementById("credits").innerHTML=ob.responseText;
			}
	    }
		var path="GetCreditPoints?semester="+val;
	
	    ob.open("POST",path,true);
	    ob.send();
	    return true;
	}
	
	function deleteCreditPoint(subcode, dept) {
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			
			if (this.readyState == 4) {
				location.reload();
			}
			
		}
		xhttp.open("POST","DeleteCreditPoint", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("subcode=" + subcode + "&dept=" + dept);
		
	}
	
	function validate(form) {
		if (form.credits.value.search("^[\\d]*\\.[\\d]$")==-1 || forms.subjectCode.value.search("^[\\da-zA-Z]*$")==-1 || forms.subject.value.search("^[a-zA-Z]*$")==-1 ) {
			alert("Invalid fields");
			return false;
		}
		return true;
	}
	
</script>

</head>
<body>

<button style="font-family: verdana; color: white; font-size: 15px; border-radius: 10px;width: 200px;height: 40px; background-color: #fda50f; border-width: 0px; margin:2% 0 0 20%; ">
		<a href="individualcgpa.jsp" style="text-decoration: none; color: white;">Go back</a>
	</button>
	
	<br>

<div style="display: inline-block; margin-top: 10%; margin-left: 3%;" id="credits"> 
    
</div>


    <div style="float: right; border-radius: 10px; overflow: hidden; width: 450px; margin-right: 3%; margin-top: 7%; background:  #FFCCBB;">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px;">

                    <b style="color: white;"><font size="5px">Add Credit Point</font></b><br>
                    <b style="color: white;">----------------------------------</b><br><br>

                    <form action="AddCreditPoint" method="post" onsubmit="return validate(this);">
						
						<b style="color: white;"> <font size="4px">Semester</font></b>
                        <select required name="semester" onchange='getSubject(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">
                                <option value="">Select</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                        </select><br><br>
                        
                        <b style="color: white;"> <font size="4px">Subject Code</font></b>
                        <input name="subjectCode" type="text"  required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        
                        <b style="color: white;"> <font size="4px">Subject</font></b>
                        <input name="subject" type="text"  required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                                                
                        <b style="color: white;"> <font size="4px">Credits</font></b>
                        <input name="credits" type="text" required style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"><br><br>
                        
                        <input type="submit" value="ADD CREDITS" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;">


                    </form>

                </div>
                
                

            </div>


</body>
</html>