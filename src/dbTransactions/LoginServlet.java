package dbTransactions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by cjbro on 12/3/2016.
 */
@WebServlet(
    name = "LoginServlet",
    urlPatterns = { "/LoginServlet"}
)
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Connection con;


    public void init() throws ServletException {
        DBconnect db = new DBconnect();
        try {
            con = db.connect();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("pw");

        PreparedStatement stmt = null;
        String sql = "SELECT UID, Password, AccType FROM User WHERE Uemail = ? AND Password = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        ResultSet rst;

        try {
            rst = stmt.executeQuery();
            if (rst.next()) {
                session.setAttribute("loggedIn",username);
                switch (rst.getString(3)) {
                    case "Admin":
                        session.setAttribute("userType","Admin");
                        session.setAttribute("uid", rst.getInt(1));
                        response.sendRedirect("adminhome.jsp");
                        break;
                    case "Doctor":
                        session.setAttribute("userType","Doctor");
                        session.setAttribute("uid", rst.getInt(1));
                        response.sendRedirect("doctorhome.jsp");
                        break;
                    case "Customer":
                        session.setAttribute("userType","Customer");
                        session.setAttribute("uid", rst.getInt(1));
                        response.sendRedirect("checkOut.jsp");
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                        break;
                }
            }
            else {
                // TODO: 12/4/2016 Verify this
                session.setAttribute("invalidCreds","Could not connect to the system using that username/password.");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
