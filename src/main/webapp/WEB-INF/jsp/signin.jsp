<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif">
<title>Yours Signin</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="resources/css/signin.css" rel="stylesheet" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<h1>Yours</h1>
					<p>Food Service for your.</p>
				</div>
			</div>
			<form class="form-signin" method="POST" action="j_spring_security_check">
				<h2 class="form-signin-heading">Please sign in</h2>
				<input class="form-control" path="username" name="j_username" placeholder="Email address" autofocus="" />
				<input class="form-control" path="password" name="j_password" placeholder="Password" />
				<label class="checkbox"> 
					<input type="checkbox" value="remember-me">Remember me</input> 
				</label>
				not registered? <a href="register-user">register</a>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			</form>
		</div>
		<!-- /container -->
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
