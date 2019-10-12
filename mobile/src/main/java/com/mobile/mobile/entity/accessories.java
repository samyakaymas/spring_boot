package com.mobile.mobile.entity;

import java.util.List;

public class accessories {
	private String model;
	private String name;
	private String type;
	private String brand;
	private int price;
	private List<aspecs> specs;
	
	public void setSpecs(List<aspecs> specs)
	{
		this.specs = specs;
	}
	public List<aspecs> getSpecs()
	{
		return specs;
	}
	public int getPrice(){
		return price;
	}
	public void setPrice(int price){
		this.price = price;
	}
	public String getModel(){
		return model;
	}

	public void setModel(String model){
		this.model=model;
	}

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getType(){
		return type;
	}

	public void setType(String type){
		this.type=type;
	}

	public String getBrand(){
		return brand;
	}

	public void setBrand(String brand){
		this.brand=brand;
	}
}