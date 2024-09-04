package com.hostmdy.estate.model;

public class Favorite {

	private Long id;
    private Long user_id;
    private Long property_id;
	
    public Favorite() {}
    
    

	public Favorite(Long user_id, Long property_id) {
		super();
		this.user_id = user_id;
		this.property_id = property_id;
	}

	public Favorite(Long id, Long user_id, Long property_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.property_id = property_id;
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

	public Long getProperty_id() {
		return property_id;
	}

	public void setProperty_id(Long property_id) {
		this.property_id = property_id;
	}

	@Override
	public String toString() {
		return "Favorite [id=" + id + ", user_id=" + user_id + ", property_id=" + property_id + "]";
	}

	

}
