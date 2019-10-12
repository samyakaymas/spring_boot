package com.mobile.mobile.entity;

public class pdescription{
	private int id;
	private String model;
	private int cost;
	private int pid;
	
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

	public int getCost(){
		return cost;
	}

	public void setCost(int cost){
		this.cost=cost;
	}

	public int getPid(){
		return pid;
	}

	public void setPid(int pid){
		this.pid=pid;
	}
}