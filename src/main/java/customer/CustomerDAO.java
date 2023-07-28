package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/C:/Java/h2/data/jwbookdb";


public void open()	{
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(JDBC_URL,"sa","sa");
	} catch (Exception e){
		e.printStackTrace(); 	}
}

public void close() {
	try {
		pstmt.close();
		conn.close();
	} catch (SQLException e) { e.printStackTrace(); 	}
}

public void insert(Customer c) {
	open();
	String sql = "INSERT INTO customer(name, address, phone) values(?,?,?)";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, c.getName());
		pstmt.setString(2, c.getAddress());
		pstmt.setString(3, c.getPhone());

		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace(); }
		finally { close(); }
}


public List<Customer> getAll() {
	open();
	List<Customer> customers = new ArrayList<>();
	
	try {
		pstmt = conn.prepareStatement("select * from customer");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Customer c = new Customer();
			c.setId(rs.getInt("id"));
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPhone(rs.getString("phone"));

			customers.add(c);
		}
	} catch (Exception e) { e.printStackTrace(); }
	finally { close(); }
	return customers;
}



}
















