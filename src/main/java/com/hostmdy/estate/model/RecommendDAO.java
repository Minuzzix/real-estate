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

public class RecommendDAO {
	
	private DataSource dataSource;
    private Connection connection;
    private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;
   
    
    public RecommendDAO(DataSource dataSource) {
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
    
    
    public boolean addRecommendation(Recommend recommend) {
	    boolean addOk = false;
	    try {
	        connection = dataSource.getConnection();
	        pStmt = connection.prepareStatement("insert into recommend "
	                + "(message, sendAt, user_id, username) "
	                + "VALUES (?, ?, ?, ?);");
	        pStmt.setString(1, recommend.getMessage());
	        pStmt.setTimestamp(2, Timestamp.valueOf(recommend.getSendAt()));
	        pStmt.setLong(3, recommend.getUser_id());
	        pStmt.setString(4, recommend.getUsername());
	        

	        int rowEffected = pStmt.executeUpdate();

	        if (rowEffected > 0) {
	            addOk = true;
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return addOk;
	}

    
    public List<Recommend> getRecommendations() {
		List<Recommend> recommendations = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from recommend ");

			while (rs.next()) {
				recommendations.add(new Recommend(rs.getLong("id"), rs.getString("message"),
						rs.getTimestamp("sendAt").toLocalDateTime(),rs.getLong("user_id"), rs.getString("username")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return recommendations;
	}
}
    





