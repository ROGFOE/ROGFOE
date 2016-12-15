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
	int accountNum = Integer.parseInt(request.getParameter("accountNum"));

 	//Create FetchData method that can be used to insert a shipping address
 	FetchData data = new FetchData();
	//Try to connect to db
	try (Connection con = data.connect();){
		int rst;
	 	rst = data.insertPayPal(uid, accountNum);
	 	System.out.println(rst);
	} catch (SQLException ex) {
		System.out.println(ex);
	}
 	

%>
</html>

