<!DOCTYPE html>
<html lang="en">

<head>
<title>About Us</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>

	<%@include file="navbar.jsp"%>

	<div class="container text-center">
		<div class="row content">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 text-left" style="text-align: center">
				<h1
					style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Login</h1>
				<p>&nbsp;</p>
				<img src="images/logo.png" width=40% height=40%  alt="Image" class="img-responsive" style="margin-left: auto;
    margin-right: auto; display:block"> 
				<fieldset>
					<div class="form-group">
						<label>Email Address</label> <input type="text"
							placeholder="Email Address.." class="form-control" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							placeholder="Password.." class="form-control" required>
					</div>
					<label> <input name="remember" type="checkbox"
						value="Remember Me"> Remember Me
					</label> <input class="btn btn-lg btn-primary btn-block" type="submit"
						value="Login">


					<div class="form-group">

						<div class="col-md-12 control">
							<div style="padding-top: 15px; font-size: 90%">
								Don't have an account! <a href="Signup.jsp"
									onClick="$('#loginbox').hide(); $('#signupbox').show()">
									Sign Up Here </a>


							</div>
							<a href="#" class="forgot-password"> Forgot your password? </a>
						</div>
					</div>
				</fieldset>

				<hr>

			</div>

			<div class="col-sm-3"></div>
		</div>
	</div>



	<%@include file="footer.jsp"%>

</body>

</html>