package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class CustomerService {
	
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/C:/Java/h2/data/jwbookdb";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	Map<Integer,Customer> customers = new HashMap<>();
	
	public CustomerService() {
//		Customer c = new Customer(1,"박지성","영국 맨체스터","000-5000-0001");
//		customers.put(1, c);
//		c = new Customer(2,"김연아","대한민국 서울","000-6000-0001");
//		customers.put(2,c);
//		c = new Customer(3,"장미란","대한민국 강원도","000-7000-0001");
//		customers.put(3,c);
//		c = new Customer(4,"추신수","미국 클리블랜드","000-8000-0001");
//		customers.put(4,c);
//		c = new Customer(5,"박세리","대한민국 대전","N/A");
//		customers.put(5,c);
		
		open();

		try {
			pstmt = conn.prepareStatement("select * from customer");
			ResultSet rs = pstmt.executeQuery();
			Customer c = new Customer();
			int i = 1;
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				c = new Customer(id, name, address, phone);
				customers.put(i, c);
				i++;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {close();}

		
	}
	public Customer get(int id) {
        Customer rtn = null;
        
        rtn = customers.get(id);
        
        if (rtn == null) {
            rtn = new Customer();
            rtn.setId(-1);
            rtn.setName("");
            rtn.setAddress("");
            rtn.setPhone("");
        }
        
        return rtn;
    }
	
	public synchronized void add(Customer customer) {
		int max = Collections.max(customers.keySet());
		customer.setId(max + 1);
		
		customers.put(customer.getId(),customer);
	}
	
	public List<Customer> findAll(){
		return new ArrayList<>(customers.values());
	}
//	public Customer find(String id) {
//		return customers.get(id);
//	}
	 public synchronized void set(Customer customer) {
	        customers.put(customer.getId(), customer);
	    }
	public synchronized void remove(int id) {
        customers.remove(id);
    }
	
}
