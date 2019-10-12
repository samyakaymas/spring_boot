package com.mobile.mobile.entity;

public class sdescription{
	private int id;
	private String model;
	private int sell_price;
	private int sid;

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}

	public String getModel(){
		return model;
	}

	public void setModel(String model){
		this.model=model;
	}

	public int getSell_price(){
		return sell_price;
	}

	public void setSell_price(int sell_price){
		this.sell_price=sell_price;
	}

	public int getSid(){
		return sid;
	}

	public void setSid(int sid){
		this.sid=sid;
	}
}