<%@page import="dbTransactions.FetchData"%> 
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

<title>Validate</title>

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

	
	if (authenticatedUser != null) {
		if (authenticatedUser.equals("Doctor")) {
			response.sendRedirect("doctorhome.jsp");
		} else if (authenticatedUser.equals("Admin")) {
			response.sendRedirect("adminhome.jsp");
		} else if (authenticatedUser.equals("Customer")) {
			//Figure out redirect to send back to checkout
				response.sendRedirect("profilehome.jsp");
		}
	} else {
		response.sendRedirect("login.jsp");
	}
	
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("pw");

		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;

		// Set up the db connection and ability to grab data
		FetchData data = new FetchData();
		ResultSet rst;
		String retStr = null;

		try {
			data.connect();
			rst = data.validateLogin(username, password);
			while(rst.next()){
				retStr = rst.getString(3);
				
				//Set UID in session var
				int uid = rst.getInt(1);
				session.setAttribute("uid", uid);
				
			}

			if(rst.next()){
			}

		}
		catch(SQLException e){	
			out.println(e);
		}
		
		
		if(retStr != null){
			session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		return retStr;
	}
%>

</body>
</html>

