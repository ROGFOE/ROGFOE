<%@ page language="java" import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Latest compiled and minified jQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
div.content {
	margin: 0 auto;
	text-align: center;
	width: 70%;
	
}
</style>

<title>James & Emerson's Fine Grocers CheckOut Line</title>

</head>
<body>

<%
	String authenticatedUser = null;
	session = request.getSession(true);

	try
	{
		authenticatedUser = validateLogin(out,request,session);
	}
	catch(IOException e)
	{	System.err.println(e); }

	if(authenticatedUser != null)
		response.sendRedirect("profilehome.jsp");	// Successful login
	else
		response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message 
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("pw");
		String retStr = null;

		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;

		//Connect to DB
		String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
		String uid = "jrogers";
		String pass = "40520158";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rst = null;

		try {
			// Make database connection
			con = DriverManager.getConnection(url,uid,pass);

			String sql = "SELECT Password FROM User WHERE Uemail = BINARY '?' AND Password = BINARY '?'";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			rst = stmt.executeQuery();

		if (!rst.next())
				retStr = "";

		}
		catch(SQLException e)
		{	out.println(e);}
		finally {
			if (con != null) 
				try { con.close(); } 
				catch (SQLException ex) { System.err.println("SQLException: " + ex); } 
		}

		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		return retStr;
	}
%>

</body>
</html>

