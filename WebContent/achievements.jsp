<%@page import="java.util.ArrayList"%>
<%@page import="com.skcetstudentsupport.service.AchievementDao"%>
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
		
		String regNo = (String)session.getAttribute("user_id");
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SSS - Achievements</title>

<!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
       <script type="text/javascript">
       function deleteAchievement(achievementId) {
    		
    		var xhttp = new XMLHttpRequest();
    		xhttp.onreadystatechange = function() {
    			
    			if (this.readyState == 4) {
    				location.reload();
    			}
    			
    		}
    		xhttp.open("POST","DeleteAchievement", true);
    		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    		xhttp.send("delete_id=" + achievementId);
    		
    	}
       
       if(!!window.performance && window.performance.navigation.type === 2)
		{
		    window.location.reload();
		}
		function update(val)
		{
			document.getElementById("updateForm").style.display = 'block';
			document.getElementById("updateForm").scrollIntoView();
			var type=["Workshop","Paper Presentation","Hackathon","Internship","Culturals","Sports"];
			var award=["1st Prize","2nd Prize","3rd Prize","Participation"];
			var Row=document.getElementById(val);
			var Cells = Row.getElementsByTagName("td");

			document.getElementById("update_id").value =val;
			if(type.includes(Cells[1].innerHTML))
			{
				document.getElementById("type").value =Cells[1].innerHTML;
				document.getElementById('Other').style.display='none';
			}
			else
			{
				document.getElementById("type").value ="Others";
				document.getElementById('Other').style.display='block';
				document.getElementById("Other").value =Cells[1].innerHTML;
			}
			document.getElementById("host").value=Cells[2].innerHTML;
			document.getElementById("date").value=Cells[3].innerHTML;
			if(award.includes(Cells[4].innerHTML))
			{
					document.getElementById("awards").value =Cells[4].innerHTML;
					document.getElementById('OtherAward').style.display='none';
			}
			else
			{
				document.getElementById("awards").value ="Others";
				document.getElementById('OtherAward').style.display='block';
				document.getElementById("OtherAward").value =Cells[4].innerHTML;
			}
			document.getElementById("description").value=Cells[5].innerHTML;
			document.getElementById("certificate").value=Cells[6].getElementsByTagName("a")[0].getAttribute("href");
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
<body id="body-pd">

	<!-- div id="Content">
	
	</div-->
	
	<button style="border-radius: 10px;width: 200px;height: 40px; background-color: #fda50f; border-width: 0px; margin-left:75%; margin-right: 2%; display:inline-block;">
	<font style="font-family: verdana;color: white;font-size: 15px;">
	<a href="add-achievement.jsp" style="text-decoration: none; color: white;">+ Add Achievement</a>
	</font>
	</button>
	
	<div style="margin-top: 5%;">
	
	<%
			AchievementDao obj=new AchievementDao();   	      
		
			ArrayList<ArrayList<String>> a=obj.getData(regNo);
			%>
			<table>
		             <tr> 
		                <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> S.No </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> Type</center> </td>
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>  Hosted/Conducted By</center>  </td> 
		                <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Date</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Awards</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> Description</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Certification Link</center> </td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Update </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Delete </center></td>
		            </tr>	
		     <%
		    for(int i=0;i<a.size();i++)
		    {
		    	%>
		    	 <tr id=<%=a.get(i).get(0)%>> <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> <%=i+1 %> </td> 
	            <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=a.get(i).get(1)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=a.get(i).get(2)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=a.get(i).get(3)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=a.get(i).get(4)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=a.get(i).get(5)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> <a href="<%=a.get(i).get(6)%>" target="_blank" ><%=a.get(i).get(6)%></a></td>
		
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> <button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='update("<%=a.get(i).get(0)%>")' >Update</button> 
				</td>
				
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
					<button onclick="deleteAchievement(<%=a.get(i).get(0) %>)" style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;">Delete</button>
				</td>	            
	            
	            </tr>
		   <%
		    
		    }
		     
	   %>
	   </table>
	   
	   </div>
	   
	   <div id="updateForm" style="display:none; border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0px; background:  #4DC9FF">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px">

                    <b style="color: white"><font size="5px">Update Achievements</b><br></font>
                    <b style="color: white">--------------------------</b><br><br>

                    <form action="UpdateAchievement" method="post" onsubmit="return validate(this);">

                        <b style="color: white"> <font size="4px">Type of Achievement : </font></b>      
                       
                        <select required name="Type" id="type" onchange='checkvalue(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                                <option value="">Select</option>
                                <option value="Workshop">Workshop</option>
                                <option value="Paper Presentation">Paper Presentation</option>
                                <option value="Hackathon">Hackathon</option>
                                <option value="Internship">Internship</option>
                                <option value="Culturals">Culturals</option>
                                <option value="Sports">Sports</option>
                                <option value="Others">Others</option>
                        </select>
						</select><input type="text" required name="update_id" id="update_id" style='display:none'/>
                        <input type="text" name="Other" id="Other" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 50px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display: none;margin-right: 25px" />

                       
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Hosted/Conducted by : </font></b>
                        <input name="Host" required id="host" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                        <br><br><br>  
                        <b style="color: white"> <font size="4px">Date : </font></b>
                        <input name="Date" required id="date" type="date" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">    
                        <br><br><br>  

                        <b style="color: white"> <font size="4px">Awards : </font></b>    
                        <select required name="Awards" id="awards" onchange='checkAward(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
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
                        <input name="certificate" required id="certificate" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">    
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Description about Achievement(Optional)</font></b>
                        <br><br>
                        <textarea name="Description" id="description" rows="5" cols="30" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px"></textarea>
                        <br><br>
                        <input name="submit" type="submit" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff">
                    </form>
                </div>
            </div>

	
	<div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="#" class="nav__logo">Student</a>
                    </div>
                    <div class="nav__list">
                        
                        <a href="student-dashboard.jsp" class="nav__link">
                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Dashboard</span>
                        </a>
                        
                        <a href="individualcgpa.jsp" class="nav__link">
                            <ion-icon name="school-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">CGPA</span>
                        </a>

                        <a href="achievements.jsp" class="nav__link active">
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
