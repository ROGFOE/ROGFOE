<!DOCTYPE html>
<html>
<%
	boolean loggedIn = session.getAttribute("loggedIn") != null;
	if (!loggedIn)
	{
        String unauthorized = "You have not been authorized to access the URL "+request.getRequestURL().toString();
        session.setAttribute("unauthorized",unauthorized);
        // response.sendRedirect("login.jsp");
 		RequestDispatcher disp = request.getRequestDispatcher("/login.jsp");
		disp.forward(request,response);
	}
%>
</html>

