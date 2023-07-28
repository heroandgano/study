package ch09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class MandalartDAO {
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
	
	public List<String> getFirstList(){
		open();
		List<String> firstList = new ArrayList<>();
		String goal = null;
		try {
			pstmt = conn.prepareStatement("select main.name as name, first.name as goal from FIRSTMANDARAT first join MAINMANDARAT main on main.id = first.mainid");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				goal = rs.getString("name");
				String first_goal = rs.getString("goal");
				firstList.add(first_goal);
			}
			firstList.add(4, goal);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {close();}
		return firstList;
	}
	
	public List<String> getSecondList(String goal){
		open();
		List<String> secondList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select f.name as first_name, s.name as second_name from FIRSTMANDARAT f join SECONDMANDARAT s on f.id = s.firstid where f.name = ?");
			pstmt.setString(1, goal);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String second_goal = rs.getString("second_name");
				secondList.add(second_goal);
			}
			secondList.add(4, goal);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {close();}
		return secondList;
	}
	
}
