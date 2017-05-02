package db;
/**
 * 
 * @author Tianhang Lan
 * This file provide connection to the database.
 *
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	/**
	 * Get the connection
	 * 
	 * @return Connection
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// Load driver
			Class.forName("com.mysql.jdbc.Driver");
			// Set Url
			String url = "jdbc:mysql://localhost:3306/bank?useSSL=false";
			// Get Connection
			conn = DriverManager.getConnection(url, "root", "password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * Close the connection
	 * 
	 * @param conn
	 *            Connection
	 */
	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
