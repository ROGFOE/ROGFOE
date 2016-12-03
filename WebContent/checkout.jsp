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

<div class="container text-center">
  <div class="row content">
   <div class="col-sm-2">
   </div>
    <div class="col-sm-8 text-left" style="text-align:center">
      <h1 style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">Checkout</h1><p>&nbsp;</p>
      <p>&nbsp;</p>
		
	  <br><br><br><h2>Shipping Information</h2><br>

	<form id="selectAddress">
		<% 
		//Print shipping addresses table. Queries and lists home and shipping address

		//UID is stored as session variable when user logs-in on validateLogin.jsp. Use UID to find shipping addresses, billing info
		session = request.getSession(true);
		int uid = (int)session.getAttribute("uid");

		FetchData data = new FetchData();
		data.connect();
		ResultSet rst;
		rst = data.getShippingAddresses(uid);
		
		out.println("<table class=\"table table-hover\">");
		out.println("<thead><tr><th>Street</th><th>City</th><th>State</th><th>Postal</th><th>Country</th><th>Select</th></tr></thead>");		
		out.println("<tbody>");
		while(rst.next()){
			String street = rst.getString(1);
			String city = rst.getString(2);
			String state = rst.getString(3);
			String postal = rst.getString(4);
			String country = rst.getString(5);
			int aid = rst.getInt(6);
			
			String col1 = String.format("<tr><td>"+street+"</td><td>"+city+"</td><td>"+state+"</td><td>"+postal+"</td><td>"+country+"</td>");
			String col2 = ("<td><input type=\"radio\" id=\"amk\" name=\"radAdd\" value='add_"+aid+"'></td></tr>");
			String row = col1.concat(col2);
			out.print(row);
			
		}
		out.println("</tbody></table>");
		%>
	</form>

<!-- New address button and form which will lead to addAddress. addAddress page inserts info and returns to here-->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Enter new address &nbsp <span class="glyphicon glyphicon-tent"></span></button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Enter new address</h4>
      </div>

			<form class="addAddress">
					<div class="form-group">
						<label>Street</label> <input type="text" name="street"
							placeholder="1161 W Georgia St." class="form-control" required>
					</div>
					<div class="row">
							<div class="col-sm-6 form-group">
									<label>City</label> <input type="text" name="city"
										placeholder="Vancouver" class="form-control" required>
							</div>
							<div class="col-sm-6 form-group">
								<label>Country</label> 
								<select class="form-control" name="country" required>
									<option value="cad">Canada</option>
									<option value="us">United States of America</option>
									<option value="uk">United Kingdom</option>
									<option value="irn">Iran</option>
									<option value="ind">India</option>
									<option value="phl">Philippines</option>
								</select>
							</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
								<label>Province/State</label> <input type="text" name="state"
									placeholder="BC" class="form-control" required>
						</div>
						<div class="col-sm-6 form-group">
								<label>Postal Code/Zip Code</label> <input type="text"
											name="postal" placeholder="V6E 0C6" class="form-control"
											required>
						</div>
					</div>
					<div class="modal-footer">
					<button class="btn btn-lg btn-primary btn-block" id="submit" data-dismiss="modal">Submit</button>
					<!-- <input type="submit" class="btn btn-lg btn-primary btn-block" data-dismiss="modal" value="Submit Address"> -->
					</div>
			</form>
	</div>
  </div>
</div>
<script>
$(function() {
 $("button#submit").click(function(){
         $.ajax({
     		type: "POST",
 			url: "addAddress.jsp",
 			data: $('form.addAddress').serialize(),
         	success: function(msg){
                console.log($('form.addAddress').serialize());
                location.reload();
         	},
 		error: function(){
 				console.log("Error");
 				location.reload();
 		}
     });
 });
});
</script>

	<br><br><br><h2>Payment Information</h2><br>
	<form id="selectPay">
		<%
		//Gather Billing information in almost the same manner. Would like 
		out.println("<table class=\"table table-hover\">");
		out.println("<thead><tr><th>Payment Method</th><th>Payment Details</th><th>Select</th></tr></thead>");
		out.println("<tbody>");
		
		//three while methods & queries, one for each payment type; Visa, Paypal, Bank Transfer. 
		//@TODO Would eventually like to make this a bit prettier, ie have different table for each PayType
		rst = data.getVisa(uid);
		while(rst.next()){
			String cardNum = rst.getString(1);
			String col1 = String.format("<tr><td>Visa</td><td>Card Number: %s</td>", cardNum);
			String col2 = ("<td><input type=\"radio\" name=\"radPay\" value='visa_"+cardNum+"'></td></tr>");
			String row = col1.concat(col2);
			out.print(row); 
		}
		
		rst = data.getPayPal(uid);
		while(rst.next()){
			String accountNum = rst.getString(1);
			String col1 = String.format("<tr><td>Pay Pal</td><td>Account Number: %s</td>", accountNum);
			String col2 = ("<td><input type=\"radio\" name=\"radPay\" value='pp_"+accountNum+"'></td></tr>");
			String row = col1.concat(col2);
			out.print(row); 
		}
		
		rst = data.getBank(uid);
		while(rst.next()){
			String accountNum = rst.getString(1);
			String col1 = String.format("<tr><td>Bank Transfer</td><td>Account Number: %s</td>", accountNum);
			String col2 = ("<td><input type=\"radio\" name=\"radPay\" value='bank_"+accountNum+"'></td></tr>");
			String row = col1.concat(col2);
			out.print(row); 
		}
		out.println("</tbody></table>");
		%>
	</form>

<!--Add new Visa button-->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myVisa">Enter new VISA &nbsp <span class="glyphicon glyphicon-credit-card"></span></button>
<div id="myVisa" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Enter new Visa</h4>
      </div>

			<form class="addVisa">
					<div class="form-group">
						<label>Card Number</label> <input type="text" name="cardNum"
							placeholder="1111222233334444" class="form-control" required>
					</div>
					<div class="row">
						<label>Expiry</label> <input type="text" name="expiry"
							placeholder="2012-01-01" class="form-control" required>
					</div>
					<div class="row">
						<label>CVV</label> <input type="number" name="cvv"
							placeholder="123" class="form-control" required>
					</div>
					<div class="modal-footer">
					<button class="btn btn-lg btn-primary btn-block" id="submitVisa" data-dismiss="modal">Submit</button>
					<!-- <input type="submit" class="btn btn-lg btn-primary btn-block" data-dismiss="modal" value="Submit Address"> -->
					</div>
			</form>
	</div>
  </div>
</div>
<script>
$(function() {
 $("button#submitVisa").click(function(){
         $.ajax({
     		type: "POST",
 			url: "addVisa.jsp",
 			data: $('form.addVisa').serialize(),
         	success: function(msg){
                console.log($('form.addVisa').serialize());
                location.reload();
         	},
 		error: function(){
 				console.log("Error");
 				location.reload();
 		}
     });
 });
});
</script>

<!--Add new PayPal button-->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myPayPal">Enter New PayPal Account &nbsp <span class="glyphicon glyphicon-credit-card"></span></button>
<div id="myPayPal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Enter New PayPal</h4>
      </div>

			<form class="addPayPal">
					<div class="form-group">
						<label>Account Number</label> <input type="text" name="accountNum"
							placeholder="1111222233334444" class="form-control" required>
					</div>
					<div class="modal-footer">
					<button class="btn btn-lg btn-primary btn-block" id="submitPayPal" data-dismiss="modal">Submit</button>
					<!-- <input type="submit" class="btn btn-lg btn-primary btn-block" data-dismiss="modal" value="Submit Address"> -->
					</div>
			</form>
	</div>
  </div>
</div>
<script>
$(function() {
 $("button#submitPayPal").click(function(){
         $.ajax({
     		type: "POST",
 			url: "addPayPal.jsp",
 			data: $('form.addPayPal').serialize(),
         	success: function(msg){
                console.log($('form.addPayPal').serialize());
                location.reload();
         	},
 		error: function(){
 				console.log("Error");
 				location.reload();
 		}
     });
 });
});
</script>

<!--Add new Bank Transfer button-->
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myBT">Enter new Bank Transfer &nbsp <span class="glyphicon glyphicon-credit-card"></span></button>
<div id="myBT" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Enter new Bank Transfer</h4>
      </div>

			<form class="addBT">
					<div class="form-group">
						<label>Account Number</label> <input type="number" name="accountNum"
							placeholder="1111222233334444" class="form-control" required>
					</div>
					<div class="row">
						<label>Bank Name</label> <input type="text" name="bankName"
							placeholder="TD, RBC..." class="form-control" required>
					</div>
					<div class="row">
						<label>Branch Number</label> <input type="number" name="branchNum"
							placeholder="123" class="form-control" required>
					</div>
					<div class="modal-footer">
					<button class="btn btn-lg btn-primary btn-block" id="submitBT" data-dismiss="modal">Submit</button>
					<!-- <input type="submit" class="btn btn-lg btn-primary btn-block" data-dismiss="modal" value="Submit Address"> -->
					</div>
			</form>
	</div>
  </div>
</div>
<script>
$(function() {
	var valid = true;
 $("button#submitBT").click(function(){
			  $.ajax({
					type: "POST",
					url: "addBT.jsp",
		 			data: $('form.addBT').serialize(),
				    success: function(msg){
				          console.log($('form.addBT').serialize());
				          location.reload();
				    },
				 	error: function(){
				 		   console.log("Error");
				 	       location.reload();
				 	}
				});
	});
});
</script>


<br><br><br><h2>Purchases</h2><br>
<%
//Print order again for double confirmation. If they don't like it, back to cart to remove items.
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null){
	out.println("<h2>Your shopping cart is empty!</h2>");
	productList = new HashMap<String, ArrayList<Object>>();
} else {
	
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<table class=\"table table-hover\">");
    out.println("<thead><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
    out.println("<th class=\"text-center\">Price</th><th class=\"text-center\">Total</th><th></th></tr></thead><tbody>");
	
    /*each table row is a product*/
    
    //If want to add image, will have to pass that info in the product list OR query db based on product id
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
		out.println("</tr>");
		total = total +pr*qty;
	}
	out.print("<tfoot><tr><td> </td><td> </td><td> </td><td><h5>Subtotal</h5><h3>Grand Total: </h3></td>");
    out.print("<td class=\"text-right\"><h5><strong>"+currFormat.format(total)+"</strong></h5><h3>"+currFormat.format(total)+"</h3></td></tr>");
	out.print("<tr><td> </td><td> </td><td></td><td>");
	out.print("<button type=\"button\" class=\"btn btn-default\" onclick=\"window.location.href='cart.jsp'\"><span class=\"glyphicon glyphicon-shopping-cart\"></span> Back to Cart</button>");
	out.print("</td>");
	out.print("<td>");
	
	//On submit of this button, info is passed on to confirmOrder.jsp
	out.print("<button id=\"confirmOrder\" type=\"button\" class=\"btn btn-success\" >Confirm Order <span class=\"glyphicon glyphicon-play\"></span></button>");
	out.print("</td></tr>");
	out.print("</tfoot>");
	out.print("</table>");
	
	//Hidden field to pass the total
	out.print("<input id=\"hiddenTotal\" type=\"hidden\" name=\"total\" value='"+total+"'>");
}
%>


<!--confirm order button click-->  
<script>
	$(function() {
	 $("button#confirmOrder").click(function(){
		 if (!$("input[name='radAdd']:checked").val()) {
			 	alert('Please select a shipping address');
			} else if(!$("input[name='radPay']:checked").val()){
				alert('Please select a payment method');
			} else {
		        var add = $('form#selectAddress').serialize();
		        var pay = $('form#selectPay').serialize();
		        var total = $('#hiddenTotal').serialize();
		        var submitString = add+"&"+pay+"&"+total;
		        console.log(submitString);
			 	$.ajax({
		     		type: "POST",
		 			url: "confirmOrder.jsp",
		 			data: submitString,
		         	success: function(msg){
						console.log("Success");
						window.location.replace("profilehome.jsp");
		         	},
		 			error: function(){
		 				console.log("Error");
		 			}
			 });
	 	}
	});
});
</script>
  
    </div>
	<div class="col-sm-2">
   </div>
  </div>
</div>


<%@include file="footer.jsp" %>

</body>

</html>