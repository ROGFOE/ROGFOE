<!DOCTYPE html>
<html lang="en">

<head>
	<title>Contact Us</title>
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
   <div class="col-sm-3">
   </div>
    <div class="col-sm-6 text-left" style="text-align:center">
    	<p>&nbsp;</p> 
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Contact Us</h1><p>&nbsp;</p>
      
      <form>
      
       <div class="form-group">
   	 <label for="fname">First Name:</label>
    <input type="text" class="form-control" id="fname" placeholder="Bob" required>
  	</div>
  	
  	<div class="form-group">
   	 <label for="lname">Last Name:</label>
    <input type="text" class="form-control" id="lname" placeholder="Ross" required>
  	</div>
      
	 <div class="form-group">
   	 <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email" placeholder="iloveorgans@example.com" required>
  	</div>
  	
  	<div class="form-group">
  <label for="phone">Phone Number:</label>
    <input class="form-control" type="tel" id="phone" placeholder="+9 (999) - 9999" required>
  </div>
  	
  	<div class="form-group">
    <label for="message">Message:</label>
    <textarea class="form-control" id="message" rows="8" required></textarea>
  </div>
  
  <button type="submit" class="btn btn-default">Submit</button>
  
</form>
     <p>&nbsp;</p> 
     
    </div>
	<div class="col-sm-3">
   </div>
  </div>
</div>



<%@include file="footer.jsp" %>

</body>

</html>