package com.hostmdy.estate.model;

import java.time.LocalDateTime;

public class Buy {
	private Long id;
	private Long user_id;
	private String username;
	private Long property_id;
	private LocalDateTime buyDate;
	private String status;
	private String approvedBy;
    private String declinedBy;
	
	public Buy() {}

	public Buy(Long user_id,String username, Long property_id, LocalDateTime buyDate, String status) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.property_id = property_id;
		this.buyDate = LocalDateTime.now();
		this.status = status;
	}

	public Buy(Long id, Long user_id, String username, Long property_id, LocalDateTime buyDate, String status) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.username = username;
		this.property_id = property_id;
		this.buyDate = buyDate;
		this.status = status;
	}

	public Buy(Long id, Long user_id, String username, Long property_id, LocalDateTime buyDate, String status,
			String approvedBy, String declinedBy) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.username = username;
		this.property_id = property_id;
		this.buyDate = buyDate;
		this.status = status;
		this.approvedBy = approvedBy;
		this.declinedBy = declinedBy;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Long getProperty_id() {
		return property_id;
	}

	public void setProperty_id(Long property_id) {
		this.property_id = property_id;
	}

	public LocalDateTime getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(LocalDateTime buyDate) {
		this.buyDate = buyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getDeclinedBy() {
		return declinedBy;
	}

	public void setDeclinedBy(String declinedBy) {
		this.declinedBy = declinedBy;
	}

	@Override
	public String toString() {
		return "Buy [id=" + id + ", user_id=" + user_id + ", username=" + username + ", property_id=" + property_id
				+ ", buyDate=" + buyDate + ", status=" + status + ", approvedBy=" + approvedBy + ", declinedBy="
				+ declinedBy + "]";
	}

	

	
}
