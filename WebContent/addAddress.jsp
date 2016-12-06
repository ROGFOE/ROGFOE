<%@ page import="java.sql.*"%>
<%@page import="dbTransactions.FetchData"%>
<!DOCTYPE html>
<html>
<%@include file="auth.jsp" %>
<%
	//UID 
	session = request.getSession(true);
	int uid = (int)session.getAttribute("uid");
	
	//POST parameters
	String street = request.getParameter("street");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
 	String postal = request.getParameter("postal");

 	//Create FetchData method that can be used to insert a shipping address
 	FetchData data = new FetchData();
	//Try to connect to db
	try (Connection con = data.connect();){
		int rst;
	 	rst = data.insertShippingAddress(uid, street, city, state, country, postal);
	 	
	 	System.out.println(rst);
	
	} catch (SQLException ex) {
		System.out.println(ex);
	}
 	

%>
</html>

