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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
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
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Profile</h1><p>&nbsp;</p>
      <p>&nbsp;</p>
      
      <p>Congratulations you've successfully logged in!</p>
      
    </div>
	<div class="col-sm-2">
   </div>
  </div>
</div>


<%@include file="footer.jsp" %>

</body>

</html>