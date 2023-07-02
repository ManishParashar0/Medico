package com.manish.madico.entity;

import java.util.Objects;

public class UserEntity {
	private int id;
	private String name;
	private String username;
	private String phone;
	private String email;
	private String password;
	private String profiletype;

	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", name=" + name + ", username=" + username + ", phone=" + phone + ", email="
				+ email + ", password=" + password + ", profiletype=" + profiletype + ", image_name=" + image_name
				+ ", getId()=" + getId() + ", getProfiletype()=" + getProfiletype() + ", getName()=" + getName()
				+ ", getUsername()=" + getUsername() + ", getPhone()=" + getPhone() + ", getEmail()=" + getEmail()
				+ ", getPassword()=" + getPassword() + ", getImage_name()=" + getImage_name() + ", hashCode()="
				+ hashCode() + ", getClass()=" + getClass() + ", toString()=" + super.toString() + "]";
	}

	public UserEntity(String name, String username, String phone, String email, String password, String profiletype,
			String image_name) {
		super();
		this.name = name;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.profiletype = profiletype;
		this.image_name = image_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProfiletype() {
		return profiletype;
	}

	public void setProfiletype(String profiletype) {
		this.profiletype = profiletype;
	}

	private String image_name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

	public UserEntity() {
		super();
	}

	@Override
	public int hashCode() {
		return Objects.hash(email, image_name, name, password, phone, username);
	}

	/*
	 * @Override public boolean equals(Object obj) { if (this == obj) return true;
	 * if (obj == null) return false; if (getClass() != obj.getClass()) return
	 * false; UserEntity other = (UserEntity) obj; return Objects.equals(email,
	 * other.email) && Objects.equals(image_name, other.image_name) &&
	 * Objects.equals(name, other.name) && Objects.equals(password, other.password)
	 * && phone == other.phone && Objects.equals(username, other.username); }
	 */

}
