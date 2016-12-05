<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Edit/Delete Organ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<style>
th{
	text-align: center;
	}
</style>
</head>

<body>
<%@include file="authBoth.jsp" %>
	<%@include file="navbar.jsp"%>

	<div id="wrap" style="min-height: 100%;">
		<div id="main" class="container clear-top" style="padding-bottom: 200px;">

			<h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align: center;">
				Edit/Delete Organ</h1>
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
									<th>Doctor</th>
									<th>Category</th>
									<th>Edit</th>
									<th>Delete</th>

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
									String sql = "SELECT * FROM Organ";
									con = DriverManager.getConnection(url, uid, pass);
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
										out.print(rst.getString("CertDoctor"));
									%>
								</td>

								<td>
									<%
										out.print(rst.getString("Category"));
									%>
								</td>
								<td>
								<form method="get" action="editorgan.jsp">
								<input type="hidden" name="idfromedit" value="<% out.print(rst.getInt("OrgID")); %>">
								<input type="submit" class="btn btn-success" name="edit" value="Edit" />
								</form>							
								</td>
								
								<td>
								<form method="get" action="deleteorgan.jsp">
								<input type="hidden" name="idfromdelete" value="<% out.print(rst.getInt("OrgID")); %>">
								<input type="submit" class="btn btn-danger" name="delete" value="Delete" />
								</form>
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
<div>

<%@include file="footer.jsp"%></div>
	
</body>
</html>