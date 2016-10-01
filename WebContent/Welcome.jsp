<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hello - JSP Tutorial</title>
	<%@ taglib uri="http://bootstrapjsp.org/" prefix="b" %>
</head>
<body>
	<h1>If you can see this page, you have set up everything correctly!</h1>
	
	<!-- Where all the magic happens -->
<!-- LOGIN FORM -->
<div class="text-center">
	<!-- Main Form -->
	<div class="login-form-1">
		<form id="login-form" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="lg_username" class="sr-only">Username</label>
						<input type="text" class="form-control" id="lg_username" name="lg_username" placeholder="username">
					</div>
					<div class="form-group">
						<label for="lg_password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="lg_password" name="lg_password" placeholder="password">
					</div>
				</div>
				<button class="btn btn-success">
    				<span class="glyphicon glypicon-ok"></span> Login
				</button>
			</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div>
</body>
</html>