package dbTransactions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by cjbro on 12/3/2016.
 * Handles login logic and validation.
 */
@WebServlet(
    name = "LoginServlet",
    urlPatterns = { "/LoginServlet"}
)
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;

    @Override
	public void init() throws ServletException {
    	DBconnect db = new DBconnect();
    	System.out.println("Initializing LoginServlet.");
        try { 
        	con = db.connect();
            System.out.println("Successful database connection established.");
        } catch (SQLException | URISyntaxException e) {
            e.printStackTrace();
        }
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("pw");
        PreparedStatement stmt = null;
        System.out.println("Connected to database. Returning connection.");
        String sql = "SELECT UID, Password, AccType FROM User WHERE Uemail = ? AND Password = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            System.out.println("Prepared statement set.");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        ResultSet rst;
        try {
            rst = stmt.executeQuery();
            System.out.println("Prepared statement executed successfully.");
            if (rst.next()) {
            	System.out.println("User: "+username+" successfully logged in.");
                session.setAttribute("loggedIn",username);
                boolean invalidCreds = session.getAttribute("invalidCreds") != null;
                switch (rst.getString(3)) {
                    case "Admin":
                    	System.out.println("User: "+username+" has Admin access.");
                        session.setAttribute("userType","Admin");
                        session.setAttribute("uid", rst.getInt(1));
                     // basically, redirect to checkout if they have something in their cart, or their profile otherwise
                        if(!invalidCreds) {
                        	System.out.println("Nothing in cart. Sending to adminhome.jsp.");
                        	response.sendRedirect("adminhome.jsp");
                        }
                        else {
                        	System.out.println("Sending to checkout.jsp.");
                        	response.sendRedirect("checkout.jsp");
                        }                      	
                        break;
                    case "Doctor":
                    	System.out.println("User: "+username+" has Doctor access.");
                        session.setAttribute("userType","Doctor");
                        session.setAttribute("uid", rst.getInt(1));
                        // basically, redirect to checkout if they have something in their cart, or their profile otherwise
                        if(!invalidCreds) {
                        	System.out.println("Nothing in cart. Sending to doctorhome.jsp.");
                            response.sendRedirect("doctorhome.jsp");
                        }
                        else {
                        	System.out.println("Sending to checkout.jsp.");
                            response.sendRedirect("checkout.jsp");
                        }
                        break;
                    case "Customer":
                    	System.out.println("User: "+username+" has Customer access.");
                        session.setAttribute("userType","Customer");
                        session.setAttribute("uid", rst.getInt(1));

                        // basically, redirect to checkout if they have something in their cart, or their profile otherwise
                        if(!invalidCreds) {
                        	System.out.print("Nothing in cart. Sending to profilehome.jsp.");
                            response.sendRedirect("profilehome.jsp");
                        }
                        else {
                        	System.out.println("Sending to checkout.jsp.");
                            response.sendRedirect("checkout.jsp");
                        }
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                        break;
                }
            }
            else {
                session.setAttribute("invalidCreds","Could not connect to the system using that username/password.");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
