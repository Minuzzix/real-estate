package com.hostmdy.estate.model;

import java.time.LocalDateTime;

public class Recommend {
	private Long id;
	private String message;
	private LocalDateTime sendAt;
	private Long user_id;
	private String username;
	
	
	public Recommend() {}


	public Recommend(String message, Long user_id, String username) {
		super();
		this.message = message;
		this.sendAt = LocalDateTime.now();
		this.user_id = user_id;
		this.username = username;
	}


	public Recommend(Long id, String message, LocalDateTime sendAt, Long user_id, String username) {
		super();
		this.id = id;
		this.message = message;
		this.sendAt = sendAt;
		this.user_id = user_id;
		this.username = username;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public LocalDateTime getSendAt() {
		return sendAt;
	}


	public void setSendAt(LocalDateTime sendAt) {
		this.sendAt = sendAt;
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


	@Override
	public String toString() {
		return "Recommend [id=" + id + ", message=" + message + ", sendAt=" + sendAt + ", user_id=" + user_id
				+ ", username=" + username + "]";
	}


	
}
