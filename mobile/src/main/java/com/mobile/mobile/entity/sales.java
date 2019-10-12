package com.mobile.mobile.entity;

import java.util.List;

public class sales {
	private int id;
	private String moa;
	private int sell_price;
	private java.util.Date date;
	private int cid;
	private int sid;
	private List<sdescription> desc;

	public List<sdescription> getDesc()
	{
		return desc;
	}
	public void setDesc(List<sdescription> desc)
	{
		this.desc=desc;
	}
	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}

	public String getMoa(){
		return moa;
	}

	public void setMoa(String moa){
		this.moa=moa;
	}

	public int getSell_price(){
		return sell_price;
	}

	public void setSell_price(int sell_price){
		this.sell_price=sell_price;
	}

	public java.util.Date getDate(){
		return date;
	}

	public void setDate(java.util.Date date){
		this.date=date;
	}

	public int getCid(){
		return cid;
	}

	public void setCid(int cid){
		this.cid=cid;
	}

	public int getSid(){
		return sid;
	}

	public void setSid(int sid){
		this.sid=sid;
	}
}