<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Organ</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="auth.jsp" %>
<%@include file="navbar.jsp" %>

<div class="container text-center">
  <div class="row content">
   <div class="col-sm-3">
   </div>
   
    <div class="col-sm-6 text-left" style="text-align:center">
      <h1>Add Organ</h1><p>&nbsp;</p>

		<form method="get" action="addorgansuccess.jsp">	
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Organ Name</label>
			<input type="text" name="organname" placeholder="Kidney" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-4 form-group">
			<label>List Price</label>
			<div class="input-group">
			<span class="input-group-addon">$</span>
			<input type="text" name="listprice" placeholder="999.99" class="form-control" required>	
			</div>
			</div>
						
			<div class="col-sm-4 form-group">
			<label>Size (Grams)</label>
			<input type="text" name="size" placeholder="100" class="form-control" required>
			</div>
						
			<div class="col-sm-4 form-group">
  			<label>Blood Type</label>
  			<select class="form-control" name="blood" required>
  			<option value="" disabled selected>Blood Type</option>
   			 <option value="A">A</option>
  			  <option value="AB">AB</option>
    		<option value="B">B</option>
    		<option value="O">O</option>
 			 </select>
			</div>

			</div>
			
			<div class="row">
			<div class="col-sm-6 form-group">
  			<label>Category</label>
  			<select class="form-control" name="category" required>
  			<option value="" disabled selected>Category</option>
   			 <option value="body">Body</option>
  			  <option value="gland">Gland</option>
    		<option value="lower middle body">Lower Middle Body</option>
    		<option value="middle body">Middle Body</option>
    		<option value="unknown">Unknown</option>
    		<option value="upper body">Upper Body</option>
    		<option value="upper middle body">Upper Middle Body</option>
 			 </select>
			</div>
			
			<div class='col-sm-6'>
            <label>Removal Date</label>
			<input type="text" name="date" placeholder="yyyy-mm-dd" class="form-control" required>	
			</div>
			
			</div>
			
			<div class="row">
			<div class="col-sm-6 form-group">
			<label>Doctor</label>
			<input type="text" name="doctor" placeholder="Dr. Phil" class="form-control" required>
			</div>
			
			<div class="col-sm-6 form-group">
			<label>Hospital</label>
			<input type="text" name="hospital" placeholder="Queen Elizabeth General Hospital" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Image URL</label>
			<input type="text" name="image" placeholder="https://www.wired.com/wp-content/uploads/2014/07/brain1.jpg" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Description</label>
  			<textarea class="form-control" rows="5" id="description" name="description"></textarea>
			</div>
			</div>
			
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="Add Organ">
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