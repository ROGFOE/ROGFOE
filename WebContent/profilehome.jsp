<%@page import="dbTransactions.FetchData"%>
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
	<title>Profile</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<!-- Latest compiled Flipclock JS minified -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.js"></script>
	
<style type="text/css">
.clock {
    display: inline-block;
    width: auto;
}
</style>	
</head>

<body>

<%@include file="navbar.jsp" %>
<!--This is a protected page, must include auth.jsp-->
<%@include file="auth.jsp" %>

<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Profile</h1>
      <h2>Order History & Status</h2>
      <p>&nbsp;</p>
    <%
    	//ORDER HISTORY
		session = request.getSession(true);
		int uid = (int)session.getAttribute("uid");

		FetchData data = new FetchData();
		data.connect();
		ResultSet rst;
		rst = data.getOrderHistory(uid);
		
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();

		while(rst.next()){
			out.print("<h3 style=\"text-align: left\">Order:</h3>");
			int oid = rst.getInt(1);
			Date orderDate = rst.getDate(4);
			Double total = rst.getDouble(5);
			String status = rst.getString(7);
			out.println("<table class=\"table table-hover\">");
			out.println("<thead><tr><th>Ordered On</th><th>Total</th><th>Shipping Status</th></tr></thead>");		
			out.println("<tbody>");
			out.println("<tr>");
			out.println("<td>"+orderDate+"</td><td>"+currFormat.format(total)+"</td><td>"+status+"</td>	");
			out.println("</tr>");
			out.println("</tbody></table>");

			
			out.print("<h5 style=\"text-align: left\"> Contains:  </h5>");
			ResultSet organRST = data.getOrgansInOrder(oid);
			while(organRST.next()){
				String name = organRST.getString("OName");
				out.print("<p style=\"text-align: left\">"+name+"</p>");
			}
			
			out.println("<br><br><br>");
		}
		
		
		//ACCOUNT INFO
		out.print("<h3 style=\"text-align: left\">Profile Information:</h3>");
		ResultSet userRST = data.getUserDetails(uid);
		out.println("<table class=\"table table-hover\">");
		out.println("<thead><tr><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Home Phone</th><th>Cell Phone</th><th>Work Phone</th><th>Email</th></tr></thead>");		
		out.println("<tbody>");
		out.println("<tr>");
		while(userRST.next()){
			String fname = userRST.getString(3);
			String mname = userRST.getString(4);
			String lname = userRST.getString(5);
			String hphone = userRST.getString(6);
			String cphone = userRST.getString(7);
			String wphone = userRST.getString(8);
			String email = userRST.getString(9);
			out.println("<td>"+fname+"</td><td>"+mname+"</td><td>"+lname+"</td><td>"+hphone+"</td><td>"+cphone+"</td><td>"+wphone+"</td><td>"+email+"</td>");
		}
		out.println("</tr>");
		out.println("</tbody></table><br><br><br>");
		
		//ADDRESSES
		
		out.print("<h3 style=\"text-align: left\">Address Information:</h3>");
		rst = data.getShippingAddresses(uid);
		
		out.println("<table class=\"table table-hover\">");
		out.println("<thead><tr><th>Street</th><th>City</th><th>State/Province</th><th>Zip/Postal Code</th><th>Country</th></tr></thead>");		
		out.println("<tbody>");
		while(rst.next()){
			String street = rst.getString(1);
			String city = rst.getString(2);
			String state = rst.getString(3);
			String postal = rst.getString(4);
			String country = rst.getString(5);
			out.println("<tr><td>"+street+"</td><td>"+city+"</td><td>"+state+"</td><td>"+postal+"</td><td>"+country+"</td></tr>");
			
		}
		out.println("</tbody></table>");
	%>	

    </div>
	<div class="col-sm-2">
   </div>
  </div>
</div>

<%@include file="footer.jsp"%>


</body>
</html>