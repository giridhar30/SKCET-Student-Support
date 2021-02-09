<%@page import="com.skcetstudentsupport.model.Faculty"%>
<%@page import="com.skcetstudentsupport.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%

	
		Object loggedIn = session.getAttribute("logged-in");
		Object user = session.getAttribute("user");
		
		if (loggedIn == null || !(Boolean)loggedIn || user instanceof Faculty) {
			response.sendRedirect("index.jsp");
		}
		Student student = (Student)user;
	

%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SSS - Add Achievement</title>
		
		<script type="text/javascript">
			if(!!window.performance && window.performance.navigation.type === 2)
			{
			    window.location.reload();
			}
			function checkvalue(val)
			{
				if(val=="Others")
					document.getElementById('Other').style.display='block';
				else
					document.getElementById('Other').style.display='none';
			}
			
			function checkAward(val)
			{
				if(val=="Others")
					document.getElementById('OtherAward').style.display='block';
				else
					document.getElementById('OtherAward').style.display='none';
			}
			function validate (form) {
				
				var pattern = new RegExp('^(https?:\\/\\/)'+ 
			            '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|'+ 
			            '((\\d{1,3}\\.){3}\\d{1,3}))'+ // 
			            '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+
			            '(\\?[;&amp;a-z\\d%_.~+=-]*)?'+ 
			            '(\\#[-a-z\\d_]*)?$','i');
				if (!pattern.test(form.certificate.value)) {
					alert("Enter a valid link for certificate!");
					return false;
				}
				return true;
			}
		</script>
		
	</head>
	<body>
	
			<div style="float: left; margin-right: 70px;">
                <img src="img\img12.jpg" width="700px" height="400px" style="margin-top: 90px;">
            </div>
	
	   <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0px; background:  #4DC9FF">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px">

                    <b style="color: white"><font size="5px">Add Achievements</font></b><br>
                    <b style="color: white">-----------------------------------</b><br><br>

                    <form action="AddAchievement" method="post" onsubmit="return validate(this);">

                        <b style="color: white"> <font size="4px">Type of Achievement : </font></b>      
                       
                        <select required name="Type" onchange='checkvalue(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                                <option value="">Select</option>
                                <option value="Workshop">Workshop</option>
                                <option value="Paper Presentation">Paper Presentation</option>
                                <option value="Hackathon">Hackathon</option>
                                <option value="Internship">Internship</option>
                                <option value="Culturals">Culturals</option>
                                <option value="Sports">Sports</option>
                                <option value="Others">Others</option>
                        </select>

                        <input type="text" name="Other" id="Other" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 50px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display: none;margin-right: 25px" />

                       
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Hosted/Conducted by : </font></b>
                        <input name="Host" required type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                        <br><br><br>  
                        <b style="color: white"> <font size="4px">Date : </font></b>
                        <input name="Date" required type="date" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">    
                        <br><br><br>  

                        <b style="color: white"> <font size="4px">Awards : </font></b>    
                        <select name="Awards" required  onchange='checkAward(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                            <option value="">Select</option>
                            <option value="1st Prize">1st Prize</option>
                            <option value="2nd Prize">2nd Prize</option>
                            <option value="3rd Prize">3rd Prize</option>
                            <option value="Participation">Participation</option>
                            <option value="Others">Others</option>
                        </select>
                        <br>
                        <input type="text" name="OtherAward" id="OtherAward" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display:none; margin-right: 145px"/><br><br>  
                        <br>        
                        <b style="color: white"> <font size="4px">Certificate Link</font></b>
                        <input name="certificate" required type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">    
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Description about Achievement(Optional)</font></b>
                        <br><br>
                        <textarea name="Description" rows="5" cols="30" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px"></textarea>
                        <br><br>
                        <input name="submit" type="submit" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff">
                    </form>
                </div>
            </div>
	</body>
</html>