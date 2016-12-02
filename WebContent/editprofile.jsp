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
<title>Edit Profile</title>
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
	<%@include file="navbar.jsp"%>

	<div class="container text-center">
		<div class="row content">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-left" style="text-align: center">
				<h1
					style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Edit
					Profile</h1>
				<p>&nbsp;</p>

				<%
					//Set up the db connection and ability to grab data
					Connection con = null;
					String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
					String uid = "jrogers";
					String pass = "40520158";

					try {
						Class.forName("com.mysql.jdbc.Driver");
						String sql = "SELECT * FROM User, Address WHERE Address.UID = User.UID AND User.UID= '1'";
						con = DriverManager.getConnection(url, uid, pass);
						Statement stmt = con.createStatement();
						ResultSet rst = stmt.executeQuery(sql);

						while (rst.next()) {
							out.print(rst.getInt("UID"));
				%>

				<div class="form-group">
					<label class="control-label">First name:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("FName"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Last name:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("lName"));%>>
					</div>
				</div>


				<div class="form-group">
					<label class="control-label">Home Phone Number:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("UphoneH"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Cell Phone Number:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("UphoneC"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Work Phone Number:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("UphoneW"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Email:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							value=<%out.print(rst.getString("Uemail"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Password:</label>
					<div class="col-md-8">
						<input class="form-control" type="password"
							value=<%out.print(rst.getString("Password"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">Confirm password:</label>
					<div class="col-md-8">
						<input class="form-control" type="password"
							value=<%out.print(rst.getString("Password"));%>>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label"></label>
					<div class="col-md-8">
						<input type="button" class="btn btn-primary" value="Save Changes">
						<span></span>


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















					</div>


					<p>&nbsp;</p>
				</div>
			</div>
		</div>