<%@ page import="java.sql.*"%>
<%@page import="dbTransactions.FetchData"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Order History</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
<%@include file="authBoth.jsp" %>
	<%@include file="navbar.jsp"%>

	<div id="wrap" style="min-height: 100%;">
		<div id="main" class="container clear-top"
			style="padding-bottom: 200px;">

			<h1
				style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align: center;">
				Order History</h1>
			<p>&nbsp;</p>
			<div class="container">
				<div class="row">



					<div class="container">
						<table class="table">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>User ID</th>
									<th>Order ID</th>
									<th>Ship Address ID</th>
									<th>Bill Address ID</th>
									<th>Date </th>
									<th>Order Total</th>
									<th>Shipping Fee</th>
									<th>Status</th>
									<th>Grand Total</th>
									<th>Payment Method</th>
									
									

								</tr>
							</thead>


							<%
								//Set up the db connection and ability to grab data
								Connection con = null;
								String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
								String uid = "jrogers";
								String pass = "40520158";

								try {
									Class.forName("com.mysql.jdbc.Driver");
									String sql = "SELECT * FROM `Order`, User WHERE User.UID = `Order`.UID ORDER BY Order.UID ASC";
									con = DriverManager.getConnection(url, uid, pass);
									Statement stmt = con.createStatement();
									ResultSet rst = stmt.executeQuery(sql);

									while (rst.next()) {
							%>
							<tr>
							<td>
									<%
										out.print(rst.getString("fname"));
									%>
								</td>
							<td>
									<%
										out.print(rst.getString("lname"));
									%>
								</td>
							<td>
									<%
										out.print(rst.getString("UID"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("OID"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("ShipAddID"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("BillAddID"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("Date"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("OrderTotal"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("ShippingFee"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("Status"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("GrandTotal"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("PayBy"));
									%>
								</td>
								
							</tr>
							<%
								}

								} catch (SQLException ex) {
									System.out.println(ex);
								}

								finally {
									if (con != null)
										try {
											con.close();
										} catch (SQLException ex) {
											System.err.println("SQLException: " + ex);
										}
								}
							%>
						</table>
					</div>

				</div>

			</div>

			
		</div>
	</div>
<div><%@include file="footer.jsp"%></div>
	
</body>
</html>