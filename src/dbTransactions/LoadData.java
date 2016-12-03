package dbTransactions;
import java.io.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

/**
 * Loads the order database using code.
 */
public class LoadData extends DBconnect
{	

	
	public void loadData() throws Exception
	{	
//		Change this to your own file path
		System.out.println("CHANGE THIS TO YOUR OWN FILE PATH.");
		String fileName = "C:/users/cjbro/workspace/rogfoe/data/rogfoeDB.sql";
		DBconnect con = new DBconnect();
		Connection cnx = con.connect();
	    try
	    {
	        // Create statement
	        Statement stmt = cnx.createStatement();
	        
	        Scanner scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;
	            System.out.println(command);        // Uncomment if want to see commands executed            
	            try
	            {
	            	stmt.execute(command);
	            }
	            catch (Exception e)
	            {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
	            	System.out.println(e);
	            }
	        }	 
	        scanner.close();
	    }
	    catch (Exception e)
	    {
	        System.out.println(e);
	    }  
	    
	}
	
}
