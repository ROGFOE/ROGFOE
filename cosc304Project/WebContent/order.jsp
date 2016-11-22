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

<!-- Latest compiled and minified Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.css">

<!-- Latest compiled and minified jQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- Latest compiled Flipclock JS minified -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flipclock/0.7.8/flipclock.min.js"></script>

<style type="text/css">
.table {
	margin: 0 auto;
}
div.content {
	margin: 0 auto;
	text-align: center;
	width: 70%;
}
.clock {
    display: inline-block;
    width: auto;
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

<title>James & Emerson's Fine Grocers Order Processing</title>
</head>
<body>
<div class="content">

<h1 align="center">James & Emerson's Fine Grocers&reg;</h1>
<hr />
<br />

<% 
// Get customer id
String custId = request.getParameter("customerId");
Integer custID = Integer.valueOf(custId);
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");


Connection con = null; 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_jrogers;";
String uid = "jrogers";
String pw = "40520158";

try 
{	
	con = DriverManager.getConnection(url, uid, pw); 
	
 // Determine if valid customer id was entered
	String sql = "SELECT * FROM Customer WHERE customerId = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, custID);
    ResultSet rst = pstmt.executeQuery();

 // Determine if there are products in the shopping cart
 // If either are not true, display an error message
    if(rst.next() & productList!=null){
    	
    	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
    	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
    	
    	// Save order information to database in Order table. Use retrieval of auto-generated keys to generate OrderID.
    	// Total is saved as zero and update after iterating through order
		String insertOrderSQL = ("INSERT Orders (customerId, totalAmount) VALUES (?, ?)");
		PreparedStatement pstInsertOrder = con.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
		pstInsertOrder.setInt(1, custID);
		pstInsertOrder.setDouble(2, 0.0);
			
		//Execute
		pstInsertOrder.executeUpdate();
			
		//orderId generation
		ResultSet keys = pstInsertOrder.getGeneratedKeys();
		keys.next();
		int orderId = keys.getInt(1);
    	
		double total = 0.0;
		
		out.println("<h2>Your Order Summary</h2>");
		out.print("<table class=\"table table-hover\"><thead><tr><th class=\"pid\">Product Id</th><th class=\"pName\">Product Name</th><th class=\"qty\">Quantity</th>");
		out.println("<th class=\"currency\">Price</th><th class=\"currency\">Subtotal</th></tr></thead><tbody>");
		
		while (iterator.hasNext())
    	{ 
    		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
    		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
    		String productId = (String) product.get(0);
    		String productName = (String) product.get(1);
            String price = (String) product.get(2);
    		double pr = Double.parseDouble(price);
    		int pid = Integer.parseInt(productId);
    		int qty = ( (Integer)product.get(3)).intValue();
			double subtotal = (pr*qty);
			
			total += subtotal;
    		
			out.print("<tr><td class=\"pid\">"+productId+"</td><td class=\"pName\">"+productName+"</td><td class=\"qty\">"+qty+"</td><td class=\"currency\">"+currFormat.format(pr)+"</td><td class=\"currency\">"+currFormat.format(subtotal)+"</td></tr>");		

			// Insert each item into OrderedProduct table using OrderId from previous INSERT
			String insertOrderedProductSQL = ("INSERT OrderedProduct (orderId, productId, quantity, price) VALUES(?, ?, ?, ?)");
			PreparedStatement pstInsertOrderedProduct = con.prepareStatement(insertOrderedProductSQL);
			pstInsertOrderedProduct.setInt(1, orderId);
			pstInsertOrderedProduct.setInt(2, pid);
			pstInsertOrderedProduct.setInt(3, qty);
			pstInsertOrderedProduct.setDouble(4, pr);
			
			pstInsertOrderedProduct.executeUpdate();
			
    	}
		
		// Update total amount for order record
		String updateTotalSQL = "UPDATE Orders SET totalAmount = ? WHERE orderId = ?";
		PreparedStatement pstUpdateTotal = con.prepareStatement(updateTotalSQL);
		pstUpdateTotal.setDouble(1, total);
		pstUpdateTotal.setInt(2, orderId);
		pstUpdateTotal.executeUpdate();
		
		// Finish printing order summary
		out.print("<tr><td colspan=\"4\" align=\"right\"><strong>Total:</strong></td><td class=\"currency\">"+currFormat.format(total)+"</td></tr></tbody></table>");
		
		// Successful order message
		out.print("<div class=\"alert alert-success\">");
		out.print("<strong>Order complete.</strong> Thanks for your business "+rst.getString(3)+"! We will be shipping your order soon. <strong>Please copy down this Order Reference Number for your records: "+orderId+"</strong>");
		out.print("</div>");
		// Timer countdown until redirect
		out.print("<div class=\"alert alert-warning\">You will be redirected in:</div>");
		out.print("<div class=\"clock\"></div>");
		// clear the productList and destroy the session
		productList.clear();
		session.invalidate();
		// Head back to homepage after 15 seconds
		response.setHeader("Refresh", "15;url=shop.html");
    
    }
    else{
    	out.println("<h2>Your Order Summary</h2>");
    	
    	out.print("<div class=\"alert alert-danger\">");
    	out.print("<strong>Invalid customer ID or empty cart.</strong>");
    	out.print("</div>");
    	
    	// Timer countdown until redirect
		out.print("<div class=\"alert alert-warning\">You will be redirected in:</div>");
		out.print("<div class=\"clock\"></div>");
		// clear the product list and destroy the session
		if(productList!=null){productList.clear();}
		session.invalidate();
		// Head back to homepage after 10 seconds
		response.setHeader("Refresh", "10;url=listprod.jsp?productName=");
    }

} 

catch (SQLException ex) 
{ 
	out.println(ex); 
} 

finally 
{ 
	if (con != null) 
		try { con.close(); } 
		catch (SQLException ex) { System.err.println("SQLException: " + ex); } 
} 

%>

</div>

<script type="text/javascript">
var clock = $('.clock').FlipClock(15,{
	countdown: true,
	clockFace: 'MinuteCounter'
});
</script>
</BODY>
</HTML>

