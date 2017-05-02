package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import data.Transaction;
import db.Connect;

public class TransactionModify {
	public void newTransaction(int source, int dest, double amount) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// SQL to Insert the user
		String sql = "insert into transaction(tran_source, tran_dest, tran_amount, tran_type) values(?, ?, ?, \"Transaction\")";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, source);
			ps.setInt(2, dest);
			ps.setDouble(3, amount);
			ps.executeUpdate();
			ps.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
	}

	public void newWithdraw(int source, double amount) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// SQL to Insert the user
		String sql = "insert into transaction(tran_source, tran_dest, tran_amount, tran_type) values(?, 0, ?, \"Withdraw\")";
		
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, source);
			ps.setDouble(2, amount);
			ps.executeUpdate();
			ps.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
	}

	public void newDeposit(int source, double amount) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// SQL to Insert the user
		String sql = "insert into transaction(tran_source, tran_dest, tran_amount, tran_type) values(?, 0, ?, \"Deposit\")";
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, source);
			ps.setDouble(2, amount);
			ps.executeUpdate();
			ps.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
	}

	public List<Transaction> fetchTransaction(int uid) {
		// Get DB Connection object
		Connection conn = Connect.getConnection();
		// SQL to Insert the user
		String sql = "select u1.user_name as name1, u2.user_name as name2, t.tran_id, t.tran_amount, t.tran_type, t.tran_time from user u1, user u2, transaction t where (t.tran_source = ? or t.tran_dest = ?) and t.tran_source = u1.user_id and (t.tran_dest = u2.user_id or (t.tran_dest = 0 and u2.user_id = ?)) order by t.tran_id ;";
		List<Transaction> tl = new ArrayList<Transaction>();
		try {
			// Get PreparedStatement object
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, uid);
			ps.setInt(3, uid);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			while (rs.next()) {
				Transaction t = new Transaction();
				t.setId(rs.getInt("tran_id"));
				t.setSource(rs.getString("name1"));
				t.setDest(rs.getString("name2"));
				t.setAmount(rs.getBigDecimal("tran_amount").doubleValue());
				t.setType(rs.getString("tran_type"));
				t.setTime(rs.getString("tran_time"));
				tl.add(t);
			}
			rs.close();
			ps.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			Connect.closeConnection(conn);
		}
		return tl;

	}
}
