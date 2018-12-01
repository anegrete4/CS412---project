package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.FrequentlyAskedQuestion;
import model.Review;
import model.SalesItem;
import model.Workshop;

public class DBAccess {
	public static List<SalesItem> SP_GetInventory(int isFood, int isAccessories, int isCareProduct) {
		System.out.println("Fine here1");
		List<SalesItem> items = new ArrayList<SalesItem>();
		String sql = "{CALL SP_GetInventory(?, ?, ?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 1);
			ps.setInt(2, 1);
			ps.setInt(3, 1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				items.add(new SalesItem (rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5)));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return items;
	}
	public static List<FrequentlyAskedQuestion> SP_GetFAQ(int count) {
		List<FrequentlyAskedQuestion> items = new ArrayList<FrequentlyAskedQuestion>();
		String sql = "{CALL SP_GetFAQ(?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, count);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				items.add(new FrequentlyAskedQuestion (rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return items;
	}
	public static void SP_AddFAQ(String question) {
		String sql = "{CALL SP_AddFAQ(?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, question);
			ps.executeQuery();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static List<Review> SP_GetReview(int itemId) {
		List<Review> reviews = new ArrayList<Review>();
		String sql = "{CALL SP_GetReview(?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reviews.add(new Review(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(3)));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reviews;
	}
	
	public static List<Workshop> SP_GetWorkshops() {
		List<Workshop> workshops = new ArrayList<Workshop>();
		String sql = "{CALL SP_GetWorkshops()}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				workshops.add(new Workshop(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7)));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return workshops;
	}
	
	public static void SP_RegisterToWorkshop(int workshopId) {
		String sql = "{CALL SP_RegisterToWorkshop(?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, workshopId);
			ps.executeQuery();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public static void SP_AddAVote(int questionId) {
		String sql = "{CALL SP_AddAVote(?)}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, questionId);
			ps.executeQuery();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static SalesItem SP_GetSalesItem(int itemId) {
		String sql = "{CALL SP_GetSalesItem(?)}";
		SalesItem item=null;
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				item=new SalesItem(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return item;
	}
}
