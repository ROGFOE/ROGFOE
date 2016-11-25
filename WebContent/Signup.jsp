<!DOCTYPE html>
<html lang="en">

<head>
	<title>About Us</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>

<%@include file="navbar.jsp" %>

<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Sign Up</h1><p>&nbsp;</p>
      <img src="images/shop3.jpg" alt="Image" class="img-responsive">
      
      <div class="row">
				<form>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input type="text" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>Address</label>
							<textarea placeholder="Enter Address Here.." rows="3" class="form-control"></textarea>
						</div>	
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
								<input type="text" placeholder="Enter City Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>State</label>
								<input type="text" placeholder="Enter State Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Zip</label>
								<input type="text" placeholder="Enter Zip Code Here.." class="form-control">
							</div>		
						</div>
						
						<div class="row">
							
							
											
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text" placeholder="Enter Phone Number Here.." class="form-control">
					</div>		
					<div class="form-group">
						<label>Email Address</label>
						<input type="text" placeholder="Enter Email Address Here.." class="form-control">
					</div>	
					 <div class="col-sm-6 form-group">
								<label>Password</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Password Confirmation</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control">
							</div>
							
							</div>	
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">				
					</div>
				</form> 
				</div>
      
    
      <hr>
      
    </div>
	<div class="col-sm-2">
   </div>
  </div>
</div>



<%@include file="footer.jsp" %>

</body>

</html>