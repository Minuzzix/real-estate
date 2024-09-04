package com.hostmdy.estate.model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import com.hostmdy.estate.utility.PasswordEncoder;
import com.hostmdy.estate.utility.PasswordValidator;


public class UserDAO {

	private final DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;

	public UserDAO(DataSource dataSource) {
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

	public Optional<User> getUserByUsernameorEmail(String username) {
		Optional<User> userOptional = Optional.empty();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where username='" + username + "' or email='" +username +"';");

			while (rs.next()) {
				userOptional = Optional.of(new User(rs.getLong("id"), rs.getString("firstname"),
						rs.getString("lastname"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"), rs.getString("role"),
						rs.getTimestamp("createdAt").toLocalDateTime(), rs.getBoolean("enable")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return userOptional;
	}
	
	
	
	
	
	public boolean createUser(User user) {
		boolean insertOk = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("insert into user "
					+ "(firstname, lastname, username, email, password, phone, role, createdAt, enable) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?);");
			pStmt.setString(1, user.getFirstname());
			pStmt.setString(2, user.getLastname());
			pStmt.setString(3, user.getUsername());
			pStmt.setString(4, user.getEmail());
			try {
				pStmt.setString(5, PasswordEncoder.encode(user.getPassword()));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pStmt.setString(6, user.getPhone());
			pStmt.setString(7, user.getRole());
			pStmt.setTimestamp(8, Timestamp.valueOf(user.getCreatedAt()));
			pStmt.setBoolean(9, user.getEnable());
			
			int rowEffected = pStmt.executeUpdate();
			
			if(rowEffected > 0) {
				insertOk = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return insertOk;
		
	}
	
	public User getProfileById(Long userId) {
		User user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where id='" + userId + ";'");

			while (rs.next()) {
				user = new User(rs.getLong("id"), rs.getString("firstname"), rs.getString("lastname"),
						rs.getString("username"), rs.getString("email"), rs.getString("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	public boolean updateUser(User user) {
        boolean insertOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("UPDATE user SET "
                    + "firstname = ?, lastname = ?, username = ?, email = ?, phone = ? WHERE id = ?");
            pStmt.setString(1, user.getFirstname());
            pStmt.setString(2, user.getLastname());
            pStmt.setString(3, user.getUsername());
            pStmt.setString(4, user.getEmail());
            pStmt.setString(5, user.getPhone());
            pStmt.setLong(6, user.getId());
        

            int rowsAffected = pStmt.executeUpdate();
            if (rowsAffected > 0) {
            	insertOk = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return insertOk;
    }
	
	

	
	public boolean authenticate(String usernmae, String password) {
		Optional<User> userOptional = getUserByUsernameorEmail(usernmae);
		if(userOptional.isEmpty()) {
			return false;
		}
		
		User user = userOptional.get();
		 if (isUserBanned(user.getId())) {
		        return false;
		    }
		try {
			if(PasswordValidator.validatePassword(password, user.getPassword()) && user.getEnable()){
				return true;
			}
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
//	 public Optional<User> getUserById(Long id) {
//		 Optional<User> userOptional = Optional.empty();
//	     try {
//	    	 connection = dataSource.getConnection();
//	         pStmt = connection.prepareStatement("SELECT * FROM user WHERE id = ?");
//	         pStmt.setLong(1, id);
//	         rs = pStmt.executeQuery();
//	         	if (rs.next()) {
//	                userOptional = Optional.of(new User(rs.getLong("id"), rs.getString("firstname"),
//	                		rs.getString("lastname"), rs.getString("username"), rs.getString("email"),
//	                        rs.getString("password"), rs.getString("phone"), rs.getString("role"),
//	                        rs.getTimestamp("createdAt").toLocalDateTime(), rs.getBoolean("enable")));
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        } finally {
//	            close();
//	        }
//	        return userOptional;
//	    }
	
	public List<User> getAllProfile() {
		List<User> profile = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user ;");

			while (rs.next()) {
				profile .add(new User(rs.getLong("id"), rs.getString("firstname"),
						rs.getString("lastname"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"), rs.getString("role"),
						rs.getTimestamp("createdAt").toLocalDateTime(), rs.getBoolean("enable")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return profile;
	}
	

	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where role='user';");

			while (rs.next()) {
				userList .add(new User(rs.getLong("id"), rs.getString("firstname"),
						rs.getString("lastname"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"), rs.getString("role"),
						rs.getTimestamp("createdAt").toLocalDateTime(), rs.getBoolean("enable")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return userList;
	}
	
	
	public List<User> getAllAgents() {
	    List<User> agentList = new ArrayList<>();
	    try {
	        connection = dataSource.getConnection();
	        stmt = connection.createStatement();
	        rs = stmt.executeQuery("select * from user where role='agent';");

	        while (rs.next()) {
	            agentList.add(new User(rs.getLong("id"), rs.getString("firstname"),
	                    rs.getString("lastname"), rs.getString("username"), rs.getString("email"),
	                    rs.getString("password"), rs.getString("phone"), rs.getString("role"),
	                    rs.getTimestamp("createdAt").toLocalDateTime(), rs.getBoolean("enable")));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }

	    return agentList;
	}

	
	public boolean disableUser(Long userId) {
		boolean ok = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update user set "
					+ "enable=? where id=?;");
			pStmt.setBoolean(1, false);
			pStmt.setLong(2, userId);
			int rowEffected = pStmt.executeUpdate();
			
			if(rowEffected > 0) {
				ok = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return ok;
		
	}
	
	public boolean enableUser(Long userId) {
		boolean ok = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("update user set "
					+ "enable=? where id=?;");
			pStmt.setBoolean(1, true);
			pStmt.setLong(2, userId);
			int rowEffected = pStmt.executeUpdate();
			
			if(rowEffected > 0) {
				ok = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return ok;
		
	}
	
	 public boolean banUser(Long userId, int banMinutes) {
	        boolean ok = false;
	        try {
	            connection = dataSource.getConnection();
	            pStmt = connection.prepareStatement("UPDATE user SET ban_start = ?, ban_min = ? WHERE id = ?;");
	            pStmt.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
	            pStmt.setInt(2, banMinutes);
	            pStmt.setLong(3, userId);
	            int rowEffected = pStmt.executeUpdate();

	            if (rowEffected > 0) {
	                ok = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close();
	        }
	        return ok;
	    }

	    public boolean isUserBanned(Long userId) {
	        boolean isBanned = false;
	        try {
	            connection = dataSource.getConnection();
	            pStmt = connection.prepareStatement("SELECT ban_start, ban_min FROM user WHERE id = ?;");
	            pStmt.setLong(1, userId);
	            rs = pStmt.executeQuery();
	            if (rs.next()) {
	                Timestamp banStart = rs.getTimestamp("ban_start");
	                int banMinutes = rs.getInt("ban_min");
	                if (banStart != null && banMinutes > 0) {
	                    LocalDateTime banEndTime = banStart.toLocalDateTime().plusMinutes(banMinutes);
	                    if (LocalDateTime.now().isBefore(banEndTime)) {
	                        isBanned = true;
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close();
	        }
	        return isBanned;
	    }


	

} 