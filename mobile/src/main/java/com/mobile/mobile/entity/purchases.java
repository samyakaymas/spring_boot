package com.mobile.mobile.entity;

import java.util.List;

public class purchases {
	private int id;
	private java.util.Date date;
	private String moa;
	private int sid;
	private List<pdescription> desc;
	public List<pdescription> getDesc()
	{
		return desc;
	}
	public void setDesc(List<pdescription> desc)
	{
		this.desc = desc;
	}
	
	public int getId(){
		return id;
	}

	public void setId(int id){
		this.id=id;
	}

	public java.util.Date getDate(){
		return date;
	}

	public void setDate(java.util.Date date){
		this.date=date;
	}

	public String getMoa(){
		return moa;
	}

	public void setMoa(String moa){
		this.moa=moa;
	}

	public int getSid(){
		return sid;
	}

	public void setSid(int sid){
		this.sid=sid;
	}
}