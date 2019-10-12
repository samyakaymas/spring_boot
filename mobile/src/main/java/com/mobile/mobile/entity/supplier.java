package com.mobile.mobile.entity;

import java.util.List;

public class supplier {
	private String name;
	private String address;
	private int id;
	private List<supplier_number> numbers;

	public List<supplier_number> getNumber()
	{
		return numbers;
	}
	public void setNumber(List<supplier_number> numbers)
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

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}
}