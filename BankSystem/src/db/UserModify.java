package db;

/**
 * 
 * @author Tianhang Lan
 * This file contains functions to log in, register and check if the username is already used.
 *
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.User;
import db.Connect;

public class UserModify {

	/**
	 * Add a user
	 * 
	 * @param user
	 *            User object
	 */
	public void saveUser(User user) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// SQL to Insert the user
		String sql = "insert into user(user_name, password, firstname, lastname, email, addr, addr2, postal, phone, city, state, country, balance) values(?,?,?,?,?,?,?,?,?,?,?,?,0.00);";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			// Dynamic change the SQL
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getLastName());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getAddr());
			ps.setString(7, user.getAddr2());
			ps.setInt(8, user.getPostal());
			ps.setInt(9, user.getPhone());
			ps.setString(10, user.getCity());
			ps.setString(11, user.getState());
			ps.setString(12, user.getCountry());
			// Update
			System.out.println(ps);
			System.out.println(ps.executeUpdate());
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
	}

	/**
	 * Fetch User Information
	 * 
	 * @param username
	 *            User name
	 * @return User object
	 */
	public User fetch(String username) {
		User user = null;
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// Query the user name and password
		String sql = "select * from user where user_name = ?";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			// Dynamic change the SQL
			ps.setString(1, username);
			// Get the result
			ResultSet rs = ps.executeQuery();
			// Judge if valid
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("user_id"));
				user.setUsername(rs.getString("user_name"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				user.setAddr2(rs.getString("addr2"));
				user.setPostal(rs.getInt("postal"));
				user.setPhone(rs.getInt("phone"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				user.setCountry(rs.getString("country"));
				user.setBalance(rs.getBigDecimal("balance").doubleValue());

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
		return user;
	}

	/**
	 * User Log in
	 * 
	 * @param username
	 *            User name
	 * @param password
	 *            Password
	 * @return User object
	 */
	public User login(String username, String password) {
		User user = null;
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// Query the user name and password
		String sql = "select * from user where user_name = ? and password = ?";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			// Dynamic change the SQL
			ps.setString(1, username);
			ps.setString(2, password);
			// Get the result
			ResultSet rs = ps.executeQuery();
			// Judge if valid
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("user_id"));
				user.setUsername(rs.getString("user_name"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				user.setAddr2(rs.getString("addr2"));
				user.setPostal(rs.getInt("postal"));
				user.setPhone(rs.getInt("phone"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				user.setCountry(rs.getString("country"));
				user.setBalance(rs.getBigDecimal("balance").doubleValue());

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
		return user;
	}

	/**
	 * Administrator Log in
	 * 
	 * @param username
	 *            Administrator's name
	 * @param password
	 *            Administrator's Password
	 * @return The admin user object
	 */
	public User adminLogin(String username, String password) {
		User user = null;
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// Query the user name and password
		String sql = "select * from admin where admin_name = ? and admin_password = ?";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			// Dynamic change the SQL
			ps.setString(1, username);
			ps.setString(2, password);
			// Get the result
			ResultSet rs = ps.executeQuery();
			// Judge if valid
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("admin_id"));
				user.setAdmin(true);
				user.setUsername(rs.getString("admin_name"));

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
		return user;
	}

	public void updateBalance(User user) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// Query the user by name
		String sql = "update user set balance = ? where user_id = ?";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, user.getBalance());
			ps.setInt(2, user.getId());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
	}

	/**
	 * Judge if the user exist
	 * 
	 * @param username
	 *            User name
	 * @return A Boolean whether the user exist
	 */
	public boolean userIsExist(String username) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// Query the user by name
		String sql = "select * from user where user_name = ?";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
		return false;
	}
}
