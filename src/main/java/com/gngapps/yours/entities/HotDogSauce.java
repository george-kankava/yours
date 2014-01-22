package com.gngapps.yours.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class HotDogSauce {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nameGeo;
	private String nameRus;
	private String nameEng;
	private String descriptionGeo;
	private String descriptionEng;
	private String descriptionRus;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "hotdog_sauce_id")
	private List<HotdogSauceAmountAndPrice> hotdogSauceAmountAndPrice;
	@ManyToOne
	private FoodComponentImage foodComponentImage;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNameGeo() {
		return nameGeo;
	}
	public void setNameGeo(String nameGeo) {
		this.nameGeo = nameGeo;
	}
	public String getNameRus() {
		return nameRus;
	}
	public void setNameRus(String nameRus) {
		this.nameRus = nameRus;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getDescriptionGeo() {
		return descriptionGeo;
	}
	public void setDescriptionGeo(String descriptionGeo) {
		this.descriptionGeo = descriptionGeo;
	}
	public String getDescriptionEng() {
		return descriptionEng;
	}
	public void setDescriptionEng(String descriptionEng) {
		this.descriptionEng = descriptionEng;
	}
	public String getDescriptionRus() {
		return descriptionRus;
	}
	public void setDescriptionRus(String descriptionRus) {
		this.descriptionRus = descriptionRus;
	}
	public List<HotdogSauceAmountAndPrice> getHotdogSauceAmountAndPrice() {
		return hotdogSauceAmountAndPrice;
	}
	public void setHotdogSauceAmountAndPrice(
			List<HotdogSauceAmountAndPrice> hotdogSauceAmountAndPrice) {
		this.hotdogSauceAmountAndPrice = hotdogSauceAmountAndPrice;
	}
	public FoodComponentImage getFoodComponentImage() {
		return foodComponentImage;
	}
	public void setFoodComponentImage(FoodComponentImage foodComponentImage) {
		this.foodComponentImage = foodComponentImage;
	}
	@Override
	public String toString() {
		return "HotDogSauce [id=" + id + ", nameGeo=" + nameGeo + ", nameRus="
				+ nameRus + ", nameEng=" + nameEng + ", descriptionGeo="
				+ descriptionGeo + ", descriptionEng=" + descriptionEng
				+ ", descriptionRus=" + descriptionRus
				+ ", hotdogSauceAmountAndPrice=" + hotdogSauceAmountAndPrice
				+ ", foodComponentImage=" + foodComponentImage + "]";
	}
}
