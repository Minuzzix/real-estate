package com.hostmdy.estate.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class BuyDAO {
	
	private DataSource dataSource;
    private Connection connection;
    private Statement stmt;
	private ResultSet rs;
   
    
    public BuyDAO(DataSource dataSource) {
    	this.dataSource = dataSource;
    }
    
    private void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<Property> getBuyByUser(Long userId) {
        List<Property> buy = new ArrayList<>();
        String query = "select * from property where id IN (select property_id from buy where user_id = ? AND status = 'APPROVED')";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pStmt = connection.prepareStatement(query)) {
            pStmt.setLong(1, userId);
            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    Property property = new Property(
                        rs.getLong("id"),
                        rs.getString("type"),
                        rs.getDouble("price"),
                        rs.getString("address"),
                        rs.getTimestamp("date").toLocalDateTime(),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getLong("user_id"),
                        rs.getString("status"),
                        rs.getString("city"),
                        rs.getString("bedroom"),
                        rs.getString("bathroom"),
                        rs.getBoolean("garage"),
                        rs.getBoolean("pool"),
                        rs.getBoolean("garden"),
                        rs.getBoolean("gym"),
                        rs.getString("createdUser")
                    );
                    buy.add(property);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
			close();
		}

        return buy;
    }
    
    public List<Property> getAllSoldProperties() {
        List<Property> soldProperties = new ArrayList<>();
        String query = "select * from property where id IN (select property_id from buy where status = 'APPROVED')";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pStmt = connection.prepareStatement(query);
             ResultSet rs = pStmt.executeQuery()) {
            while (rs.next()) {
                Property property = new Property(
                    rs.getLong("id"),
                    rs.getString("type"),
                    rs.getDouble("price"),
                    rs.getString("address"),
                    rs.getTimestamp("date").toLocalDateTime(),
                    rs.getString("image"),
                    rs.getString("description"),
                    rs.getLong("user_id"),
                    rs.getString("status"),
                    rs.getString("city"),
                    rs.getString("bedroom"),
                    rs.getString("bathroom"),
                    rs.getBoolean("garage"),
                    rs.getBoolean("pool"),
                    rs.getBoolean("garden"),
                    rs.getBoolean("gym"),
                    rs.getString("createdUser")
                    
                );
                soldProperties.add(property);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return soldProperties;
    }
    
    public List<Buy> getBuyByApproved() {
		List<Buy> approvedBuy = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from buy where status = 'APPROVED'");

			while (rs.next()) {
				approvedBuy.add(new Buy(rs.getLong("id"), rs.getLong("user_id"), rs.getString("username"),
					rs.getLong("property_id"), rs.getTimestamp("buyDate").toLocalDateTime(),rs.getString("status"), rs.getString("approvedBy"), rs.getString("declinedBy")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return approvedBuy;
	}
    
    public List<Buy> getBuyByDeclined() {
		List<Buy> declinedBuy = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from buy where status = 'DECLINED'");

			while (rs.next()) {
				declinedBuy.add(new Buy(rs.getLong("id"), rs.getLong("user_id"), rs.getString("username"),
					rs.getLong("property_id"), rs.getTimestamp("buyDate").toLocalDateTime(),rs.getString("status"), rs.getString("approvedBy"), rs.getString("declinedBy")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return declinedBuy;
	}
    

    public boolean addBuy(Buy buy) {
        boolean addOk = false;
        String query = "insert into buy (user_id,username, property_id, buyDate, status) VALUES (?, ?, ?, ?,?)";
        String checkQuery = "select count(*) from buy where property_id = ? AND status = 'APPROVED'";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement insert = connection.prepareStatement(query);
             PreparedStatement check = connection.prepareStatement(checkQuery)) {
            
            check.setLong(1, buy.getProperty_id());
            try (ResultSet rs = check.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count == 0) {
                        insert.setLong(1, buy.getUser_id());
                        insert.setString(2, buy.getUsername());
                        insert.setLong(3, buy.getProperty_id());
                        insert.setTimestamp(4, Timestamp.valueOf(buy.getBuyDate()));
                        insert.setString(5, buy.getStatus());
                        int rowEffected = insert.executeUpdate();
                        addOk = rowEffected > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return addOk;
    }

    
    public List<Buy> getPendingBuys() {
        List<Buy> pendingBuys = new ArrayList<>();
        String query = "select * from buy where status = 'PENDING'";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pStmt = connection.prepareStatement(query);
             ResultSet rs = pStmt.executeQuery()) {
            while (rs.next()) {
                Buy buy = new Buy(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("username"),
                    rs.getLong("property_id"),
                    rs.getTimestamp("buyDate").toLocalDateTime(),
                    rs.getString("status")
                );
                buy.setApprovedBy(rs.getString("approvedBy"));
                buy.setDeclinedBy(rs.getString("declinedBy"));
                pendingBuys.add(buy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pendingBuys;
    }


    public boolean approveBuy(Long buyId, String approvedBy) {
        boolean updateOk = false;
        String updateBuyQuery = "update buy set status = ?, approvedBy = ? where id = ?";
        String updatePropertyQuery = "update property set status = ? where id = (select property_id from buy where id = ?)";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement updateBuyStmt = connection.prepareStatement(updateBuyQuery);
             PreparedStatement updatePropertyStmt = connection.prepareStatement(updatePropertyQuery)) {

            connection.setAutoCommit(false); // Start transaction

            updateBuyStmt.setString(1, "APPROVED");
            updateBuyStmt.setString(2, approvedBy);
            updateBuyStmt.setLong(3, buyId);
            int buyUpdated = updateBuyStmt.executeUpdate();

            updatePropertyStmt.setString(1, "sold out");
            updatePropertyStmt.setLong(2, buyId);
            int propertyUpdated = updatePropertyStmt.executeUpdate();

            if (buyUpdated > 0 && propertyUpdated > 0) {
                connection.commit(); // Commit transaction
                updateOk = true;
            } else {
                connection.rollback(); // Rollback transaction in case of failure
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updateOk;
    }

    public boolean declineBuy(Long buyId, String declinedBy) {
        boolean declineOk = false;
        String query = "update buy set status = 'DECLINED', declinedBy = ? where id = ?";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pStmt = connection.prepareStatement(query)) {
            pStmt.setString(1, declinedBy);
            pStmt.setLong(2, buyId);
            int rowAffected = pStmt.executeUpdate();
            declineOk = rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return declineOk;
    }


    
   

}
