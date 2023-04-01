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
				<li class="nav-item"><a class="nav-link" href="homepage.jsp">Monitor</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logs.jsp">Logs</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="disks.jsp">Disks</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="processes.jsp">Processes</a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="terminal.jsp">Terminal</a></li>
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
	<div class="vh-100">
		<div class="card mx-auto mt-5" style="height: 80%; width: 80%;">
			<div class="card-header">
				<nav class="navbar navbar-light bg-light p-0">
					<div class="navbar-brand">
						<i class="fa-solid fa-terminal"></i> Terminal
					</div>
					<button type="button" class="btn btn-outline-danger float-right"
						onclick="killCmd();">Kill</button>
				</nav>
			</div>
			<div id="terminal" class="card-body" style="overflow-y: auto">
				<h1 class="h4 text-muted">Welcome, type some command below to continue...</h1>
			</div>
			<div class="card-footer">
				<div class="input-group my-2">
					<div class="input-group-append">
						<span class="input-group-text">$</span>
					</div>
					<input type="text" class="form-control"
						placeholder="Enter some command..." id="cmd">
					<div class="input-group-append">
						<input class="btn btn-outline-primary" type="button"
							value="Execute" onclick="executeCommand();">
					</div>
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
		initialize = (route) => {
			websocket = new WebSocket("ws://<%out.print(session.getAttribute("hostname"));%>:8080/rsmm/" + route);
        	output = document.getElementById(route);
		    writeToScreen = (output, message) => {
		    	pre = document.createElement("p");
		    	pre.classList.add("py-0");
		    	pre.classList.add("my-0");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                output.appendChild(pre);
                output.scrollTop = output.scrollHeight;
		    }
		    websocket.onopen = (evt) => {
		    	websocket.send("Hello server!");
		    };
		    websocket.onmessage = (evt) => {
		        writeToScreen(output, evt.data);
		    };
		    websocket.onerror = (evt) => {
		        writeToScreen(output, 'ERROR: ' + evt.data);
		    };
		}
		
		killCmd = () => {
			websocket.close();
			initialize("terminal");
			setTimeout(() => {
				writeToScreen(output, "Killed!");
			}, 300);
		}

		executeCommand = () => {
			if(document.getElementById("cmd").value) {
				websocket.send(document.getElementById("cmd").value);
			}
			document.getElementById("cmd").value = "";
		}
		
		document.getElementById("cmd").addEventListener("keypress", function(event) {
			if (event.key === "Enter") {
				executeCommand();
			}
		});
		
		let keysPressed = {};
		document.addEventListener('keydown', (event) => {
		   keysPressed[event.key] = true;
		});
		document.addEventListener('keyup', (event) => {
		    delete this.keysPressed[event.key];
		 });
		document.addEventListener('keydown', (event) => {
		   keysPressed[event.key] = true;
		   if (keysPressed['Control'] && event.key == 'c') {
		       killCmd();
		   }
		});
		document.addEventListener('keyup', (event) => {
		   delete keysPressed[event.key];
		});
				
		window.onload = () => {
		    initialize("terminal");
		};
	</script>
</body>
</html>
