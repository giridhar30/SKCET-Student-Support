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
		<meta charset="ISO-8859-1">
		<title>SSS - CGPA</title>
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
						document.getElementById("cgpa1").innerHTML="0.0";
					}
		        }
				var path="Cgpa?semester="+val;

		        ob.open("POST",path,true);
		        ob.send();
		        return true;
			}
			function emptyalert()
			{
				confirm("Choose grades for all subjects");
			}
			var totalsum = 0.0;
			function getCgpa() {
				
				var a=["one","two","three","four","five","six","seven","eight"];
				var b=["onecredit","twocredit","threecredit","fourcredit","fivecredit","sixcredit","sevencredit","eightcredit"];
				var c=new Array(8);//student grade
				var d=new Array(8);//alotted credits
				var flag=0;
				for(i=0;i<8;i++)
			{
				if(document.getElementById(a[i])!=null)
				{ c[i]=document.getElementById(a[i]).value;
				  d[i]=document.getElementById(b[i]).innerHTML;
				  if(c[i]=="select")
					  flag=1;
				  console.log(c[i]);
				}
			}
				if(flag==1)
					emptyalert();
		
				
				var total=0,sumofcredits=0;
				for(i=0;i<c.length;i++)
					{
					  if(c[i]=='O')
						  total+=10*parseFloat(d[i]);
					  else if(c[i]=='A+')
						  total+=9*parseFloat(d[i]);
					  else if(c[i]=='A')
						  total+=8*parseFloat(d[i]);
					  else if(c[i]=='B+')
						  total+=7*parseFloat(d[i]);
					  else if(c[i]=='B')
						  total+=6*parseFloat(d[i]);
					  else if(c[i]=='RA')
						  total+=0*parseFloat(d[i]);
					  else
						  break;
					  sumofcredits+=parseFloat(d[i]);
					  
				
					}
				
			    totalsum=total/sumofcredits;
				
				if(flag==0)
					document.getElementById("cgpa1").innerHTML=totalsum.toFixed(2);
				    
			}
				function popup() 
				{
					  var flag=0;
					  var txt;
					  if (confirm("Do you want to save your CGPA?") && document.getElementById("semester").value.length == 1 && (totalsum != 0 || !totalsum.isNaN()))
					  { 
					    txt = "Your CGPA is saved!";
					    flag=1;
					  } 
					  else {
					    txt = "CGPA not saved!";
					  }
					  document.getElementById("save").innerHTML = txt;
					 // console.log(flag);
					  if(flag==1)
						  {
						 // alert("yes");
						   var ob=new XMLHttpRequest();
						   var path="StoreCgpa";
						   console.log(document.getElementById("semester").value);
						   ob.open("POST",path,true);
						   ob.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
						   ob.send("totalsum_sem="+totalsum+"?"+document.getElementById("semester").value);
						   location.replace("individualcgpa.jsp");
						   console.log(totalsum);
						  }
					}
				
			
			
			
			function getGraph() {
				
				var ob=new XMLHttpRequest();
		        
				ob.onreadystatechange=function draw() {
			        /* Accepting and seperating comma seperated values */
			        var values =ob.responseText.split(",");
			        
			        var canvas = document.getElementById('myCanvas');
			        var ctx = canvas.getContext('2d');

			        var width = 40; //bar width
			        var X = 50; // first bar position 
			        var base = 200;
			        
			        for (var i =0; i<values.length; i++) {
			            ctx.fillStyle = '#008080'; 
			            var h = values[i];
			            ctx.fillRect(X,canvas.height - h,width,h);
			            
			            X +=  width+15;
			            /* text to display Bar number */
			            ctx.fillStyle = '#4da6ff';
			            ctx.fillText(values[i],X-50,canvas.height - h -10);
			        }
			            /* Text to display scale */
			            ctx.fillStyle = '#000000';
			            ctx.fillText('Scale X : '+canvas.width+' Y : '+canvas.height,800,10);
			  
			    }
				var path="CgpaGraph";
				
				ob.open("GET",path,true);
		        ob.send();
		
		        return true;
			}
		</script>
	</head>
	<body>
		<form name="cgpa" action="" method="post">
		<b style="color: 	##0a0a0a;margin-left: 200px;margin-top: 20px;"> <font size="5px">Semester : </font></b>
		<select name="semester" id="semester" onchange="getSubject(this.value)" style="border-radius: 5px ;height: 40px;border-width: 0px; margin-left: 10px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;">
				<option value="">Select</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select>
			<br><br>
			<div id="credits"></div>
			<br><br> 
			<div style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 350px; width: 100px;background: #38b6ff;margin-top: 20px;color: #ffffff;">
			
			<label id="cgpa1" style=" margin-left: 50px;color: #ffffff;margin-top: 50px;"></label>
			</div>
			<br>
			<label id="save" style=" margin-left: 330px;margin-top: 50px;"></label>
		</form><br><br>
		<br><br>
		<button onclick="getCgpa()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 120px; width: 200px;background: #38b6ff;margin-top: 20px;color: #ffffff;"><b>Calculate</b></button>
		
		<button onclick="popup()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 120px; width: 200px;background: #38b6ff;margin-top: 20px;color: #ffffff;" ><b>Save CGPA</b></button>
		<br><br>
	    
	</body>
</html>