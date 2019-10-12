package com.mobile.mobile.entity;

public class otherexpenses{
	private int id;
	private int cost;
	private java.util.Date date;
	private String purpose;

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}

	public int getCost(){
		return cost;
	}

	public void setCost(int cost){
		this.cost=cost;
	}

	public java.util.Date getDate(){
		return date;
	}

	public void setDate(java.util.Date date){
		this.date=date;
	}

	public String getPurpose(){
		return purpose;
	}

	public void setPurpose(String purpose){
		this.purpose=purpose;
	}
}