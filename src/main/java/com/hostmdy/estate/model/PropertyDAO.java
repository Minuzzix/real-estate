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

public class PropertyDAO {
	private DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;

	public PropertyDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	private void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public List<Property> getAllPropertiesByUser(Long userId) {
		List<Property> propertyList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from property where user_id='" + userId + ";'");

			while (rs.next()) {
				propertyList.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return propertyList;
	}
	
	

	public List<Property> getViewPropertyByUser(long userId) {
		List<Property> viewPropertyList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from property where user_id='" + userId + ";'");

			while (rs.next()) {
				viewPropertyList.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return viewPropertyList;
	}

	public List<Property> getAllProperties() {
		List<Property> propertyList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from property");

			while (rs.next()) {
				propertyList.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return propertyList;
	}
	

	public List<Property> getAllViewProperties() {
		List<Property> allPropertyList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from property ");

			while (rs.next()) {
				allPropertyList.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return allPropertyList;
	}

	public Property getPropertyById(Long propertyId) {
		Property property = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from property where id='" + propertyId + ";'");

			while (rs.next()) {
				property = new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return property;
	}

	public boolean createProperty(Property property) {
	    boolean insertOk = false;
	    try {
	        connection = dataSource.getConnection();
	        pStmt = connection.prepareStatement("INSERT INTO property "
	                + "(type, price, address, date, image, description, city, bedroom, bathroom, garage, pool, garden, gym, user_id, createdUser) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	        pStmt.setString(1, property.getType());
	        pStmt.setDouble(2, property.getPrice());
	        pStmt.setString(3, property.getAddress());
	        pStmt.setTimestamp(4, Timestamp.valueOf(property.getDate()));
	        pStmt.setString(5, property.getImage());
	        pStmt.setString(6, property.getDescription());
	        pStmt.setString(7, property.getCity());
	        pStmt.setString(8, property.getBedroom());
	        pStmt.setString(9, property.getBathroom());
	        pStmt.setBoolean(10, property.isGarage());
	        pStmt.setBoolean(11, property.isPool());
	        pStmt.setBoolean(12, property.isGarden());
	        pStmt.setBoolean(13, property.isGym());
	        pStmt.setLong(14, property.getUser_id());
	        pStmt.setString(15, property.getCreatedUser());

	        int rowEffected = pStmt.executeUpdate();

	        if (rowEffected > 0) {
	            insertOk = true;
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return insertOk;
	}


	public boolean updateProperty(Property property) {
		boolean insertOk = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update property set " + "type=?," + "price=?," + "address=?,"
					+ "image=?," + "description=?," + "city=?," + "bedroom=?," + "bathroom=?,"
					+ "garage=?," + "pool=?," + "garden=?," + "gym=?," + "createdUser=?," +"user_id=? where id=?;");
			pStmt.setString(1, property.getType());
			pStmt.setDouble(2, property.getPrice());
			pStmt.setString(3, property.getAddress());
			pStmt.setString(4, property.getImage());
			pStmt.setString(5, property.getDescription());
			pStmt.setString(6, property.getCity());
			pStmt.setString(7, property.getBedroom());
			pStmt.setString(8, property.getBathroom());
			pStmt.setBoolean(9, property.isGarage());
			pStmt.setBoolean(10, property.isPool());
			pStmt.setBoolean(11, property.isGarden());
			pStmt.setBoolean(12, property.isGym());
			pStmt.setString(13, property.getCreatedUser());
			pStmt.setLong(14, property.getUser_id());
			pStmt.setLong(15, property.getId());

			int rowEffected = pStmt.executeUpdate();

			if (rowEffected > 0) {
				insertOk = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return insertOk;
	}

	public boolean deleteProperty(Long propertyId) {
		boolean delectOk = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from property where id=?;");
			pStmt.setLong(1, propertyId);

			int rowEffected = pStmt.executeUpdate();

			if (rowEffected > 0) {
				delectOk = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return delectOk;
	}

//	public List<Property> filterProperty(String query){
//		List<Property> filteredList = new ArrayList<>();
//		try {
//			connection = dataSource.getConnection();
//			stmt = connection.createStatement();
//			rs = stmt.executeQuery("select * from property "
//					+ "where `id`='"+query+"' or `type`='"+query+"' or `price`='"+query+"' or `address`='"+query+"' or `date`='"+query+"';");
//			while (rs.next()) {
//				filteredList.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
//						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
//						rs.getString("description"), rs.getBoolean("favorite"), rs.getLong("user_id"),
//						rs.getLong("agent_id")));
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return filteredList;
//	}

	public List<Property> searchProperty(String query) {
		List<Property> searchResults = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			String sqlQuery = "select * from property where LOWER(type) LIKE LOWER(?) OR LOWER(price) LIKE LOWER(?) OR LOWER(address) LIKE LOWER(?) OR LOWER(date) LIKE LOWER(?)";
			pStmt = connection.prepareStatement(sqlQuery);
			String searchString = "%" + query + "%";
			pStmt.setString(1, searchString);
			pStmt.setString(2, searchString);
			pStmt.setString(3, searchString);
			pStmt.setString(4, searchString);
			rs = pStmt.executeQuery();

			while (rs.next()) {
				Property property = new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"),
						rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"),
						rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"),
						rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"),
						rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser"));
				searchResults.add(property);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return searchResults;
	}
	
	public List<Property> advancedSearchProperty(String type, Double minPrice, Double maxPrice, String address, String city /*, String bedroom, String bathroom , Boolean garage, Boolean pool, Boolean garden, Boolean gym*/) {
        List<Property> searchResults = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            StringBuilder sql = new StringBuilder("SELECT * FROM property WHERE 1=1");
            
            if (type != null && !type.isEmpty()) {
                sql.append(" AND LOWER(type) LIKE LOWER(?)");
            }
            if (minPrice != null) {
                sql.append(" AND price >= ?");
            }
            if (maxPrice != null) {
                sql.append(" AND price <= ?");
            }
            if (address != null && !address.isEmpty()) {
                sql.append(" AND LOWER(address) LIKE LOWER(?)");
            }
            if (city != null && !city.isEmpty()) {
                sql.append(" AND LOWER(city) LIKE LOWER(?)");
            }
//            if (bedroom != null && !bedroom.isEmpty()) {
//                sql.append(" AND LOWER(bedroom) LIKE LOWER(?)");
//            }
//            if (bathroom != null && !bathroom.isEmpty()) {
//                sql.append(" AND LOWER(bathroom) LIKE LOWER(?)");
//            }
//            if (garage != null) {
//                sql.append(" AND garage = ?");
//            }
//            if (pool != null) {
//                sql.append(" AND pool = ?");
//            }
//            if (garden != null) {
//                sql.append(" AND garden = ?");
//            }
//            if (gym != null) {
//                sql.append(" AND gym = ?");
//            }

            pStmt = connection.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (type != null && !type.isEmpty()) {
                pStmt.setString(paramIndex++, "%" + type + "%");
            }
            if (minPrice != null) {
                pStmt.setDouble(paramIndex++, minPrice);
            }
            if (maxPrice != null) {
                pStmt.setDouble(paramIndex++, maxPrice);
            }
            if (address != null && !address.isEmpty()) {
                pStmt.setString(paramIndex++, "%" + address + "%");
            }
            if (city != null && !city.isEmpty()) {
                pStmt.setString(paramIndex++, "%" + city + "%");
            }
//            if (bedroom != null && !bedroom.isEmpty()) {
//                pStmt.setString(paramIndex++, "%" + bedroom + "%");
//            }
//            if (bathroom != null && !bathroom.isEmpty()) {
//                pStmt.setString(paramIndex++, "%" + bathroom + "%");
//            }
//            if (garage != null) {
//                pStmt.setBoolean(paramIndex++, garage);
//            }
//            if (pool != null) {
//                pStmt.setBoolean(paramIndex++, pool);
//            }
//            if (garden != null) {
//                pStmt.setBoolean(paramIndex++, garden);
//            }
//            if (gym != null) {
//                pStmt.setBoolean(paramIndex++, gym);
//            }

            rs = pStmt.executeQuery();

            while (rs.next()) {
                searchResults.add(new Property(rs.getLong("id"), rs.getString("type"), rs.getDouble("price"), rs.getString("address"), rs.getTimestamp("date").toLocalDateTime(), rs.getString("image"), rs.getString("description"), rs.getLong("user_id"), rs.getString("status"), rs.getString("city"), rs.getString("bedroom"), rs.getString("bathroom"), rs.getBoolean("garage"), rs.getBoolean("pool"), rs.getBoolean("garden"), rs.getBoolean("gym"), rs.getString("createdUser")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return searchResults;
    }

	

}
