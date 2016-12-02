<%@page import="dbTransactions.FetchData"%>
<!DOCTYPE html>
<html>
<%@include file="auth.jsp" %>
<%
	//UID 
	session = request.getSession(true);
	int uid = (int)session.getAttribute("uid");
	
	//AID 
	String address = request.getParameter("radAdd");
	String[] add = address.split("_"); 
	address = add[1];
	int aid = Integer.parseInt(address);
	
	//Payment
	String pay = request.getParameter("radPay");
	String[] p = pay.split("_"); 
	String payType = p[0];
	String payKey = p[1];
	
	System.out.println(payType);
	if(payType.equals("visa")){
		payType = "Visa";
	} else if (payType.equals("pp")){
		payType = "PayPal";
	} else {
		payType = "BankTransfer";
	}
	System.out.println(payType);
	
	//total
	double total = Double.parseDouble(request.getParameter("total"));
	
	//Create and make order
 	FetchData data = new FetchData();
 	data.connect();
 	int rst;
 	rst = data.insertOrder(aid, aid, total, 0.00, total, payType, uid);
 
	
	//Remove specified products from stock.
	
	//Update every organ's OID to contain this OID GET GENERATED KEYS
	
	
	
	/* @SuppressWarnings({"unchecked"})
	HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

	if (productList == null){
		out.println("<h2>Your shopping cart is empty!</h2>");
		productList = new HashMap<String, ArrayList<Object>>();
	} else {
		
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();

		out.println("<table class=\"table table-hover\">");
	    out.println("<thead><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	    out.println("<th class=\"text-center\">Price</th><th class=\"text-center\">Total</th><th></th></tr></thead><tbody>");
		
	    
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
	}
 */	
	
	//Empty cart

%>
</html>

