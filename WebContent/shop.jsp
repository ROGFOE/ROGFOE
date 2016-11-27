<%@page import="dbTransactions.FetchData"%> 
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
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

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px;
}

/* Set gray background color and 100% height */
.sidenav {
  	padding-top: 20px;
  	background-color: white;
  	height: 100%;
}

@media screen and (max-width: 767px) {

	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
  		height:auto;
	} 
	
}

/* for js search functionality */
.organ-list tr[visible='false'],
.no-result{
	display:none;
}
.organ-list tr[visible='true']{
	display:table-row;
}

.container.shop {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.content {
	width: 83.3333333%;
}

div.form-group.organ-search {
	width: 25%;
}

input.search.form-control {
	padding-top: 6px;
    padding-right: 12px;
    padding-bottom: 0px;
    padding-left: 12px;
}

table.organ-list th,td {
	text-align: center;
}

body > div > div > div.row.form-group.filter-list > ul.nav.nav-pills {
	margin: 0 auto;
	text-align: center;
	width: 50%;
}
</style>
</head>

<body>

<%@include file="navbar.jsp" %>

<%  
// Set up the db connection and ability to grab data
FetchData data = new FetchData();
data.connect();
ResultSet rst;
%>

<div class="container shop">
  
	<h1 style="text-align:center">Shop</h1><br />
	
		<!-- js search -->
 		<div class="form-group organ-search">
 			<span class="counter text-center"></span>
 			<input type="text" class="search form-control" placeholder="Search by Organ">
 		</div>
 		
	    <!-- Navbar -->
	    <div class="row form-group filter-list">	    
			<ul class="nav nav-pills">				
				<li class="dropdown organs">
					<form action="shop.jsp" method="get" id="organ">
			    	<select class="form-control" onchange="this.form.submit()" name="organ" form="organ">
			    		<option value="" disabled selected>Organ</option>
					<!-- Getting list of organs for dropdown menu -->
					
<% 					rst = data.listOrganNames();
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
   					</form>
   					
 				</li><!-- dropdown organs -->
 					
				<li class="dropdown categories">
					<form action="shop.jsp" method="get" id="cat">
			    	<select class="form-control" onchange="this.form.submit()" name="cat" form="cat">
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
   					</form>
   					
 				</li><!-- dropdown categories --> 	
	
				<li class="dropdown blood-type">
					<form action="shop.jsp" method="get" id="blood">
				    <select class="form-control" onchange="this.form.submit()" name="blood" form="blood">
				    	<option value="" disabled selected>Blood Type</option>
				    	<option value="A">A</option>
						<option value="AB">AB</option>
						<option value="B">B</option>
						<option value="O">O</option>
				    </select>
				    </form>
				    
			  	</li><!-- dropdown blood-type -->
 
				<li class="dropdown price-ranges">
					<form action="shop.jsp" method="get" id="price">
					<select class="form-control" onchange="this.form.submit()" name="price" form="price">
						<option value="" disabled selected>Price Range</option>
				    	<option value="<500">Less than $500</option>
						<option value="BETWEEN 500 AND 1000">$500 - $1000</option>
						<option value="BETWEEN 1000 AND 10000">$1000 - $10,000</option>
						<option value=">10000">More than $10,000</option>
				    </select>
				    </form>
				    
				</li><!-- dropdown price-ranges -->
 
				<li class="dropdown sizes">
					<form action="shop.jsp" method="get" id="size">
					<select class="form-control" onchange="this.form.submit()" name="size" form="size">	
						<option value="" disabled selected>Size (grams)</option>												
				    	<option value="1">Under 5g</option>
						<option value="2">5g - 100g</option>
						<option value="3">100g - 1000g</option>
						<option value="4">Over 1000g</option>
					</select>
					</form>
					
				</li><!-- dropdown sizes -->
			</ul><!-- nav nav-pills -->
   		</div><!-- row filter-list -->

		
	<div class="content">
   
	    <div class="col-sm-12 text-left"> 
	
<%	    
/* List Products */
/* Print out the table headers */
out.print("<br><table class=\"table table-hover organ-list\">"+
			"<thead><tr>"+
				"<th>Organ</th>"+
				"<th>Price</th>"+
				"<th>Size (grams)</th>"+
				"<th>Removal Date</th>"+
				"<th>Blood Type</th>"+
				"<th>Description</th>"+
				"<th>Picture</th>"+
				"<th>Doctor</th>"+
				"<th>Hospital</th>"+
				"<th>Category</th>"+
			"</tr></thead><tbody>");

// filter dropdown values
rst = data.listOrganDetails();
String def = data.getOrganTable(rst);
	       	
ArrayList<String> resp = new ArrayList<String>();
resp.add(request.getParameter("organ"));
resp.add(request.getParameter("cat"));
resp.add(request.getParameter("blood"));
resp.add(request.getParameter("price"));
resp.add(request.getParameter("size"));
resp.add(def);

// decide what to show based on the set filter values
for (int i=0; i<resp.size(); i++){
	String table;
	if (resp.get(i)!=null) {
		switch (i) {
			case 0: /* organ */
				rst = data.filterOrganName(resp.get(i));
				table = data.getOrganTable(rst);
				out.print(table);
				break;
			case 1: /* cat */
				rst = data.filterOrganCat(resp.get(i));
				table = data.getOrganTable(rst);
				out.print(table);
				break;
			case 2: /* blood */
				rst = data.filterBloodType(resp.get(i));
				table = data.getOrganTable(rst);
				out.print(table);
				break;
			case 3: /* price */
				rst = data.filterOrganName(resp.get(i));
				table = data.getOrganTable(rst);
				out.print(table);
				break;
			case 4: /* size*/
				rst = data.listSizeRange(resp.get(i));
				table = data.getOrganTable(rst);
				out.print(table);
				break;
			case 5: /* everything */
				table = resp.get(i);
				out.print(table);
			default:
				break;				
			}
	}
}

out.print("</tbody></table></div>");
%>
	     
	    </div><!-- col-sm-12 text-left -->	    	
	</div><!-- content -->
</div><!-- container text-center -->

<%@include file="footer.jsp" %>

<!-- Adds search to product list w/o querying the database -->
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

</body>

</html>