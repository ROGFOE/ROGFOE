<%@page import="dbTransactions.FetchData"%>
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
	<title>Checkout</title>
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

<!-- 
must point set session variable that points back to cart after logging in (normal login vs purchase login)(in auth file?)
Confirm shipping address and billing info
Insert into order table
Remove from organ table
Link to cart page
 -->
<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Checkout</h1><p>&nbsp;</p>
      <p>&nbsp;</p>
      
<% 
//UID is stored as session variable when user logs-in on validateLogin.jsp. Use UID to find shipping addresses, billing info
session = request.getSession(true);
int uid = (int)session.getAttribute("uid");

//Print shipping addresses table. Queries and lists home and shipping address

/*Needs to be a form that submits to a place order file!*/
FetchData data = new FetchData();
data.connect();
ResultSet rst;
rst = data.getShippingAddresses(uid);

out.print("<h2>Shipping Information</h2>");
out.println("<table class=\"table table-hover\">");
out.println("<thead><tr><th>Address</th><th>Select</th></tr></thead>");
out.println("<tbody>");
while(rst.next()){
	String street = rst.getString(1);
	String city = rst.getString(2);
	String state = rst.getString(3);
	String postal = rst.getString(4);
	String country = rst.getString(5);
	int aid = rst.getInt(6);
	
	String col1 = String.format("<tr><td>%s, %s, %s, %s, %s</td>",street, city, state, postal, country);
	String col2 = ("<td><input type=\"radio\" name=\"radAdd\" value='add_"+aid+"'></td></tr>");
	String row = col1.concat(col2);
	System.out.println(row);
	out.print(row);
	
}
out.println("</tbody></table>");


//@TODO Print "Enter new address" form




//Gather Billing information in almost the same manner. Would like 
out.print("<h2>Payment Information</h2>");
out.println("<table class=\"table table-hover\">");
out.println("<thead><tr><th>Payment Method</th><th>Payment Details</th><th>Select</th></tr></thead>");
out.println("<tbody>");

//three while methods & queries, one for each payment type; Visa, Paypal, Bank Transfer. 
//@TODO Would eventually like to make this a bit prettier, ie have different table for each PayType
rst = data.getVisa(uid);
while(rst.next()){
	String cardNum = rst.getString(1);
	String col1 = String.format("<tr><td>Visa</td><td>Card Number: %s</td>", cardNum);
	String col2 = ("<td><input type=\"radio\" name=\"rad\" value='visa_"+cardNum+"'></td></tr>");
	String row = col1.concat(col2);
	System.out.println(row);
	out.print(row); 
}

rst = data.getPayPal(uid);
while(rst.next()){
	String accountNum = rst.getString(1);
	String col1 = String.format("<tr><td>Pay Pal</td><td>Account Number: %s</td>", accountNum);
	String col2 = ("<td><input type=\"radio\" name=\"rad\" value='pp_"+accountNum+"'></td></tr>");
	String row = col1.concat(col2);
	System.out.println(row);
	out.print(row); 
}

rst = data.getBank(uid);
while(rst.next()){
	String accountNum = rst.getString(1);
	String col1 = String.format("<tr><td>Visa</td><td>Account Number%s</td>", accountNum);
	String col2 = ("<td><input type=\"radio\" name=\"rad\" value='bank_"+accountNum+"'></td></tr>");
	String row = col1.concat(col2);
	System.out.println(row);
	out.print(row); 
}
out.println("</tbody></table>");

//Print enter



//Get current list of products to prepare insert for order table
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null){
	out.println("<h2>Your shopping cart is empty!</h2>");
	productList = new HashMap<String, ArrayList<Object>>();
} else {
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
	}
}
%>
  
    </div>
	<div class="col-sm-2">
   </div>
  </div>
</div>


<%@include file="footer.jsp" %>

</body>

</html>