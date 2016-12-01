<%@page import="dbTransactions.FetchData"%>
<!DOCTYPE html>
<html>
<%@include file="auth.jsp" %>
<%
	//UID 
	session = request.getSession(true);
	int uid = (int)session.getAttribute("uid");
	
	//POST parameters
	String accountNum = request.getParameter("accountNum");
	String bankName = request.getParameter("bankName");
	int branchNum = Integer.parseInt(request.getParameter("branchNum"));

 	//Create FetchData method that can be used to insert a shipping address
 	FetchData data = new FetchData();
 	data.connect();
 	int rst;
 	rst = data.insertBankTransfer(accountNum, bankName, branchNum, uid);
 	
 	System.out.println(rst);

%>
</html>

