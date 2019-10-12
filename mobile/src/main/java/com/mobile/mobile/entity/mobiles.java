package com.mobile.mobile.entity;

import java.util.List;

public class mobiles {
	private String model;
	private String name;
	private String b_name;
	private String display;
	private double screen;
	private String resolution;
	private int fcamera;
	private int rcamera;
	private double bluetooth;
	private double wifi;
	private String network;
	private int exmemory;
	private String fcharge;
	private double usb;
	private int battery;
	private int ram;
	private String gpu;
	private String cpu;
	private String platform;
	private String dualsim;
	private int smemory;
	private int price;
	private List<colors> color;

	public List<colors> getColor()
	{
		return color;
	}
	public void setColor(List<colors> color)
	{
		this.color = color;
	}
	public String getModel(){
		return model;
	}

	public void setModel(String model){
		this.model=model;
	}

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getB_name(){
		return b_name;
	}

	public void setB_name(String b_name){
		this.b_name=b_name;
	}

	public String getDisplay(){
		return display;
	}

	public void setDisplay(String display){
		this.display=display;
	}

	public double getScreen(){
		return screen;
	}

	public void setScreen(double screen){
		this.screen=screen;
	}

	public String getResolution(){
		return resolution;
	}

	public void setResolution(String resolution){
		this.resolution=resolution;
	}

	public int getFcamera(){
		return fcamera;
	}

	public void setFcamera(int fcamera){
		this.fcamera=fcamera;
	}

	public int getRcamera(){
		return rcamera;
	}

	public void setRcamera(int rcamera){
		this.rcamera=rcamera;
	}

	public double getBluetooth(){
		return bluetooth;
	}

	public void setBluetooth(double bluetooth){
		this.bluetooth=bluetooth;
	}

	public double getWifi(){
		return wifi;
	}

	public void setWifi(double wifi){
		this.wifi=wifi;
	}

	public String getNetwork(){
		return network;
	}

	public void setNetwork(String network){
		this.network=network;
	}

	public int getExmemory(){
		return exmemory;
	}

	public void setExmemory(int exmemory){
		this.exmemory=exmemory;
	}

	public String getFcharge(){
		return fcharge;
	}

	public void setFcharge(String fcharge){
		this.fcharge=fcharge;
	}

	public double getUsb(){
		return usb;
	}

	public void setUsb(double usb){
		this.usb=usb;
	}

	public int getBattery(){
		return battery;
	}

	public void setBattery(int battery){
		this.battery=battery;
	}

	public int getRam(){
		return ram;
	}

	public void setRam(int ram){
		this.ram=ram;
	}

	public String getGpu(){
		return gpu;
	}

	public void setGpu(String gpu){
		this.gpu=gpu;
	}

	public String getCpu(){
		return cpu;
	}

	public void setCpu(String cpu){
		this.cpu=cpu;
	}

	public String getPlatform(){
		return platform;
	}

	public void setPlatform(String platform){
		this.platform=platform;
	}

	public String getDualsim(){
		return dualsim;
	}

	public void setDualsim(String dualsim){
		this.dualsim=dualsim;
	}

	public int getSmemory(){
		return smemory;
	}

	public void setSmemory(int smemory){
		this.smemory=smemory;
	}

	public int getPrice(){
		return price;
	}

	public void setPrice(int price){
		this.price=price;
	}
}