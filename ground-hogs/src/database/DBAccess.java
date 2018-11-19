package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Review;
import model.SalesItem;

public class DBAccess {
	public static List<SalesItem> SP_GeInventory() {
		List<SalesItem> items = new ArrayList<SalesItem>();
		String sql = "{CALL SP_GeInventory()}";
		Connection conn = null;
		try {
			conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
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
	public static List<Review> SP_GetReview(int itemId) {
		List<Review> reviews = new ArrayList<Review>();
		String sql = "{CALL SP_GeReview(?)}";
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
}
