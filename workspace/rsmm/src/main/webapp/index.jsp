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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-server"></i> Remote Server Monitor &
			Management</a>
	</nav>
	<section class="vh-100">
		<div class="container h-100">
			<div
				class="row h-100 d-flex justify-content-center align-items-center">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem">
						<div class="row g-0">
							<div
								class="col-md-6 col-lg-5 d-flex align-items-center justify-content-center">
								<img
									src="https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=826&t=st=1679038466~exp=1679039066~hmac=e9bf28677f56d65d860a2e45253a9f1c76a79f243850e1e2eada3622fc2dc64f"
									alt="login form" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem">
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">
									<form action="Login" method="post">
										<div class="d-flex align-items-center">
											<span class="h1 fw-bold"><i class="fa-solid fa-server"></i>
												RSMM</span>
										</div>
										<h5 class="fw-normal mb-1 pb-4" style="letter-spacing: 1px">Login
											to your server</h5>
										<div class="form-outline mb-1">
											<input type="text" id="form2Example17"
												class="form-control form-control-lg" placeholder="127.0.0.1"
												name="hostname" required><label class="form-label"
												for="form2Example17">Hostname / IP</label>
										</div>
										<div class="form-outline mb-1">
											<input type="text" id="form2Example17"
												class="form-control form-control-lg" value="22" name="port"
												required><label class="form-label"
												for="form2Example17">Port Number</label>
										</div>
										<div class="form-outline mb-1">
											<input type="text" id="form2Example17"
												class="form-control form-control-lg" name="uname" required><label
												class="form-label" for="form2Example17">Username</label>
										</div>
										<div class="form-outline mb-1">
											<input type="password" id="form2Example27"
												class="form-control form-control-lg" name="pass" required><label
												class="form-label" for="form2Example27">Password</label>
										</div>
										<%
										String message = request.getParameter("cred");
										if ("invalid".equals(message)) {
											out.println("<div class='alert alert-danger mt-3'>Invalid username or password, please try again!</div>");
										}
										%>
										<div class="pt-4 mb-4">
											<input class="btn btn-primary btn-lg btn-block" type="submit"
												value="Login">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>
