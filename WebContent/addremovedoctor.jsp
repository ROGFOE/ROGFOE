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
	<title>Add/Remove Doctor</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<style>
	th{
	text-align: center;
	}
	</style>
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="authAdmin.jsp" %>
<%@include file="navbar.jsp" %>

<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
   
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1>Add Doctor</h1><p>&nbsp;</p>

		  <div class="row">
				
				<form method="get" action="adddoctorsuccess.jsp">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>First Name</label>
								<input type="text" name="fname" placeholder="Donald" class="form-control" required>
							</div>
							<div class="col-sm-4 form-group">
								<label>Middle Name</label>
								<input type="text" name="mname" placeholder="J." class="form-control">
							</div>
							<div class="col-sm-4 form-group">
								<label>Last Name</label>
								<input type="text" name="lname" placeholder="Trump" class="form-control" required>
							</div>
						</div>					
						<div class="form-group">
							<label>Street</label>
							<input type="text" name="street" placeholder="1161 W Georgia St." class="form-control" required>
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>City</label>
								<input type="text" name="city" placeholder="Vancouver" class="form-control" required>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Country</label>
								<select class="form-control" name="country" required>
        							<option value="cad">Canada</option>
        							<option value="us">United States of America</option>
        							<option value="uk">United Kingdom</option>
        							<option value="irn">Iran</option>
        							<option value="ind">India</option>
        							<option value="phl">Philippines</option>
      							</select>
							</div>	
							</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Province/State</label>
								<input type="text" name="state" placeholder="BC" class="form-control" required>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Postal Code/Zip Code</label>
								<input type="text" name="postal" placeholder="V6E 0C6" class="form-control" required>
							</div>		
						</div>
						
							
							
					<div class="row">						
					<div class="col-sm-4 form-group">
						<label>Home Phone</label>
						<input type="text" name="hphone" placeholder="+9 (999) - 9999" class="form-control" required>
					</div>
					
					<div class="col-sm-4 form-group">
						<label>Work Phone</label>
						<input type="text" name="wphone" placeholder="+9 (999) - 9999" class="form-control">
					</div>		
					
					<div class="col-sm-4 form-group">
						<label>Cell Phone</label>
						<input type="text" name="cphone" placeholder="+9 (999) - 9999" class="form-control">
					</div>		
					</div>		
					<div class="row">
					<div class="col-sm-6 form-group">
						<label>Email Address</label>
						<input type="text" name="email" placeholder="iloveorgans@example.com" class="form-control" required>
					</div>	
					
					<div class="col-sm-6 form-group">
						<label>Practice</label>
						<input type="text" name="practice" placeholder="Harambe Clinic & Co." class="form-control" required>
					</div>
					</div>
					
					<div class="row">
					 <div class="col-sm-6 form-group">
								<label>Password</label>
								<input type="password" name="pw" placeholder="Enter Password Here.." class="form-control" required>
							</div>
							<div class="col-sm-6 form-group">
								<label>Password Confirmation</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control">
							</div>
							
							</div>	
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="Add Doctor">				
					</div>
				</form> 
				</div>
      <p>&nbsp;</p>
      <hr>
      
      
      <h1>Remove Doctor</h1><p>&nbsp;</p>
      <form method="get" action="removedoctorsuccess.jsp">
      <div class="table-responsive">
      <table class="table table-bordered table-striped">
      <thead>
      <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Phone Number</th>
      <th>Email</th>
      <th>Practice</th>
      <th>Delete</th>
      </tr>
      </thead>
      <tbody>
      
      
 <%      	
 FetchData data = new FetchData();
	//Try to connect to db
	try (Connection con = data.connect();){
				String SQL = "SELECT Doctor.UID, fName, lName, UphoneH, Uemail, PracticeName FROM User, Doctor WHERE User.UID=Doctor.UID;";
				Statement stmt = con.createStatement();
				ResultSet rst = stmt.executeQuery(SQL);
				while(rst.next()){
					int id = rst.getInt("UID");
					%>
					<tr>
					<td><% out.print(id); %></td>
					<td><% out.print(rst.getString("fName") + " " + rst.getString("lName")); %></td>
					<td><% out.print(rst.getString("UphoneH")); %></td>
					<td><% out.print(rst.getString("Uemail")); %></td>
					<td><% out.print(rst.getString("PracticeName")); %></td>
					<td><input type="radio" name="delete" value="<% out.print(id); %>" /></td>
					</tr>
					<% 
				} %>
				
				</tbody>
  	</table>
  	</div>
  	<input type="submit" value="Delete">
  	</form>
  	  	<p>&nbsp;</p>
  	<%
  			con.close();
 			} catch (SQLException ex){
				System.out.println(ex);
			}
  %>    
  
  	
  	</div>
    </div>
	<div class="col-sm-2">
   </div>
  </div>
<%@include file="footer.jsp" %>


</body>

</html>