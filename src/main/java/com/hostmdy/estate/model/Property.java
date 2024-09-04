package com.hostmdy.estate.model;

import java.time.LocalDateTime;

public class Property {
	private Long id;
	private String type;
	private Double price;
	private String address;
	private LocalDateTime date;
	private String image;
	private String description;
	private Long user_id;
	private Boolean favorite;
	private String status;
	private String city;
	private String bedroom;
	private String bathroom;
	private boolean garage = true;
	private boolean pool = true;
	private boolean garden = true;
	private boolean gym = true;
	private String createdUser;
	
	
	public Property() {}

	//for insert
	public Property(String type, Double price, String address, String image, String description, Long user_id, 
			String city, String bedroom, String bathroom, Boolean garage, Boolean pool, Boolean garden, Boolean gym, String createdUser) {
		super();
		this.type = type;
		this.price = price;
		this.address = address;
		this.image = image;
		this.description = description;
		this.user_id = user_id;
		this.date = LocalDateTime.now();
		this.city = city;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.garage = garage;
		this.pool = pool;
		this.garden = garden;
		this.gym = gym;
		this.createdUser = createdUser;
	}

	//for update
	public Property(Long id, String type, Double price, String address,String image,String description, Long user_id,
			String city, String bedroom, String bathroom, Boolean garage, Boolean pool, Boolean garden, Boolean gym, String createdUser) {
		super();
		this.id = id;
		this.type = type;
		this.price = price;
		this.address = address;
		this.image = image;
		this.description = description;
		this.user_id = user_id;
		this.city = city;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.garage = garage;
		this.pool = pool;
		this.garden = garden;
		this.gym = gym;
		this.createdUser = createdUser;
		
	}
	
	public Property(Long id, String type, Double price, String address, LocalDateTime date, String image,String description, Long user_id, String status,
			String city, String bedroom, String bathroom, Boolean garage, Boolean pool, Boolean garden, Boolean gym, String createdUser) {
		super();
		this.id = id;
		this.type = type;
		this.price = price;
		this.address = address;
		this.date = date;
		this.image = image;
		this.description = description;
		this.user_id = user_id;
		this.status = status;
		this.city = city;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.garage = garage;
		this.pool = pool;
		this.garden = garden;
		this.gym = gym;
		this.createdUser = createdUser;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public Boolean getFavorite() {
		return favorite;
	}

	public void setFavorite(Boolean favorite) {
		this.favorite = favorite;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBedroom() {
		return bedroom;
	}

	public void setBedroom(String bedroom) {
		this.bedroom = bedroom;
	}

	public String getBathroom() {
		return bathroom;
	}

	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}

	public boolean isGarage() {
		return garage;
	}

	public void setGarage(boolean garage) {
		this.garage = garage;
	}

	public boolean isPool() {
		return pool;
	}

	public void setPool(boolean pool) {
		this.pool = pool;
	}

	public boolean isGarden() {
		return garden;
	}

	public void setGarden(boolean garden) {
		this.garden = garden;
	}

	public boolean isGym() {
		return gym;
	}

	public void setGym(boolean gym) {
		this.gym = gym;
	}

	public String getCreatedUser() {
		return createdUser;
	}

	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}

	@Override
	public String toString() {
		return "Property [id=" + id + ", type=" + type + ", price=" + price + ", address=" + address + ", date=" + date
				+ ", image=" + image + ", description=" + description + ", user_id=" + user_id + ", favorite="
				+ favorite + ", status=" + status + ", city=" + city + ", bedroom=" + bedroom + ", bathroom=" + bathroom
				+ ", garage=" + garage + ", pool=" + pool + ", garden=" + garden + ", gym=" + gym + ", createdUser="
				+ createdUser + "]";
	}

}
