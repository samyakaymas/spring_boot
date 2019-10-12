package com.mobile.mobile.entity;

import java.util.List;

public class customer {
	private String name;
	private String address;
	private java.util.Date dob;
	private int id;
	private List<customer_number> numbers;
	
	public List<customer_number> getNumber()
	{
		return numbers;
	}
	public void setNumber(List<customer_number> numbers)
	{
		this.numbers = numbers;
	}
	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getAddress(){
		return address;
	}

	public void setAddress(String address){
		this.address=address;
	}

	public java.util.Date getDob(){
		return dob;
	}

	public void setDob(java.util.Date dob){
		this.dob=dob;
	}

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}
}