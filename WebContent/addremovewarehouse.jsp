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
	<title>Add/Remove Warehouse</title>
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
   <div class="col-sm-3">
   </div>
   
    <div class="col-sm-6 text-left" style="text-align:center">
      <h1>Add Warehouse</h1><p>&nbsp;</p>

		<form method="get" action="addwarehousesuccess.jsp">	
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Warehouse Name</label>
			<input type="text" name="warehousename" placeholder="Warehouse One" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Phone Number</label>
			<input type="text" name="number" placeholder="0123456789" class="form-control" required>
			</div>
			</div>
			
			<p>&nbsp;</p>
			
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="Add Warehouse">
      </form>	
      <p>&nbsp;</p>
      <hr>
      
      
      <h1>Remove Warehouse</h1><p>&nbsp;</p>
      <form method="get" action="removewarehousesuccess.jsp">
      <div class="table-responsive">
      <table class="table table-bordered table-striped">
      <thead>
      <tr>
      <th>ID</th>
      <th>Warehouse Name</th>
      <th>Phone Number</th>
      <th>Delete</th>
      </tr>
      </thead>
      <tbody>
      
      
 <%      	
 FetchData data = new FetchData();
	//Try to connect to db
	try (Connection con = data.connect();){
				String SQL = "SELECT WID, WName, WPhone FROM Warehouse;";
				Statement stmt = con.createStatement();
				ResultSet rst = stmt.executeQuery(SQL);
				while(rst.next()){
					int id = rst.getInt("WID");
					%>
					<tr>
					<td><% out.print(id); %></td>
					<td><% out.print(rst.getString("WName")); %></td>
					<td><% out.print(rst.getString("WPhone")); %></td>
					<td><input type="radio" name="delete" value="<% out.print(id); %>" /></td>
					</tr>
					<% 
				} %>
				
				</tbody>
  	</table>
  	</div>
  	<input type="submit" value="Delete">
  	</form>
  	<%
  	con.close();
 			} catch (SQLException ex){
				System.out.println(ex);
			}
			
  %>    
  
  	
  	</div>
    </div>
	<div class="col-sm-3">
   </div>
  </div>
<%@include file="footer.jsp" %>


</body>

</html>