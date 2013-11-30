package com.gngapps.yours.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Customer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Pattern(regexp = "[a-zA-Z0-9,.-_]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}", message = "Please Enter Valid Email")
	@Column(unique = true)
	private String username;
	private String firstname;
	private String lastname;
	private String password;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthday;
	@OneToOne
	private Role role;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_id")
	private List<CustomerSandwich> sandwichs;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_id")
	private List<CustomerSalad> salads;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_id")
	private List<CustomerDrink> drinks;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_id")
	private List<CustomerHotdog> hotdogs;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<CustomerSandwich> getSandwichs() {
		return sandwichs;
	}
	public void setSandwichs(List<CustomerSandwich> sandwichs) {
		this.sandwichs = sandwichs;
	}
	public List<CustomerSalad> getSalads() {
		return salads;
	}
	public void setSalads(List<CustomerSalad> salads) {
		this.salads = salads;
	}
	public List<CustomerDrink> getDrinks() {
		return drinks;
	}
	public void setDrinks(List<CustomerDrink> drinks) {
		this.drinks = drinks;
	}
	public List<CustomerHotdog> getHotdogs() {
		return hotdogs;
	}
	public void setHotdogs(List<CustomerHotdog> hotdogs) {
		this.hotdogs = hotdogs;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", username=" + username + ", firstname=" + firstname + ", lastname=" + lastname + ", password="
				+ password + ", birthday=" + birthday + ", role=" + role + ", sandwichs=" + sandwichs + ", salads=" + salads
				+ ", drinks=" + drinks + ", hotdogs=" + hotdogs + "]";
	}
	
}
