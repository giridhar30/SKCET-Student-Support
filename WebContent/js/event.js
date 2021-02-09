
function getInterestCount(eventId) {
	
	var count = document.getElementById("count"+eventId);
	
	console.log("Working!");
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		
		if (this.readyState == 4) {
			count.innerHTML = this.responseText;
		}
		
	}
	xhttp.open("POST","GetInterestCount", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("id=" + eventId);
	
}

function checkInterest(registerNo, eventId) {
	
	var btn = document.getElementById("interested" + eventId);
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		
		if (this.readyState == 4) {
			if (this.responseText=="true") {
				btn.style.color = "red";
			} else {
				btn.style.color = "white";
			}
			getInterestCount(eventId);
		}
		
	}
	xhttp.open("POST", "CheckInterest", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("registerNo=" + registerNo + "&eventId=" + eventId);
	
}

function updateInterest(registerNo, eventId) {
	
	var btn = document.getElementById("interested" + eventId);
	
	var xhttp = new XMLHttpRequest();
	
	if (btn.style.color == "white") {
		btn.style.color = "red";
	} else {
		btn.style.color = "white";
	}
	
	xhttp.onreadystatechange = function() {
		
		if (this.readyState == 4) {
			getInterestCount(eventId);
		}
		
	}
	
	xhttp.open("POST", "UpdateInterest", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("registerNo=" + registerNo + "&eventId=" + eventId);
	
}

function deleteEvent(eventId) {
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		
		if (this.readyState == 4) {
			location.reload();
		}
		
	}
	xhttp.open("POST","DeleteEvent", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("id=" + eventId);
	
}
