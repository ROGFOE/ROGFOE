package dbTransactions;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by cjbro on 12/3/2016.
 */
public class DBconnect {
    
	public Connection con;
	
    /**
     * Makes a connection to the database and returns connection to caller.
     *
     * @return
     * 		connection
     * @throws SQLException
     * 		if an error occurs
     */
     public Connection connect() throws URISyntaxException, SQLException {
    	System.out.println("Trying to connect to the database...");
    	
        URI jdbUri = new URI(System.getenv("JAWSDB_MARIA_URL"));
        System.out.println("jdbUri: "+ jdbUri);
        String username = jdbUri.getUserInfo().split(":")[0];
        System.out.println("username: "+ username);
        String password = jdbUri.getUserInfo().split(":")[1];
        System.out.println("password: "+ password);
        String port = String.valueOf(jdbUri.getPort());
        System.out.println("port: "+ port);
        String jdbUrl = "jdbc:mysql://" + jdbUri.getHost() + ":" + port + jdbUri.getPath();
        System.out.println("jdbUrl: "+ jdbUrl);
        
        // Note: Must assign connection to instance variable as well as returning it back to the caller
        con = DriverManager.getConnection(jdbUrl, username, password);
        System.out.println("Connected to database. Returning Connection.");
        return con;
    }
     
// 	public Connection connect() throws SQLException
//    {
////		String url = "jdbc:mysql://localhost/rogfoe";
////	    String uid = "root";
////	    String pw = "";
//
//        String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
//        String uid = "jrogers";
//        String pw = "40520158";
//
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        System.out.println("Connecting to database.");
//        // Note: Must assign connection to instance variable as well as returning it back to the caller
//        con = DriverManager.getConnection(url, uid, pw);
//        return con;
//    }

        

    /**
     * Closes connection to database.
     */
    public void close()
    {
        try
        {
        	System.out.println("Attempting to close database connection.");
            if (con != null) {
            	con.close();
            	System.out.println("Database connection successfully closed.");
            }
                
        }
        catch (SQLException e)
        {
            System.out.println(e);
        }
    }
}
