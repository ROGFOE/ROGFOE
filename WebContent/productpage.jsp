<!DOCTYPE html>
<html lang="en">

<head>
<title>Product Page</title>
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

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">

	<%@include file="navbar.jsp"%>
	
	<div id="wrap" style="min-height: 100%;">
  <div id="main" class="container clear-top" style="padding-bottom:150px;">

	<div class="container text-center">
	<h1>Brain</h1>
		<div class="col-sm-3"></div>
		
	</div>

	<hr>


	<div class="container" id="product-section">
		<div class="row">
			<div class="col-md-6">
				<p>&nbsp;</p>
				<img src="images/products/brain.jpeg" alt="Image"
					class="img-responsive" height="400px" width="400px">
			</div>
			
			<div class="col-md-6">

				<div class="row">
					

					<div class="row">
						<div class="col-md-12">
						<p>&nbsp;</p>
							<span class="monospaced" >ID: 1960140180</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="description" style="padding-top: 8px;">The brain is an organ that serves as
								the center of the nervous system in all vertebrate and most
								invertebrate animals.</p>
						</div>
					</div>
				</div>

			<div class="form-group">
  			<label for="sel1">Blood Type:</label>
  			<select class="form-control" id="sel1" style="width:30%" >
   			<option value="" selected disabled>Select One</option>
   			 <option>A</option>
   			 <option>B</option>
    		 <option>AB</option>
  			  <option>O</option>
		      </select>
			</div>
			
			<div class="form-group">
  			<label for="sel2">Size:</label>
  			<select class="form-control" id="sel2" style="width:30%">
  			<option value="" selected disabled>Select One</option>
   			 <option>X Small</option>
   			 <option>Small</option>
    		 <option>Medium</option>
  			  <option>Large</option>
  			  <option>X Large</option>
		      </select>
			</div>
			
			<label for="qty">Quantity:</label>
			 <div class="input-group spinner" style="width:100px;">
    <input type="text" class="form-control" value="1" style="text-align: right;">
    <div class="input-group-btn-vertical" style="position: relative; white-space: nowrap; width: 1%; vertical-align: middle; display: table-cell;">
      
      <button class="btn btn-default" type="button" style="display: block; float: none; width: 100%; max-width: 100%; padding: 8px; margin-left: -1px; position: relative; border-radius: 0; border-top-right-radius: 4px;">
  <i class="glyphicon glyphicon-triangle-top" style="position: absolute; top: 2px; left: 3px; font-size:70%;"></i></button>
     
      <button class="btn btn-default" type="button" style="display: block; float: none; width: 100%; max-width: 100%; padding: 8px; margin-left: -1px; position: relative; border-radius: 0; margin-top: -1px; border-bottom-right-radius: 4px;">
  <i class="glyphicon glyphicon-triangle-bottom" style="position: absolute; top: 2px; left: 3px; font-size:70%;"></i></button>
    </div>
  </div>

<p>&nbsp;</p>
<button type="button" class="btn btn-primary">Add to Cart</button>

			</div>

			
			


		</div>

		<div class="col-sm-3"></div>

	</div>

</div>
</div>

	<%@include file="footer.jsp"%>
	
	<!-- script for quantity -->
	<script>
	(function ($) {
		$('.spinner .btn:first-of-type').on('click', function() {
		    $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
		  });
		  
		  $('.spinner .btn:last-of-type').on('click', function() {
		    $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1); 
		  });
		  window.alert(x); 
		})(jQuery);
	</script>
</body>

</html>