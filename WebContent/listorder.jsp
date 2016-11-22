<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
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

<style type="text/css">


th.o_label {
    color: white;
    font-size: 1.4em;
}
.o_label {
	text-align: center;
	background-color: #002B2A;
	font-size: 1.3em;
}
.o_value {
	background-color: #004A47;
    color: white;
    text-align: center;
    font-size: 1.2em;
}
.p_label th {
	background-color: #758584;
    color: white;
    font-size: 1.1em;
    text-align: right;
}
.p_value td{
	<!--background-color: #96ABAB;-->
	color: white;
	font-size: 1em;
	text-align: right;
}
body{
  padding:20px 20px;
}
.orders tr[visible='false'],
.no-result{
  display:none;
}
.orders tr[visible='true']{
  display:table-row;
}
.counter{
  padding:8px; 
  color:#ccc;
}
div.form-group {
	width: 200px;
}
div.content {
	width: 70%;
	margin: 0 auto;
}
       
</style>
<title>James & Emerson's Fine Grocers&reg; Order List</title>
</head>
<body>

<h1 style="text-align: center"><a href="shop.html" style="text-decoration: none;">James & Emerson's Fine Grocers&reg;</a></h1>
<hr />
<br/>
<h2 style="text-align: center">Private Customer Order Information</h2>

<% 
Connection con = null; 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_jrogers;";
String uid = "jrogers";
String pw = "40520158";

try 
{	
	con = DriverManager.getConnection(url, uid, pw); 
	
	String sql = "SELECT O.orderId, O.customerId, C.cname, O.totalAmount FROM Orders O JOIN Customer C on O.customerId = C.customerId";
    PreparedStatement pstmt = con.prepareStatement(sql);
    ResultSet rst = pstmt.executeQuery();

	out.println("");
	out.println("<div class=\"content\"><div class=\"form-group pull-right\"><input type=\"text\" class=\"search form-control\" placeholder=\"Search by Customer Name\"></div><span class=\"counter pull-right\"></span>");
	out.println("<table class=\"table table-hover orders\" style=\"margin: 0 auto;\"><thead><tr><th class=\"o_label\">Order Id</th><th class=\"o_label\">Customer Id</th><th class=\"o_label\">Customer Name</th><th class=\"o_label\">Total Amount</th></tr>");
	out.println("<tr class=\"warning no-result\"><td colspan=\"4\"><i class=\"fa fa-warning\"></i> No customers match that name.</td></tr></thead><tbody>");
	while (rst.next()) 
	{	
		out.println("<tr class=\"custID"+rst.getInt(2)+"\"><td class=\"o_value\">"+rst.getInt(1)+"</td><td class=\"o_value cid\">"+rst.getInt(2)+"</td><td class=\"o_value cname\">"+rst.getString(3)+"</td><td class=\"o_value\">$"+rst.getBigDecimal(4)+"</td></tr>");
		out.println("<tr class=\"p_label custID"+rst.getInt(2)+"\"><th class=\"p_label\"></th><th class=\"p_label\">Product Id</th> <th class=\"p_label\">Quantity</th> <th class=\"p_label\">Price</th></tr>");
		
		String sql2 = "SELECT OP.productId, OP.quantity, OP.price FROM OrderedProduct OP JOIN Orders O on OP.orderId = O.orderId WHERE OP.orderId = ?";
	    PreparedStatement pstmt2 = con.prepareStatement(sql2);
	    pstmt2.setInt(1, rst.getInt(1));
	    ResultSet rst2 = pstmt2.executeQuery();
		while (rst2.next()) 
		{
			out.println("<tr class=\"p_value custID"+rst.getInt(2)+"\"><td class=\"p_value\"></td><td class=\"p_value\">"+rst2.getInt(1)+"</td><td class=\"p_value qty\" data-qty=\""+rst2.getInt(2)+"\">"+rst2.getInt(2)+"</td><td class=\"p_value\">$"+rst2.getBigDecimal(3)+"</td></tr>");
		}

	} 
	out.println("</tbody></table></div>"); 
	 
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

<script type="text/javascript" defer="defer">
// adapted from: https://codepen.io/adobewordpress/pen/gbewLV
$(document).ready(function() {
	
 	$(".search").keyup(function () {
 		
	var searchTerm = $(".search").val();
	if(searchTerm.length>0){	
		var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
 		$.extend($.expr[':'], {'containsi': function(elem, i, match, array){		
        	return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    	}});
    
		$(".orders tbody tr").attr('visible', '');
  		$(".orders tbody td.cname:containsi('" + searchSplit + "')").each(function(e){		
	  		var custId = $(this).parent().attr('class');
			$("."+custId).each(function(e){
				$(this).attr('visible','true');
	  		});
  		});
  
  		$(".orders tbody tr[visible='']").each(function(e){
    		$(this).attr('visible','false');
  		});
  		
 		var jobCount = $('.orders tbody tr.p_value[visible="true"]').length;
  		$('.counter').text(jobCount + ' product(s)');

		if(jobCount == '0') {$('.no-result').show();}
		else {$('.no-result').hide();}    	
	}
	else{
		$(".orders tbody tr").each(function(e){
		    $(this).attr('visible','').attr('display','table-row');
		  	$('.counter').text('');
		  	$('.no-result').hide();
		});
	}
 
	});
});

</script>

</body>
</html>

