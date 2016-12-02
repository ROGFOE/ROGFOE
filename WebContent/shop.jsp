<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@page import="dbTransactions.FetchData"%> 
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Shop</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
		
<style>

/* for js search functionality */
.organ-list tr[visible='false'],
.no-result{
	display:none;
}
.organ-list tr[visible='true']{
	display:table-row;
}

/* main page styling */
div.row.form-group.organ-search {
	width: 25%;
	margin: 0 auto; 
 	text-align: center; 
}
div.form-group.filter-list > ul {
	width: 55%;
	margin: auto; 
 	text-align: center; 
}
input.search.form-control {
	padding-top: 6px;
    padding-right: 12px;
    padding-bottom: 0px;
    padding-left: 12px;
}
div.row.form-group.organ-search > input {
	height: 40px;
}
div.row.product-list {
	width: 75%;
	margin: 0 auto;
}

/* table styling */
tbody > tr.row.shop.list-row > td.pic > * { 
 	margin-top: 20px; 
 	margin-bottom: 30px; 
} 
td.OName {
	text-align: left;
}
td.price {
	text-align: center;
}
span.OName {
	font-size: 1.6em;
	color: #0066c0;
}
span.desc {
	font-size: 1.2em;
}
span.price {
	font-weight: bold;
	font-size: 1.1em;
	color: #b12704;
}
span.cat {
	font-weight: bold;
	color: #0066c0;
}
span.buy > a {
	color: #0066c0;
}
span.size, span.blood {
	color: #949494;
}

button.apply-filter {
	margin-top: 5px;	
}
</style>

</head>
<body>

<%@include file="navbar.jsp" %>

<div class="shop container-fluid"><!-- wraps everything to footer -->

	<h1 style="text-align:center">Shop</h1><br />

		<!-- js search -->
		<div class="row form-group organ-search">
			<span class="col-sm-12 counter text-center"></span>
			<input type="text" class="col-sm-12 search form-control" placeholder="Search by Organ">
		</div>
		
		<br />
		
    <!-- Filters -->
<form action="shop.jsp" method="get" id="filter">
    <div class="form-group filter-list">   
		<ul class="row nav nav-pills">
			<li class="col-sm-1"></li>			
			<li class="dropdown organs col-sm-3">
				
		    	<select class="form-control" name="organ" form="filter">
		    		<option value="" disabled selected>Organ</option>
				<!-- Getting list of organs for dropdown menu -->
				
<%

//Set up the db connection and ability to grab data
FetchData data = new FetchData();
data.connect();
ResultSet rst;
rst = data.listUniqueOrgans();

				while(rst.next())
				{	
					String organ = rst.getString(1);
					out.print(				
					"<option value=\""+organ+"\">"
						+organ+
					"</option>");			
				}
%>			
  					</select>
  					
  					
				</li><!-- dropdown organs -->
					
			<li class="dropdown categories col-sm-3">
				
		    	<select class="form-control" name="cat" form="filter">
		    		<option value="" disabled selected>Category</option>
				<!-- Getting list of organ categories for dropdown menu -->
<% 					rst = data.listUniqueCategories();
				while(rst.next())
				{	
					String cat = rst.getString(1);
					String Cat = cat.substring(0, 1).toUpperCase() + cat.substring(1); //make first char. upper case
					out.print(				
					"<option value=\""+Cat+"\">"
						+Cat+
					"</option>");			
				}
%>
  					</select>
  					
  					
				</li><!-- dropdown categories --> 	

				<li class="dropdown blood-type col-sm-3">
				
			    <select class="form-control" name="blood" form="filter">
			    	<option value="" disabled selected>Blood Type</option>
			    	<option value="A">A</option>
					<option value="AB">AB</option>
					<option value="B">B</option>
					<option value="O">O</option>
			    </select>
			    
			    
		  	</li><!-- dropdown blood-type -->
			
			<li class="col-sm-1">
				<button type="submit" class="btn btn-primary btn-xs apply-filter">Apply Filters</button>
			</li>
		</ul><!-- nav nav-pills -->
  	</div><!-- row -->
</form>

	<div class="row product-list">	 
<%	    
/* List Products */
/* Print out the table headers */
out.print("<table class=\"table table-hover organ-list\">"+
			"<thead><tr>"+
			"</tr></thead><tbody>");

// get all products as default printout
rst = data.listAllOrgans();
String allProduct = data.getOrganTable(rst);

// bunch the queries together
HashMap<String,String> filters = new HashMap<String,String>();
filters.put("OName", request.getParameter("organ"));
filters.put("Category", request.getParameter("cat"));
filters.put("OBloodType", request.getParameter("blood"));
// filters.put("UnitPrice", request.getParameter("price"));
// filters.put("Size", request.getParameter("size"));

// clean the null queries out of the list
while (filters.values().remove(null));

// decide what to show based on the filter query values
if(filters.isEmpty()){
	out.print(allProduct);
}
else{
	rst = data.applyShopFilters(filters);
	String table = data.getOrganTable(rst);
	out.print(table);
}

out.print("</tbody></table>");
%>
	</div><!-- row -->	
	
</div><!-- container-fluid shop -->

<script type="text/javascript" defer="defer">
// Adds search to product list w/o querying the database
// adapted from: https://codepen.io/adobewordpress/pen/gbewLV
$(document).ready(function() {
	
 	$(".search").keyup(function () {
 		
	var searchTerm = $(".search").val();
	if(searchTerm.length>0){	
		var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
 		$.extend($.expr[':'], {'containsi': function(elem, i, match, array){		
        	return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    	}});
    
		$(".organ-list tbody tr").attr('visible', '');
		
  		$(".organ-list tbody td.OName:containsi('" + searchSplit + "')").each(function(e){			
			$(this).parent().attr('visible','true');
  		});
  
  		$(".organ-list tbody tr[visible='']").each(function(e){
    		$(this).attr('visible','false');
  		});
  		
 		var jobCount = $('.organ-list tbody tr.list-row[visible="true"]').length;
  		$('.counter').text(jobCount + ' product(s)');

		if(jobCount == '0') {$('.no-result').show();}
		else {$('.no-result').hide();}    	
	}
	else{
		$(".organ-list tbody tr").each(function(e){
		    $(this).attr('visible','').attr('display','table-row');
		  	$('.counter').text('');
		  	$('.no-result').hide();
		});
	}
 
	});
});
</script>
<%@include file="footer.jsp" %>
</body>
</html>