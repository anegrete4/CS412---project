package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// the given url did not worked for me.. so i had to have another one
			// String url = "jdbc:mysql://localhost:3306/kPanthi_db_proj";
			// while running on the mac above given url did not work for me,
			// i needed following url
			String url = "jdbc:mysql://localhost:3306/groundHogs_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String user = "student";
			String password = "student";
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void test() {
		try {
			Connection conn = getConnection();
			if (conn != null)
				System.out.println("Connection successful");
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}