package com.hostmdy.estate.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class FavoriteDAO {
    private DataSource dataSource;
    private Connection connection;
   // private Statement stmt;
    private PreparedStatement pStmt;
    private ResultSet rs;

    public FavoriteDAO(DataSource dataSource) {
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
    
 

    public List<Property> getFavoritesByUser(Long userId) {
        List<Property> favorites = new ArrayList<>();
        String query = "select * from property where id IN (select property_id from favorite where user_id = ?)";
        
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement(query);
            pStmt.setLong(1, userId);
            
            rs = pStmt.executeQuery();

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
                favorites.add(property);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return favorites;
    }
    
    public List<Favorite> getFavoritesListByUser(Long userId) {
        List<Favorite> favorites = new ArrayList<>();
        String query = "select * from favorite where user_id = ?";
        
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement(query);
            pStmt.setLong(1, userId);
            
            rs = pStmt.executeQuery();

            while (rs.next()) {
                Favorite favorite = new Favorite(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getLong("property_id")
                   
                );
                favorites.add(favorite);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return favorites;
    }
    

    public boolean addFavorite(Favorite favorite) {
    	
//    	 boolean insertOk = false;
//    	    String query = "INSERT INTO favorite (user_id, property_id) VALUES (?, ?)";
//
//    	    try {
//    	        connection = dataSource.getConnection();
//    	        pStmt = connection.prepareStatement(query);
//    	        pStmt.setLong(1, favorite.getUser_id());
//    	        pStmt.setLong(2, favorite.getProperty_id());
//
//    	        int rowsAffected = pStmt.executeUpdate();
//    	        insertOk = rowsAffected > 0;
//    	    } catch (SQLException e) {
//    	        e.printStackTrace();
//    	    } finally {
//    	        close();
//    	    }
//    	    return insertOk;
    	
        boolean insertOk = false;
        String query = "insert into favorite (user_id, property_id) values (?, ?)";
        String checkQuery = "select count(*) from favorite where user_id = ? and property_id = ?";
        
        try {
            connection = dataSource.getConnection();
            PreparedStatement insert = connection.prepareStatement(query);
            PreparedStatement check = connection.prepareStatement(checkQuery);
            check.setLong(1, favorite.getUser_id());
            check.setLong(2, favorite.getProperty_id());
            
            try (ResultSet rs = check.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count == 0) { 
                        insert.setLong(1, favorite.getUser_id());
                        insert.setLong(2, favorite.getProperty_id());
                        int rowEffected = insert.executeUpdate();
                        insertOk = rowEffected > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return insertOk;
    }

    public boolean removeFavorite(Long userId, Long propertyId) {
        boolean deleteOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("delete from favorite where user_id = ? and property_id = ?");
            pStmt.setLong(1, userId);
            pStmt.setLong(2, propertyId);

            int rowAffected = pStmt.executeUpdate();
            deleteOk = rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return deleteOk;
    }
    
    
    
    
    

        

}
