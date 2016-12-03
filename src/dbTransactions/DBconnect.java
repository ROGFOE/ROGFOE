package dbTransactions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect{

	public Connection con;
	
	/**
	 * Makes a connection to the database and returns connection to caller.
	 * 
	 * @return
	 * 		connection
	 * @throws SQLException
	 * 		if an error occurs
	 */
	public Connection connect() throws SQLException
	{
//		String url = "jdbc:mysql://localhost/rogfoe";
//	    String uid = "root";
//	    String pw = "";
	    
	    String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_jrogers";
	    String uid = "jrogers";
	    String pw = "40520158";
	    
	    try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		System.out.println("Connecting to database.");
		// Note: Must assign connection to instance variable as well as returning it back to the caller
		con = DriverManager.getConnection(url, uid, pw);
		return con;		                       
	}
	
	/**
	 * Closes connection to database.
	 */
	public void close()
	{
		System.out.println("Closing database connection.");
		try
		{
			if (con != null)
	            con.close();
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}
}
