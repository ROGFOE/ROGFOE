<%@page import="dbTransactions.FetchData"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="home.jsp">
      <img src="images/homelogo.png" alt="Image" style="width:53px; height:53px;">
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="location.jsp">Locations</a></li>
        <li><a href="shop.jsp">Shop</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
    <%
    // user context dependent navbar header
    if(null != session.getAttribute("userType")){
  	  switch(session.getAttribute("userType").toString()) {
      	case "Admin":
   			out.print("<li><a href=\"profilehome.jsp\">Profile</a></li>");
			out.print("<li><a href=\"adminhome.jsp\">Admin</a></li>");
			out.print("<li><a href=\"cart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span> Cart</a></li>");
			out.print("<li><a href=\"logout.jsp\">Logout</a></li>");
			break;
 		case "Doctor":
 			out.print("<li><a href=\"profilehome.jsp\">Profile</a></li>");
 			out.print("<li><a href=\"doctorhome.jsp\">Doctor</a></li>");
 			out.print("<li><a href=\"cart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span> Cart</a></li>");
 			out.print("<li><a href=\"logout.jsp\">Logout</a></li>");
 			break;
 		case "Customer":
 			out.print("<li><a href=\"profilehome.jsp\">Profile</a></li>");
 			out.print("<li><a href=\"cart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span> Cart</a></li>");
 			out.print("<li><a href=\"logout.jsp\">Logout</a></li>");
 			break;
 		default:
 			out.print("<li><a href=\"Signup.jsp\">Sign Up</a></li>");
 			out.print("<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
 			break;
      	}
    }
    else {
    	out.print("<li><a href=\"Signup.jsp\">Sign Up</a></li>");
		out.print("<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
    }
    
    %>      	       
      </ul>
    </div>
  </div>
</nav>

<div class="page-wrap"><!-- (for global sticky footer) -->

