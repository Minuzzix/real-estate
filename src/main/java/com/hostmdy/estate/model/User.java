package com.hostmdy.estate.model;

import java.time.LocalDateTime;

public class User {
	
	private Long id;
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String password;
    private String phone;
    private String role;
    private LocalDateTime createdAt;
    private Boolean enable = true;
    private LocalDateTime ban_start;
    private Integer ban_min;
    
    public User() {}
    
    public User(String firstname, String lastname, String username, String email, String password,
			String phone, String role) {
		super();
		
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.role = role;
		this.createdAt = LocalDateTime.now();
	}

	public User(Long id, String firstname, String lastname, String username, String email,
			String phone) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.phone = phone;
	}

	public User(Long id, String firstname, String lastname, String username, String email, String password,
			String phone, String role, LocalDateTime createdAt, Boolean enable) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.role = role;
		this.createdAt = createdAt;
		this.enable = enable;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	
	public LocalDateTime getBan_start() {
        return ban_start;
    }

    public void setBan_start(LocalDateTime ban_start) {
        this.ban_start = ban_start;
    }
    
    public Integer getBan_min() {
        return ban_min;
    }

    public void setBan_min(Integer ban_min) {
        this.ban_min = ban_min;
    }

	
	@Override
	public String toString() {
		return "User [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", username=" + username
				+ ", email=" + email + ", password=" + password + ", phone=" + phone + ", role=" + role + ", createdAt="
				+ createdAt + ", enable=" + enable + "]";
	}

	
    
    

}
