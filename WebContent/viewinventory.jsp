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
<title>View Inventory</title>
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
		<div id="main" class="container clear-top" style="padding-bottom: 200px;">

			<h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align: center;">View
				Inventory</h1>
			<p>&nbsp;</p>
			<div class="container">
				<div class="row">



					<div class="container">
						<table class="table">
							<thead>
								<tr>
									<th>Organ ID</th>
									<th>Organ Name</th>
									<th>Unit Price</th>
									<th>Size</th>
									<th>Removal Date</th>
									<th>Blood Type</th>
									<th>Description</th>
									<th>Doctor</th>
									<th>Hospital</th>
									<th>Category</th>

								</tr>
							</thead>


							<%

							FetchData data = new FetchData();
							//Try to connect to db
							try (Connection con = data.connect();){
									String sql = "SELECT * FROM Organ";
									Statement stmt = con.createStatement();
									ResultSet rst = stmt.executeQuery(sql);

									while (rst.next()) {
							%>
							<tr>
								<td>
									<%
										out.print(rst.getInt("OrgID"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("OName"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("UnitPrice"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("Size"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("RemovalDate"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("OBloodType"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("Desc"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("CertDoctor"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("CertHospital"));
									%>
								</td>
								<td>
									<%
										out.print(rst.getString("Category"));
									%>
								</td>
							</tr>
							<%
							con.close();
								}

								} catch (SQLException ex) {
									System.out.println(ex);
								}

							%>
						</table>
					</div>

				</div>

			</div>

			
		</div>
	</div>
<div>

<%@include file="footer.jsp"%></div>
	
</body>
</html>