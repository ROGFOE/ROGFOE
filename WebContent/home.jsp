<!DOCTYPE html>
<html lang="en">

<head>
	<title>Ramon's Organic Grain Fed Organ Emporium</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>

<%@include file="navbar.jsp" %>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/0.jpg" alt="Image">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="images/1.png" alt="Image" class="img-responsive">
        <div class="carousel-caption">
                    <h3 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">To Pour Your Hearts Into Our Business Of Selling Human Hearts...</h3>
        </div>
      </div>
      
      <div class="item">
        <img src="images/2.jpg" alt="Image" class="img-responsive">
        <div class="carousel-caption">
                    <h3 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">And Kidneys...</h3>
        </div>
      </div>
      
      <div class="item">
        <img src="images/3.jpg" alt="Image" class="img-responsive">
        <div class="carousel-caption">
                    <h3 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">And Livers...</h3>
        </div>
      </div>
      
      <div class="item">
        <img src="images/4.png" alt="Image" class="img-responsive">
        <div class="carousel-caption">
                    <h3 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">And Whatever Other Organ You May Wish For...</h3>
        </div>
      </div>
      
      <div class="item">
        <img src="images/5.jpg" alt="Image" class="img-responsive">
        <div class="carousel-caption">
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">
  <h3>Featured Products</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="images/heart.jpg" class="img-responsive" style="width:100%; height:300px;" alt="Image">
      <h4>Heart</h4>
    </div>
    <div class="col-sm-4">
      <img src="images/liver.jpg" class="img-responsive" style="width:100%; height:300px;" alt="Image">
      <h4>Liver</h4>
    </div>
    <div class="col-sm-4">
      <img src="images/brain.jpg" class="img-responsive" style="width:100%; height:300px;" alt="Image">
      <h4>Brain</h4>
    </div>
  </div>
</div><br>


<%@include file="footer.jsp" %>

</body>

</html>