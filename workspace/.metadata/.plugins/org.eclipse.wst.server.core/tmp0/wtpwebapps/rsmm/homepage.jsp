<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RSMM</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/d2465d9ce4.js"
	crossorigin="anonymous"></script>
</head>
<body class="text-monospace">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-server"></i> Remote Server Monitor &
			Management</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="homepage.jsp">Monitor</a></li>
				<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logs.jsp">Logs</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="disks.jsp">Disks</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="processes.jsp">Processes</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="terminal.jsp">Terminal</a></li>
				<li class="nav-item"><a class="nav-link" href="report.jsp">Report</a></li>
			</ul>
			<span class="navbar-text">
				<form class="form-inline" action="Logout">
					<input class="btn btn-danger my-2 my-sm-0" type="submit"
						value="Logout">
				</form>
			</span>
		</div>
	</nav>
	<h1 class="display-4 my-4 mx-5 text-center">
		Host: <span id="hostname"></span>
	</h1>
	<div class="row text-center mx-4">
		<div class="col-sm-4 mb-4 d-flex align-items-stretch w-100">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-circle-info fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title">General Info</h5>
					<p id="general" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
		<div class="col-sm-4 mb-4 d-flex align-items-stretch w-100">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-microchip fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title">CPU Usage</h5>
					<p id="cpu" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
		<div class="col-sm-4 mb-4 d-flex align-items-stretch">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-memory fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title ">RAM Usage</h5>
					<p id="ram" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
		<div class="col-sm-4 mb-4 d-flex align-items-stretch">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-hard-drive fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title">Disk Usage</h5>
					<p id="disk" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
		<div class="col-sm-4 mb-4 d-flex align-items-stretch">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-mug-hot fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title">Uptime</h5>
					<p id="uptime" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
		<div class="col-sm-4 mb-4 d-flex align-items-stretch">
			<div class="card w-100">
				<div class="card-header py-5 h-100 justify-content-center"
					style="align-items: center; display: flex;">
					<i class="fa-solid fa-box-archive fa-5x"></i>
				</div>
				<div class="card-body">
					<h5 class="card-title">Number of packages</h5>
					<p id="packages" class="card-text pb-5"></p>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script>
		initialize = (route, output) => {
		    websocket = new WebSocket("ws://<%out.print(session.getAttribute("hostname"));%>:8080/rsmm/" + route);
        	output = document.getElementById(route);
		    writeToScreen = (output, message) => {
		        output.innerHTML = message;
		    }
		    websocket.onopen = (evt) => {
		    	websocket.send('Hello server!');
		    };
		    websocket.onmessage = (evt) => {
		        writeToScreen(output, evt.data);
		    };
		    websocket.onerror = (evt) => {
		        writeToScreen(output, 'ERROR: ' + evt.data);
		    };
		}

		window.onload = () => {
			initialize("hostname");
			setTimeout(() => {
				initialize("general");
				setTimeout(() => {
					initialize("packages");
			    	setTimeout(() => {
			    		initialize("cpu");
				    	setTimeout(() => {
			    			initialize( "ram");
					    	setTimeout(() => {
				    			initialize( "disk");
						    	setTimeout(() => {
						    		initialize( "uptime");
							    }, 300);
						    }, 300);
					    }, 300);
				    }, 300);
			    }, 300);
			}, 300);
		};
	</script>
</body>
</html>
