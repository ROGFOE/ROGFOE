<!DOCTYPE html>
<html lang="en">

<head>
	<title>Administrator's Portal</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">

<%@include file="navbar.jsp" %>
<%@include file="auth.jsp" %>

<div class="container text-center">
  <div class="row content">
  <p>&nbsp;</p><h1>Administrator's Portal</h1><p>&nbsp;</p>
  
   <a href="/">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/orderhistory.png" class="img-responsive" alt="orderhistory" style="height: 200px;">
   <h3>Order Histories</h3>
   </div>
   </a>
   
    <a href="addorgan.jsp">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/add.png" class="img-responsive" alt="addorgan" style="height: 200px;">
   <h3>Add Organ</h3>
   </div>
   </a>
	
	<a href="/">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/delete.png" class="img-responsive" alt="updatedeleteorgan" style="height: 200px;">
   <h3>Update/Delete Organ</h3>
   </div>
   </a>
   
   <a href="viewinventory.jsp">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/inventory.png" class="img-responsive" alt="viewwarehouseinventory" style="height: 200px;">
   <h3>View Inventory</h3>
   </div>
   </a>
 
  </div>
  
  <div class="row content" style="margin-top:-43px;">
  
   
   <a href="/">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/salesreport.png" class="img-responsive" alt="viewsalesreports" style="height: 200px;">
   <h3>View Sales Reports</h3>

   </div>
   </a>
   
    <a href="addremovedoctor.jsp">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/doctor.png" class="img-responsive" alt="addremovedoctor" style="height: 200px;">
   <h3>Add/Remove Doctor</h3>
   </div>
   </a>
   
   <a href="addremovewarehouse.jsp">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/addremovewarehouse.png" class="img-responsive" alt="addremovewarehouse" style="height: 200px;">
   <h3 style="margin-top:-6px;">Add/Remove Warehouse</h3>
   </div>
   </a>
   
    <a href="/">
   <div class="col-sm-3" style="border: solid black 1px;">
   <p>&nbsp;</p>
   <img src="images/editprofile.png" class="img-responsive" alt="editprofile" style="height: 200px;">
   <h3>Edit Profile</h3>

   </div>
   </a>
   
  </div>
  
  
</div>



<%@include file="footer.jsp" %>

</body>

</html>