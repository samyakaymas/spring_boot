package com.mobile.mobile.entity;

public class mstock{
	private int CostPrice;
	private int SellingPrice;
	private int id;
	private String model;
	private String name;

	public String getName()
	{
		return this.name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getCostprice(){
		return CostPrice;
	}

	public void setCostprice(int CostPrice){
		this.CostPrice=CostPrice;
	}

	public int getSellingprice(){
		return SellingPrice;
	}

	public void setSellingprice(int SellingPrice){
		this.SellingPrice=SellingPrice;
	}

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
}