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
	<title>Edit Profile</title>
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

<%@include file="navbar.jsp" %>
<% 
			Connection con = null; 
			String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
			String uid = "jrogers";
			String pass = "40520158"; %>
<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
   
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1>Edit Profile</h1><p>&nbsp;</p>
<%      	
 			try{
 				session = request.getSession(true);
 				int UID = (int)session.getAttribute("uid");
 				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url,uid,pass);
				String SQL = "SELECT* FROM User, Address WHERE User.UID=Address.UID AND User.UID ='?' LIMIT 1";
				
				PreparedStatement stmt = con.prepareStatement(SQL);
				stmt.setInt(1,UID);
				ResultSet rst = stmt.executeQuery(SQL);
				while(rst.next()){
				%>	
					
		
				
		  <div class="row">
				
				<form method="get" action="editprofilesuccess.jsp">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>First Name</label>
								<input type="text" name="fname"  class="form-control" value =" <% out.print(rst.getString("fName")); %> " required>
							</div>
							<div class="col-sm-4 form-group">
								<label>Middle Name</label>
								<input type="text" name="mname"  class="form-control" value =" <% out.print(rst.getString("mName")); %> ">
							</div>
							<div class="col-sm-4 form-group">
								<label>Last Name</label>
								<input type="text" name="lname"  class="form-control" value =" <% out.print(rst.getString("lName")); %> "required>
							</div>
						</div>					
						<div class="form-group">
							<label>Street</label>
							<input type="text" name="street"  class="form-control" value =" <% out.print(rst.getString("Street")); %>" required>
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>City</label>
								<input type="text" name="city" class="form-control"  value =" <% out.print(rst.getString("City")); %>" required>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Country</label>
								<select class="form-control" name="country" value =" <% out.print(rst.getString("Country")); %>" required>
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
								<input type="text" name="state"  class="form-control" value =" <% out.print(rst.getString("State")); %>" required>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Postal Code/Zip Code</label>
								<input type="text" name="postal"  class="form-control" value =" <% out.print(rst.getString("PostalCode")); %>" required>
							</div>		
						</div>
						
							
							
					<div class="row">						
					<div class="col-sm-4 form-group">
						<label>Home Phone</label>
						<input type="text" name="hphone"  class="form-control" value =" <% out.print(rst.getString("UphoneH")); %>" required>
					</div>
					
					<div class="col-sm-4 form-group">
						<label>Work Phone</label>
						<input type="text" name="wphone"  class="form-control" value =" <% out.print(rst.getString("UphoneW")); %>">
					</div>		
					
					<div class="col-sm-4 form-group">
						<label>Cell Phone</label>
						<input type="text" name="cphone"  class="form-control" value =" <% out.print(rst.getString("UphoneW")); %>">
					</div>		
					</div>		
					<div class="row">
					<div class="col-sm-12 form-group">
						<label>Email Address</label>
						<input type="text" name="email"  class="form-control" value =" <% out.print(rst.getString("Uemail")); %>" required>
					</div>	
					
					</div>
					
					
					<div class="row">
					 <div class="col-sm-6 form-group">
								<label>Password</label>
								<input type="password" name="pw"  class="form-control" value =" <% out.print(rst.getString("Password")); %>"  required>
							</div>
							<div class="col-sm-6 form-group">
								<label>Password Confirmation</label>
								<input type="password"  class="form-control" value =" <% out.print(rst.getString("Password")); %>">
							</div>
							
							</div>	
							<%	} %>
							
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="Edit Profile">	
								
					</div>
				</form> 
				</div>
      <p>&nbsp;</p>
      
      </div>
      <%
 			} catch (SQLException ex){
				System.out.println(ex);
			}
			
			finally{
				if (con != null) 
					try { con.close(); } 
					catch (SQLException ex) { System.err.println("SQLException: " + ex); } 
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