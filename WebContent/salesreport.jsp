<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Sales Report</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<style>
	th{
	text-align:center;
	}
	</style>
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="navbar.jsp" %>

 <div class="row content">
 

  <div class="col-sm-3">
   </div>
  
  <div class="col-sm-6">
  
   <h1>Sales Report</h1>
<table class="table table-bordered table-striped">
      <thead>
      <tr>
      <th>Total Products Sold</th>
      <th>Total Amount Sold</th>
      <th>Total Number of Customers</th>
      </tr>
      </thead>
      <tbody>

<%
			Connection con = null; 
			String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
			String uid = "jrogers";
			String pass = "40520158";
			
			//Try to connect to db
			try{
				out.print("<h1>&nbsp;</h1> ");
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url,uid,pass);
				
				
				//Prepared statements to insert into User table
				String sql = ("SELECT COUNT(OID) AS totalAmt, SUM(GrandTotal) AS totalPrice, COUNT(DISTINCT UID) AS numCustomers FROM `Order`");
				Statement stmt = con.createStatement();
				ResultSet rst = stmt.executeQuery(sql);
				
				while(rst.next()){
			
					%>
					<tr>
					<td><% out.print(rst.getInt("totalAmt")); %></td>
					<td><% out.print("$" + rst.getDouble("totalPrice")); %></td>
					<td><% out.print(rst.getInt("numCustomers")); %></td>
					
					</tr>
				<% 	
				}
				
			%>
				</tbody>
				</table>
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
	 <div class="col-sm-3">
   </div>
	</div>
<%@include file="footer.jsp" %>

</body>

</html>