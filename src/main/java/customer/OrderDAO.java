package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
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

public void insert(Ordering o) {
	open();
	String sql = "INSERT INTO orders(custid, bookid, saleprice, orderdate) values(?,?,?,?)";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, o.getCustomerId());
		pstmt.setInt(2, o.getBookId());
		pstmt.setInt(3, o.getSellingPrice());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date now = new java.util.Date();
		pstmt.setString(4, sdf.format(now));

		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace(); }
		finally { close(); }
}


public List<Ordering> getAll() {
	open();
	List<Ordering> orders = new ArrayList<>();
	
	try {
		pstmt = conn.prepareStatement("SELECT o.id as orderid, * FROM orders o JOIN customer c ON o.custid = c.id JOIN book b ON o.bookid = b.id");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Ordering o = new Ordering();
			o.setId(rs.getInt("orderid"));
			o.setCustomerId(rs.getInt("custid"));
			o.setName(rs.getString("name"));
			o.setBookId(rs.getInt("bookid"));
			o.setTitle(rs.getString("title"));
			o.setSellingPrice(rs.getInt("saleprice"));
			o.setOrderingDate(rs.getDate("orderdate"));
			orders.add(o);
		}
	} catch (Exception e) { e.printStackTrace(); }
	finally { close(); }
	return orders;
}



}
















