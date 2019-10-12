package com.mobile.mobile.entity;

public class astock{
	private int cost_price;
	private int sell_price;
	private Long id;
	private String model;
	private String name;

	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	public int getCost_price(){
		return cost_price;
	}

	public void setCost_price(int cost_price){
		this.cost_price=cost_price;
	}

	public int getSell_price(){
		return sell_price;
	}

	public void setSell_price(int sell_price){
		this.sell_price=sell_price;
	}

	public Long getId(){
		return id;
	}

	public void setId(Long id){
		this.id=id;
	}

	public String getModel(){
		return model;
	}

	public void setModel(String model){
		this.model=model;
	}
}