<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="dbTransactions.FetchData" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Latest compiled and minified jQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
div.content {
	margin: 0 auto;
	text-align: center;
	width: 70%;
	
}
.table {
	margin: 0 auto;
	text-align: left;
}
.search {
	width: 500px;
	margin: 10px auto;
	text-align: left;
}
</style>

<title>James & Emerson's Fine Grocers</title>
</head>
<body>

<h1 style="text-align: center"><a href="shop.html" style="text-decoration: none;">James & Emerson's Fine Grocers&reg;</a></h1>
<hr />

<div class="content">
<form method="get" action="listprod.jsp">
<input type="text" class="form-control search" name="productName" size="50" placeholder="Find the product of your desire">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>

<% // Get product name to search for
String name = request.getParameter("productName");
		
// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!
	
FetchData data = new FetchData();
//Try to connect to db
try (Connection cnx = data.connect();){

	//Create and prepare prepared statement
	
	String sql = "SELECT productName, categoryName, packageDesc, price, productId FROM Product WHERE productName LIKE ?";
	PreparedStatement pst = cnx.prepareStatement(sql);
	
	pst.setString(1, "%" + name + "%");
	
	
	//Execute query
	ResultSet rst = pst.executeQuery();
	
	
	if(rst.next()){
		// Print out the ResultSet Table Headers
		out.print("<br><br><table class=\"table table-hover\">"+
					"<thead><tr>"+
						"<th>Product Name</th>"+
						"<th>Category Name</th>"+
						"<th>Package Description</th>"+
						"<th>Price</th>"+
						"<th>Add to cart</th>"+
					"</tr></thead><tbody>");
		while(rst.next()){
			String pname = rst.getString(1);
			String cname = rst.getString(2);
			String pdesc = rst.getString(3);
			Double price = rst.getDouble(4);
			String pid = rst.getString(5);
			
			//Format Currency
			NumberFormat currFormat = NumberFormat.getCurrencyInstance();
			
			// For each product create a link of the form
			// addcart.jsp?id=<productId>&name=<productName>&price=<productPrice>
			//String cartLink = "addcart.jsp?id="+pid+"&name="+pname+"&price="+price;
			String pnameEncoded = java.net.URLEncoder.encode(pname,"UTF-8").replace("+","%20");
			String cartLink = "addcart.jsp?id="+pid+"&name="+pnameEncoded+"&price="+price;
	
			//The actual printing.
			out.print("<tr>"+
						"<td>"+pname+"</td>"+
						"<td>"+cname+"</td>"+
						"<td>"+pdesc+"</td>"+
						"<td>"+currFormat.format(price)+"</td>"+
						"<td><a href="+cartLink+">Add to cart</a></td>"+
					  "</tr>");
			
		}
		out.print("</tbody></table></div>");
	}
	else {
		out.print("<br/><div class=\"alert alert-danger\">");
	   	out.print("<strong>Due to recent changes to NAFTA we can no longer provide that product.</strong>");
	   	out.print("</div>");
		out.print("</div>");
	}

} catch (SQLException e){
    System.out.println(e);
} 
%>

</body>
</html>