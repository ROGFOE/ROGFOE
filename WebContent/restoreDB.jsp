<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@page import="dbTransactions.LoadData"%>

<!DOCTYPE html>
<html>
<head>
	<title>Shop</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.css">
	<!-- Latest compiled Flipclock JS minified -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DATABASE RECOVERY</title>

<style type="text/css">
.clock {
    display: inline-block;
    width: auto;
}
</style>
</head>
<body>
<% 
// reload the database from a restorative state
LoadData dat = new LoadData();
dat.loadData();

out.print("<div class=\"alert alert-success\">");
out.print("<strong>DATABASE SUCCESSFULLY RECOVERED</strong>");
out.print("</div>");

// Timer countdown until redirect
out.print("<div class=\"alert alert-warning\">You will be redirected in:</div>");
out.print("<div class=\"clock\"></div>");

response.setHeader("Refresh", "7;url=adminhome.jsp");
%>

<script type="text/javascript">
var clock = $('.clock').FlipClock(7,{
	countdown: true,
	clockFace: 'MinuteCounter'
});
</script>
</body>

</html>