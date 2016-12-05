<!DOCTYPE html>
<html lang="en">

<head>
	<title>Doctor's Portal</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="authDoctor.jsp" %>
 <%@include file="navbar.jsp" %>



<div class="container text-center">
  <div class="row content">
  <p>&nbsp;</p><h1>Doctor's Portal</h1><p>&nbsp;</p>
  
   <a href="orderhistory.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/orderhistory.png" class="img-responsive" alt="orderhistory" style="height: 200px;">
   <h2>Order Histories</h2>
   </div>
   </a>
   
    <a href="addorgan.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/add.png" class="img-responsive" alt="addorgan" style="height: 200px;">
   <h2>Add Organ</h2>
   </div>
   </a>
	
	<a href="editdeleteorgan.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/delete.png" class="img-responsive" alt="updatedeleteorgan" style="height: 200px;">
   <h2>Update/Delete Organ</h2>
   </div>
   </a>
   
  </div>
  
  <div class="row content" style="margin-top:-38px;">
  
   
   <a href="viewinventory.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/inventory.png" class="img-responsive" alt="viewwarehouseinventory" style="height: 200px;">
   <h2>View Inventory</h2>
   </div>
   </a>
   
   <a href="salesreport.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/salesreport.png" class="img-responsive" alt="viewsalesreports" style="height: 200px;">
   <h2>View Sales Reports</h2>
   </div>
   </a>
   
    <a href="editprofile.jsp">
   <div class="col-sm-4" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/editprofile.png" class="img-responsive" alt="editprofile" style="height: 200px;">
   <h2>Edit Profile</h2>
   </div>
   </a>
   
  </div>
  
 
</div>



<%@include file="footer.jsp" %>

</body>

</html>