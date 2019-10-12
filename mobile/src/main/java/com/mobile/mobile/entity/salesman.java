package com.mobile.mobile.entity;

import java.sql.Date;
import java.util.List;

public class salesman {
	private String name;
	private int start_salary;
	private int sale_value;
	private String address;
	private Date join_date;
	private Date leaving_date;
	private Date dob;
	private int sale_units;
	private int current_salary;
	private int id;
	private List<salesman_number> numbers;
	
	public List<salesman_number> getNumber()
	{
		return numbers;
	}
	public void setNumber(List<salesman_number> numbers)
	{
		this.numbers = numbers;
	}
	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name=name;
	}

	public int getStart_salary(){
		return start_salary;
	}

	public void setStart_salary(int start_salary){
		this.start_salary=start_salary;
	}

	public int getSale_value(){
		return sale_value;
	}

	public void setSale_value(int sale_value){
		this.sale_value=sale_value;
	}

	public String getAddress(){
		return address;
	}

	public void setAddress(String address){
		this.address=address;
	}

	public Date getJoin_date(){
		return join_date;
	}

	public void setJoin_date(Date join_date){
		this.join_date=join_date;
	}

	public Date getLeaving_date(){
		return leaving_date;
	}

	public void setLeaving_date(Date leaving_date){
		this.leaving_date=leaving_date;
	}

	public Date getDob(){
		return dob;
	}

	public void setDob(Date dob){
		this.dob=dob;
	}

	public int getSale_units(){
		return sale_units;
	}

	public void setSale_units(int sale_units){
		this.sale_units=sale_units;
	}

	public int getCurrent_salary(){
		return current_salary;
	}

	public void setCurrent_salary(int current_salary){
		this.current_salary=current_salary;
	}

	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}
}