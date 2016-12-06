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
