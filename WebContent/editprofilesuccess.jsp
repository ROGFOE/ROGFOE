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
	<title>Edit profile Success</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="navbar.jsp" %>
<h1>Profile Updated</h1>
<h3>Click <a href="editprofile.jsp">here</a> to go back.</h3>

<%
			Connection con = null; 
			String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
			String uid = "jrogers";
			String pass = "40520158";

			//Gather User information from request
			
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String lname = request.getParameter("lname");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String postal = request.getParameter("postal");
			String homephone = request.getParameter("hphone");
			String wphone = request.getParameter("wphone");
			String cphone = request.getParameter("cphone");
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
		
			
			
			//Try to connect to db
			try{
				con = DriverManager.getConnection(url,uid,pass);
				
				//Prepared statements to insert into User table
				String insertUserSQL = ("UPDATE User SET fname =?, mname=?, lname=?, UphoneH=?, UphoneC =?, UphoneC=?, Uemail =?, Password =? WHERE User.UID = '1'");
				PreparedStatement pst = con.prepareStatement(insertUserSQL, Statement.RETURN_GENERATED_KEYS);
				pst.setString(1, fname);
				pst.setString(2, mname);
				pst.setString(3, lname);
				pst.setString(4, homephone);
				pst.setString(5, cphone);
				pst.setString(6, wphone);
				pst.setString(7, email);
				pst.setString(8, pw);
			
				//Execute Query
				pst.executeUpdate();
				
				//Get UID of user that was just inserted to be used in Address insert
				ResultSet keys = pst.getGeneratedKeys();
				keys.next();
				int createdUID = keys.getInt(1);
				
				//Prepared statements to insert into Address table
				String insertAddressSQL = ("UPDATE Address SET Street =?, City=?, State=?, Country=?, PostalCode =? WHERE UID = '1'");
				PreparedStatement psta = con.prepareStatement(insertAddressSQL);
				psta.setString(1, street);
				psta.setString(2, city);
				psta.setString(3, state);
				psta.setString(4, country);
				psta.setString(5, postal);
				
				//Execute
				psta.executeUpdate();
				
				

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