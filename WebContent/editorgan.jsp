<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Edit Organ</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body style="font-family: 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">
<%@include file="navbar.jsp" %>
<%@include file="authBoth.jsp" %>
<h1>Edit Organ</h1>
<div class="row content">
   <div class="col-sm-3">
   </div>
    <div class="col-sm-6">

<%

			//Gather User information from request			
			String id = request.getParameter("idfromedit");
			int id2 = Integer.parseInt(id);

			FetchData data = new FetchData();
			//Try to connect to db
			try (Connection con = data.connect();){

				String sql = ("SELECT * FROM Organ WHERE OrgID = ?");	
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setInt(1, id2);
				ResultSet rst = pst.executeQuery();

				while (rst.next()) {
%>
			<form method="get" action="editorgansuccess.jsp">	
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Organ Name</label>
			<input type="text" name="organname" value="<% out.print(rst.getString("OName")); %>" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-4 form-group">
			<label>List Price</label>
			<div class="input-group">
			<span class="input-group-addon">$</span>
			<input type="text" name="listprice" value="<% out.print(rst.getDouble("UnitPrice")); %>" class="form-control" required>	
			</div>
			</div>
						
			<div class="col-sm-4 form-group">
			<label>Size (Grams)</label>
			<input type="text" name="size" value="<% out.print(rst.getInt("Size")); %>" class="form-control" required>
			</div>
						
			<div class="col-sm-4 form-group">
  			<label>Blood Type</label>
  			<select class="form-control" name="blood" required>
  			<option value="<% out.print(rst.getString("OBloodType")); %>" selected><% out.print(rst.getString("OBloodType")); %></option>
   			 <option value="A">A</option>
  			  <option value="AB">AB</option>
    		<option value="B">B</option>
    		<option value="O">O</option>
 			 </select>
			</div>

			</div>
			
			<div class="row">
			<div class="col-sm-6 form-group">
  			<label>Category</label>
  			<select class="form-control" name="category" required>
  			<option value="<% out.print(rst.getString("Category")); %>" selected><% out.print(rst.getString("Category")); %></option>
   			 <option value="body">Body</option>
  			  <option value="gland">Gland</option>
    		<option value="lower middle body">Lower Middle Body</option>
    		<option value="middle body">Middle Body</option>
    		<option value="unknown">Unknown</option>
    		<option value="upper body">Upper Body</option>
    		<option value="upper middle body">Upper Middle Body</option>
 			 </select>
			</div>
			
			<div class='col-sm-6'>
            <label>Removal Date</label>
			<input type="text" name="date" value="<% out.print(rst.getString("RemovalDate")); %>" class="form-control" required>	
			</div>
			
			</div>
			
			<div class="row">
			<div class="col-sm-6 form-group">
			<label>Doctor</label>
			<input type="text" name="doctor" value="<% out.print(rst.getString("CertDoctor")); %>" class="form-control" required>
			</div>
			
			<div class="col-sm-6 form-group">
			<label>Hospital</label>
			<input type="text" name="hospital" value="<% out.print(rst.getString("CertHospital")); %>" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Image URL</label>
			<input type="text" name="image" value="<% out.print(rst.getString("Picture")); %>" class="form-control" required>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 form-group">
			<label>Description</label>
  			<input type="text" name="desc" value="<% out.print(rst.getString("Desc")); %>" class="form-control" required>
			</div>
			</div>
			<p>&nbsp;</p>
			<input type="hidden" name="organid" value="<% out.print(rst.getInt("OrgID")); %>">
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="Save Changes">
      </form>	


<% 			
con.close();
				}
			} catch (SQLException ex){
				System.out.println(ex);
			}

%>
</div>
 <div class="col-sm-3">
   </div>
   </div>
<%@include file="footer.jsp" %>

</body>

</html>