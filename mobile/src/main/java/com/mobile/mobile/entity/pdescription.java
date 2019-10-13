package com.mobile.mobile.entity;

public class pdescription{
	private Long id;
	private String model;
	private int cost;
	private int pid;
	
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