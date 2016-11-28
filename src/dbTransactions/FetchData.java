package dbTransactions;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;

public class FetchData extends DBconnect{
	
	/**
	 * 
	 * @return
	 *       ResultSet of all organ names in the rogfoe database.
	 */
    public ResultSet listOrganNames() throws SQLException
    {
    	System.out.println("\nExecuting listOrganNames.");
    	String sql = "SELECT OName FROM Organ";
    	PreparedStatement pst = con.prepareStatement(sql);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet of unique organ categories sorted ascending from the rogfoe database.
	 */
    public ResultSet listUniqueCategories() throws SQLException
    {
    	System.out.println("\nExecuting listUniqueCategories.");
    	String sql = "SELECT DISTINCT Category FROM Organ ORDER BY Category ASC";
    	PreparedStatement pst = con.prepareStatement(sql);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet of organs in given size range sorted ascending by size from the rogfoe database.
	 */
    public ResultSet listSizeRange(String range) throws SQLException
    {
    	System.out.println("\nExecuting listSizeRange.");
    	System.out.println("Input range: "+range);
    	String sql = "SELECT * FROM Organ WHERE size < ? AND size > ? ORDER BY Size ASC";
    	PreparedStatement pst = con.prepareStatement(sql);
    	int val = Integer.parseInt(range);
    	switch (val) {
		case 1:
			pst.setInt(1, 5);
			pst.setInt(2, 0);
			break;
		case 2:
			pst.setInt(1, 100);
			pst.setInt(2, 5);
			break;
		case 3:
			pst.setInt(1, 1000);
			pst.setInt(2, 100);
			break;
		case 4:
			pst.setInt(1, 100000);
			pst.setInt(2, 1000);
			break;
		default:
			break;
		}

    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet of all organ details randomly sorted from the rogfoe database.
	 */
    public ResultSet listOrganDetails() throws SQLException
    {
    	System.out.println("\nExecuting listOrganDetails.");
    	String sql = "SELECT * FROM Organ ORDER BY RAND()";
    	PreparedStatement pst = con.prepareStatement(sql);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet filtered according to blood type from the rogfoe database.
	 */
    public ResultSet filterBloodType(String type) throws SQLException
    {
    	System.out.println("\nExecuting listBloodType.");
    	String sql = "SELECT * FROM Organ WHERE OBloodType = ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setString(1, type);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet filtered according to organ name from the rogfoe database.
	 */
    public ResultSet filterOrganName(String type) throws SQLException
    {
    	System.out.println("\nExecuting filterOrganName.");
    	String sql = "SELECT * FROM Organ WHERE OName = ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setString(1, type);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       ResultSet filtered according to organ category from the rogfoe database.
	 */
    public ResultSet filterOrganCat(String type) throws SQLException
    {
    	System.out.println("\nExecuting filterOrganCat.");
    	String sql = "SELECT * FROM Organ WHERE Category = ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setString(1, type);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
   
    /**
	 *
	 * TODO - build it
	 * @return
	 *       ResultSet filtered according to organ price from the rogfoe database.
	 */
    public ResultSet filterOrganPrice(String type) throws SQLException
    {
    	System.out.println("\nExecuting I DON'T WORK YET.");
    	String sql = "SELECT * FROM Organ WHERE Category = ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setString(1, type);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    
    /**
	 * Returns a String with all the organs in the database.  
	 * Format:
	 	TODO - format
	 * 
	 * @return
	 *       String containing all organ information
	 */
    public String getOrganTable(ResultSet rst) throws SQLException
    {
        StringBuilder output = new StringBuilder();
        while(rst.next()){
			String name = rst.getString(6);
			Double price = rst.getDouble(7);
			int size = rst.getInt(8);
			Date date = rst.getDate(9);
			String blood = rst.getString(10);
			String desc = rst.getString(11);
			String pic = rst.getString(12);
			String doc = rst.getString(13);
			String hosp = rst.getString(14);
			String cat = rst.getString(15);
			String Cat = cat.substring(0, 1).toUpperCase() + cat.substring(1); //make first char. upper case
			
			//Format Currency
			NumberFormat currFormat = NumberFormat.getCurrencyInstance();	

			//The actual printing.
			String out = 
						"<tr class=\"list-row\">"+
							"<td class=\"OName\">"+name+"</td>"+
							"<td>"+currFormat.format(price)+"</td>"+
							"<td>"+size+"</td>"+
							"<td>"+date+"</td>"+
							"<td>"+blood+"</td>"+
							"<td>"+desc+"</td>"+
							"<td class=\"text-center\"><img class=\"organ-pic-list\" src=\"  "+pic+"  \"></td>"+
							"<td>"+doc+"</td>"+
							"<td>"+hosp+"</td>"+
							"<td>"+Cat+"</td>"+
						"</tr>";
			output.append(out);
			
		}   
        
        return output.toString();
    }

	
}
