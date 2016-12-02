package dbTransactions;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FetchData extends DBconnect{
	
    /**
	 * 
	 * @return
	 *       ResultSet of all unique organ names randomly sorted from the rogfoe database.
	 */
    public ResultSet listUniqueOrgans() throws SQLException
    {
    	System.out.println("\nExecuting listUniqueOrgans.");
    	String sql = "SELECT DISTINCT OName FROM Organ WHERE OID IS NULL ORDER BY RAND()";

    	PreparedStatement pst = con.prepareStatement(sql);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
	/**
	 * 
	 * @return
	 *       updates the organ's Order ID.
	 */
    public int updateOrganOID(int oid, int orgid) throws SQLException
    {
    	String sql = "update Organ set OID = ? where OrgId = ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setInt(1, oid);
    	pst.setInt(2, orgid);
    	
    	int rst = pst.executeUpdate();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Inserts order into Order table, returns generated OID
	 *       
	 */
    public int insertOrder(int shipAddID, int billAddID, double orderTotal, double shippingFee, double grandTotal, String payBy, int uid) throws SQLException
    {
     	String insertOrderSQL = ("INSERT `Order` (ShipAddID, BillAddID, Date, OrderTotal, ShippingFee, Status, GrandTotal, PayBy, UID) VALUES (?, ?, NOW(), ?, ?, 'Ordered', ?, ?, ?);");
    	PreparedStatement psta = con.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
    	psta.setInt(1, shipAddID);
    	psta.setInt(2, billAddID);
    	psta.setDouble(3, orderTotal);
    	psta.setDouble(4, shippingFee);
    	psta.setDouble(5, grandTotal);
    	psta.setString(6, payBy);
    	psta.setInt(7, uid);
    	
    	//Execute
    	psta.executeUpdate();
    	System.out.println("Query is " + psta.toString());
    	
    	ResultSet keys = psta.getGeneratedKeys();
    	keys.next();
    	
        return keys.getInt(1);
    }
    
    /**
	 * 
	 * @return
	 *       Inserts Visa information on user, based on UID
	 */
    public int insertBankTransfer(String accountNum, String bankName, int branchNum, int uid) throws SQLException
    {
     	String insertBankTransferSQL = ("INSERT BankTransfer VALUES (?, ?, ?, ?);");
    	PreparedStatement psta = con.prepareStatement(insertBankTransferSQL);
    	psta.setString(1, accountNum);
    	psta.setString(2, bankName);
    	psta.setInt(3, branchNum);
    	psta.setInt(4, uid);
    	
    	System.out.println("Query is " + psta.toString());
    	
    	//Execute
    	int rst = psta.executeUpdate();
    	
        return rst;
    }
    
    /**
   	 * 
   	 * @return
   	 *       Inserts Paypal information on user, based on UID
   	 */
       public int insertPayPal(int uid, int accountNum) throws SQLException
       {
        String insertPayPalSQL = ("INSERT PayPal VALUES (?, ?);");
       	PreparedStatement psta = con.prepareStatement(insertPayPalSQL);
       	psta.setInt(1, accountNum);
       	psta.setInt(2, uid);
       	
       	System.out.println("Query is " + psta.toString());
       	
       	//Execute
       	int rst = psta.executeUpdate();
       	
           return rst;
       }
    
    /**
	 * 
	 * @return
	 *       Inserts Visa information on user, based on UID
	 */
    public int insertVisa(String cardNum, String expiry, int cvv, int uid) throws SQLException
    {
     	String insertVisaSQL = ("INSERT Visa VALUES (?, ?, ?, ?);");
    	PreparedStatement psta = con.prepareStatement(insertVisaSQL);
    	psta.setString(1, cardNum);
    	psta.setString(2, expiry);
    	psta.setInt(3, cvv);
    	psta.setInt(4, uid);
    	
    	System.out.println("Query is " + psta.toString());
    	
    	//Execute
    	int rst = psta.executeUpdate();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Inserts shippingAddress on user, based on UID
	 */
    public int insertShippingAddress(int uid, String street, String city, String state, String country, String postal) throws SQLException
    {
     	String insertAddressSQL = ("INSERT INTO Address (UID, AddressType, Street, City, State, Country, PostalCode) VALUES (?, 'Shipping', ?, ?, ?, ?, ?);");
    	PreparedStatement psta = con.prepareStatement(insertAddressSQL);
    	psta.setInt(1, uid);
    	psta.setString(2, street);
    	psta.setString(3, city);
    	psta.setString(4, state);
    	psta.setString(5, country);
    	psta.setString(6, postal);
    	
    	//Execute
    	int rst = psta.executeUpdate();

    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Returns Visa information on user, based on UID
	 */
    public ResultSet getVisa(int uid) throws SQLException
    {
    	PreparedStatement stmt = null;
		String sql = "SELECT * FROM Visa WHERE UID = ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, uid);
		ResultSet rst = stmt.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Returns PayPal information on user, based on UID
	 */
    public ResultSet getPayPal(int uid) throws SQLException
    {
    	PreparedStatement stmt = null;
		String sql = "SELECT * FROM PayPal WHERE UID = ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, uid);
		ResultSet rst = stmt.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Returns bank information on user, based on UID
	 */
    public ResultSet getBank(int uid) throws SQLException
    {
    	PreparedStatement stmt = null;
		String sql = "SELECT * FROM BankTransfer WHERE UID = ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, uid);
		ResultSet rst = stmt.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Returns shipping and home addresses of user, based on UID
	 */
    public ResultSet getShippingAddresses(int uid) throws SQLException
    {
    	PreparedStatement stmt = null;
		String sql = "SELECT Street, City, State, PostalCode, Country, AddID FROM Address WHERE UID = ? AND (AddressType = 'Home' OR AddressType = 'Shipping');";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, uid);
		ResultSet rst = stmt.executeQuery();
    	
        return rst;
    }
    
    /**
	 * 
	 * @return
	 *       Returns UID and password
	 */
    public ResultSet validateLogin(String un, String pw) throws SQLException
    {
    	PreparedStatement stmt = null;
		String sql = "SELECT UID, Password, AccType FROM User WHERE Uemail = ? AND Password = ?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, un);
		stmt.setString(2, pw);
		ResultSet rst = stmt.executeQuery();
    	
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
    public ResultSet filterSizeRange(String range) throws SQLException
    {
    	System.out.println("\nExecuting filterSizeRange.");
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
    public ResultSet listAllOrgans() throws SQLException
    {
    	System.out.println("\nExecuting listAllOrgans.");
    	String sql = "SELECT * FROM Organ WHERE OID IS NULL ORDER BY RAND()";

    	PreparedStatement pst = con.prepareStatement(sql);
    	ResultSet rst = pst.executeQuery();
    	
        return rst;
    }
    
    /**
	 *
	 * TODO - drink more coffee
	 * @return
	 *       ResultSet filtered according to organ price from the rogfoe database.
	 */
   public ResultSet applyShopFilters(HashMap<String,String> filters) throws SQLException
   {
		System.out.println("\nExecuting applyShopFilters.");
		Iterator<Map.Entry<String, String>> entries = filters.entrySet().iterator();
		String sql = "SELECT * FROM Organ WHERE ";
		List<Integer> counted = new ArrayList<Integer>();
		int count = 1;
		while (entries.hasNext()){
			counted.add(count);
			count++;
			Map.Entry<String, String> entry = entries.next();
			sql +=  entry.getKey()+" = ? ";
			if (entries.hasNext()){
				sql += "AND ";
			}
		}
		Iterator<Map.Entry<String, String>> values = filters.entrySet().iterator();
		Iterator<Integer> countitr = counted.iterator(); 
		PreparedStatement pst = con.prepareStatement(sql);
		while (values.hasNext()){
			Map.Entry<String, String> val = values.next();
			if (countitr.hasNext()){
				int num = countitr.next();
				String x = val.getValue();
				pst.setString(num, x);
			}
		}
	   ResultSet rst = pst.executeQuery();
       return rst;
   }
  
    /**
	 *
	 * @param
	 * 		 The product id (pid)
	 * @return
	 *       ResultSet containing the image url.
	 */
    public String getOrganImage(String pid) throws SQLException
    {
	   	System.out.println("\nExecuting getOrganImage.");
	   	String sql = "SELECT Picture FROM Organ WHERE OrgID = ?";
	   	PreparedStatement pst = con.prepareStatement(sql);
	   	pst.setString(1, pid);
	   	ResultSet rst = pst.executeQuery();
	   	String url = null;
	   	
	   	while (rst.next()){
	   		url = rst.getString(1);
	   	}
	   	return url;
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
        	int orgID = rst.getInt(1);
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

			//Create add to cart link
			String nameEncoded = null;
			try {
				nameEncoded = URLEncoder.encode(name, "UTF-8").replace("+","%20");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Lil bitch was unable to encode");
			}
//			String nameEncoded = java.net.URLEncoder.encode(name,"UTF-8").replace("+","%20");

			String cartLink = "addcart.jsp?id="+orgID+"&name="+nameEncoded+"&price="+price;
			
			//The actual printing.
			String out = 
						"<tr class=\"row shop list-row\">"+
							"<td class=\"col-sm-3 text-center pic\"><img class=\"organ-pic-list\" src=\"  "+pic+"  \"></td>"+
							"<td class=\"col-sm-6 OName\"><span class=\"OName\">"+name+"</span><br />"+
							"<span class=\"size\">Weight: "+size+" grams <b>|</b> </span><span class=\"blood\">Blood Type: "+blood+"</span><br /><br />"+
							"<span class=\"desc\">"+desc+"</span></td>"+
							"<td class=\"price col-sm-3\"><span class=\"price\"><br/><br/>"+currFormat.format(price)+"</span><br />"+
							"<span class=\"cat\">"+Cat+": </span>"+"<br />"+
							"<span class=\"buy\"><br/><a href="+cartLink+">Buy <span class=\"glyphicon glyphicon-shopping-cart\"></span></a></span></td>"+
						"</tr>";
			output.append(out);
		}   
        
        return output.toString();
    }

	
}
