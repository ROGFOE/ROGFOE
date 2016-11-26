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

<body>

	<%@include file="navbar.jsp"%>

	<div class="container text-center">

		<div class="col-sm-3"></div>

		<h1
			style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Product
			page</h1>
	</div>


	<hr>


	<div class="container" id="product-section">
		<div class="row">
			<div class="col-md-6">
				<img src="images/products/brain.jpeg" alt="Image"
					class="img-responsive" height="400px" width="400px">
			</div>
			<div class="col-md-6">

				<div class="row">
					<div class="col-md-12">
						<h1>Brain</h1>
					</div>

					<div class="row">
						<div class="col-md-12">
							<span class="label label-primary">NEW</span> <span
								class="monospaced">No. 1960140180</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="description">The brain is an organ that serves as
								the center of the nervous system in all vertebrate and most
								invertebrate animals.</p>
						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-md-12 bottom-rule">
						<h2 class="product-price">$120,000.00</h2>
					</div>
					
					
				</div>


			</div>


			<div class="row add-to-cart">
				<div class="col-md-4 product-qty">
					<span class="btn btn-default btn-lg btn-qty"> <span
						class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</span> <input class="btn btn-default btn-lg btn-qty" value="1" /> <span
						class="btn btn-default btn-lg btn-qty"> <span
						class="glyphicon glyphicon-minus" aria-hidden="true"></span>
					</span>
				</div>
				
				<div class="col-md-5">
					<button class="btn btn-lg btn-brand btn-full-width">Add to
						Cart</button>
				</div>
			</div>


		</div>

		<div class="col-sm-3"></div>

	</div>


	<%@include file="footer.jsp"%>
</body>

</html>