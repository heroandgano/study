package mandarat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class MandaratDAO {
	
	Connection conn = null;
	PreparedStatement pstmt;

	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/C:/Java/h2/data/jwbookdb";

	public List<Mandarat> getmainList() {

		List<Mandarat> mandaratm = new ArrayList<>();

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
			pstmt = conn.prepareStatement("select * from firstmandarat");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Mandarat main = new Mandarat();
				String firstname = rs.getString("name");
				
				mandaratm.add(firstname);
				
				goal = rs.getString("name");
				String first_goal = rs.getString("goal");
				firstList.add(first_goal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return mandaratm;
	}

}

//Map<String, List<String>> map1 = new HashMap<>();
//
//map1.put("8구단 드래프트 1순위",
//		Arrays.asList("몸 만들기",
//				"제구",
//				"구의",
//				"멘탈",
//				"스피드 160km/h",
//				"변화구",
//				"인간성",
//				"운"		
//				)
//		);
