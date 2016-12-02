<%@page import="dbTransactions.FetchData"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
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
	
	//Create and insert order
 	FetchData data = new FetchData();
 	data.connect();
 	int key = data.insertOrder(aid, aid, total, 0.00, total, payType, uid);
 	
 	
	//Update every organ's OID to contain this OID GET GENERATED KEYS
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
			
			String id = (String) product.get(0);
			int OrganID = Integer.parseInt(id);
			//Update organ OID to contain this orders id
			System.out.println("Organ id is " + product.get(0));
			data.updateOrganOID(key, OrganID);
		}
	}
			//Empty cart
			session.setAttribute("productList", null);
 
	
	//Remove specified products from stock.

	//Empty cart

%>
</html>

