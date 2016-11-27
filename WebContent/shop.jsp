<!DOCTYPE html>
<html lang="en">

<head>
	<title>Shop</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<style>
	 /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: white;
      height: 100%;
    }
     @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
	</style>
</head>

<body>

<%@include file="navbar.jsp" %>

  <div class="container text-center">   
   <h1 style="text-align:center;">Shop</h1> 
 
  <div class="row content">
  
    <!-- Side Navbar -->
    <div class="col-sm-2 sidenav">
    	

		<ul class="nav nav-pills nav-stacked">
		<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop By Category
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">Arms</a></li>
    <li><a href="#">Blood</a></li>
    <li><a href="#">Brains</a></li>
    <li><a href="#">Ears</a></li>
    <li><a href="#">Eyeball</a></li>
    <li><a href="#">Hair</a></li>
    <li><a href="#">Heart</a></li>
    <li><a href="#">Intestines</a></li>
    <li><a href="#">Kidney</a></li>
    <li><a href="#">Legs</a></li>
    <li><a href="#">Liver</a></li>
    <li><a href="#">Lungs</a></li>
    <li><a href="#">Nose</a></li>
    <li><a href="#">Skin</a></li>
    <li><a href="#">Teeth</a></li>
    <li><a href="#">Tongue</a></li>
    </ul>
  </li>
    
  	
		
	<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Blood Type
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">A</a></li>
    <li><a href="#">B</a></li>
    <li><a href="#">AB</a></li>
    <li><a href="#">O</a></li>
    </ul>
  </li>
  
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Price
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">Under $10,000</a></li>
    <li><a href="#">$10,000 - $50,000</a></li>
    <li><a href="#">$50,000 - $100,000</a></li>
    <li><a href="#">Above $100,000</a></li>
    </ul>
  </li>
  
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Size
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">X Small</a></li>
    <li><a href="#">Small</a></li>
    <li><a href="#">Medium</a></li>
    <li><a href="#">Large</a></li>
    <li><a href="#">X Large</a></li>
    </ul>
  </li>

		</ul>
    </div>
    
    
    <div class="col-sm-10 text-left"> 

     <!-- List Products -->
     <table>
     
     <tr>
     	<td><img src="images/products/brain.jpeg" alt="Image" class="img-responsive" height="400px" width="400px"> </td>
     	<td><img src="images/products/teeth1.jpg" alt="Image" class="img-responsive" height="400px" width="400px"> </td>
     	<td><img src="images/products/tongue1.jpg" alt="Image" class="img-responsive" height="400px" width="400px"> </td>
     	
     </tr>
     
     
     </table>
     
    </div>
    
    

  </div>
</div>

<%@include file="footer.jsp" %>

</body>

</html>