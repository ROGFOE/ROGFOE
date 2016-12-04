<!DOCTYPE html>
<html>
<%
	boolean loggedIn = session.getAttribute("loggedIn") != null;
	String accType = (String)session.getAttribute("userType");
	if (!loggedIn || (!accType.equals("Admin") && !accType.equals("Doctor")))
	{
		System.out.println(accType);
        String unauthorized = "You have not been authorized to access the URL "+request.getRequestURL().toString();
        session.setAttribute("unauthorized",unauthorized);
        // response.sendRedirect("login.jsp");
 		RequestDispatcher disp = request.getRequestDispatcher("/login.jsp");
		disp.forward(request,response);
	}
%>
</html>

