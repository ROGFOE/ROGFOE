<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
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
<style>
.table {
	margin: 0 auto;
}
div.content {
	margin: 0 auto;
	text-align: center;
	width: 70%;
}
.currency {
	text-align: right;
}
.qty {
	text-align: center;
}
.pName {
	text-align: left;
}
.pid {
	text-align: left;
}
</style>
<title>Your Shopping Cart</title>
</head>
<body>

<h1 style="text-align: center"><a href="listprod.jsp?productName=" style="text-decoration: none;">James & Emerson's Fine Grocers&reg;</a></h1>
<hr />
<div class="content">


<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	
	out.println("<h2>Your shopping cart is empty!</h2>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<br /><h2>Your Shopping Cart</h2>");
	out.print("<br />");
	out.print("<table class=\"table table-hover\"><thead><tr><th class=\"pid\">Product Id</th><th class=\"pName\">Product Name</th><th class=\"qty\">Quantity</th>");
	out.println("<th class=\"currency\">Price</th><th class=\"currency\">Subtotal</th><th></th></tr></thead><tbody>");

	double total =0;
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		out.print("<tr><td class=\"pid\">"+product.get(0)+"</td>");
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
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</tbody></table>");

	out.println("<h2><a href=\"checkout.jsp\">Check Out</a></h2>");
}
%>
<h2><a href="listprod.jsp?productName=">Continue Shopping</a></h2>
</div>
</body>
</html> 

