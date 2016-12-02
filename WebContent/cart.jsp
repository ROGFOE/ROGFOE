<%@page import="dbTransactions.FetchData"%> 
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Shopping Cart</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>

<%@include file="navbar.jsp" %>

<div id="wrap" style="min-height: 100%;">
  <div id="main" class="container clear-top" style="padding-bottom:200px;">
  
<h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align: center;">Shopping Cart</h1><p>&nbsp;</p>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">

<% 
//Set up the db connection and ability to grab data
FetchData data = new FetchData();
data.connect();
ResultSet rst;

//Get current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null){
	out.println("<h2>Your shopping cart is empty!</h2>");
	productList = new HashMap<String, ArrayList<Object>>();
} else {
	
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<table class=\"table table-hover\">");
    out.println("<thead><tr><th>          </th><th>Product Name</th><th>Quantity</th>");
    out.println("<th class=\"text-center\">Price</th><th class=\"text-center\">Total</th><th></th></tr></thead><tbody>");
	
    /*each table row is a product*/
    
    //If want to add image, will have to pass that info in the product list OR query db based on product id
    double total =0;
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		
		String imgUrl;
		imgUrl = data.getOrganImage(product.get(0).toString());
		
		out.print("<tr><td class=\"img cart\"><img class=\"cart organ-pic-list\" src=\"" +imgUrl+ "\"></td>");
		out.print("<td class=\"pName\">"+product.get(1)+"</td>");

		out.print("<td class=\"qty\">"+product.get(3)+"</td>");
		double pr = Double.parseDouble( (String) product.get(2));
		int qty = ( (Integer)product.get(3)).intValue();

		out.print("<td class=\"currency\">"+currFormat.format(pr)+"</td>");
		out.print("<td class=\"currency\">"+currFormat.format(pr*qty)+"</td>");
		out.print("<td><a href=\"removecart.jsp?id="+product.get(0)+"\"><span class=\"glyphicon glyphicon-remove\"></span></a> </td>");
		out.println("</tr>");
		total = total +pr*qty;
						
	}
	out.print("<tfoot><tr><td> </td><td> </td><td> </td><td><h5>Subtotal</h5><h3>Grand Total: </h3></td>");
    out.print("<td class=\"text-right\"><h5><strong>"+currFormat.format(total)+"</strong></h5><h3>"+currFormat.format(total)+"</h3></td></tr>");
	out.print("<tr><td> </td><td> </td><td></td><td>");
	out.print("<button type=\"button\" class=\"btn btn-default\" onclick=\"window.location.href='shop.jsp'\"><span class=\"glyphicon glyphicon-shopping-cart\"></span>Continue Shopping</button>");
	out.print("</td>");
	out.print("<td>");
	out.print("<a href=\"checkout.jsp\"><button type=\"button\" class=\"btn btn-success\" >Checkout <span class=\"glyphicon glyphicon-play\"></span></button></a>");
	out.print("</td></tr>");
	out.print("</tfoot>");
	out.print("</table>");
}

%>


		</div>
    </div>
</div>


 </div>
</div>

<%@include file="footer.jsp" %>

</body>

</html>