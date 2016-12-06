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
	String cardNum = request.getParameter("cardNum");
	String expiry = request.getParameter("expiry");
	int cvv = Integer.parseInt(request.getParameter("cvv"));

 	//Create FetchData method that can be used to insert a shipping address
	FetchData data = new FetchData();
	//Try to connect to db
	try (Connection con = data.connect();){
		int rst;
	 	rst = data.insertVisa(cardNum, expiry, cvv, uid); 	
	 	System.out.println(rst);
	} catch (SQLException ex) {
		System.out.println(ex);
	}
 	

%>
</html>

