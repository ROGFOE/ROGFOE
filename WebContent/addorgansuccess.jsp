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
	<title>Add Organ Success</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="navbar.jsp" %>
<%@include file="auth.jsp" %>
<h1>Your organ has been added!</h1>

<%
			Connection con = null; 
			String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
			String uid = "jrogers";
			String pass = "40520158";
			NumberFormat currFormat = NumberFormat.getCurrencyInstance();
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//Gather User information from request			
			String oName = request.getParameter("organname");
			double price = Double.parseDouble(request.getParameter("listprice"));
			int size = Integer.parseInt(request.getParameter("size"));
			String blood = request.getParameter("blood");
			String category = request.getParameter("category");
			String date = request.getParameter("date");
			String doctor = request.getParameter("doctor");
			String hospital = request.getParameter("hospital");
			String imgURL = request.getParameter("image");
			String description = request.getParameter("description");
			
			java.util.Date date2 = sdf.parse(date);

			try{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url,uid,pass);
				
				//Prepared statements to insert into Organ table
				String insertOrganSQL = ("INSERT INTO Organ (`OName`, `UnitPrice`, `Size`, `RemovalDate`," + 
				" `OBloodType`, `Desc`, `Picture`, `CertDoctor`, `CertHospital`, `Category`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
				PreparedStatement pst = con.prepareStatement(insertOrganSQL, Statement.RETURN_GENERATED_KEYS);
				pst.setString(1, oName);
				pst.setDouble(2, price);
				pst.setInt(3, size);
				pst.setObject(4, date2);
				pst.setString(5, blood);
				pst.setString(6, description);
				pst.setString(7, imgURL);
				pst.setString(8, doctor);
				pst.setString(9, hospital);
				pst.setString(10, category);
			
				//Execute Query
				pst.executeUpdate();
				
			} catch (SQLException ex){
				System.out.println(ex);
			}
			
			finally{
				if (con != null) 
					try { con.close(); } 
					catch (SQLException ex) { System.err.println("SQLException: " + ex); } 
			}
%>
<%@include file="footer.jsp" %>

</body>

</html>