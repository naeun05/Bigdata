package com.lec.ex2_dataInputStreamoutputStream;

public class Product {
	private String name;
	private int price;
	private int ps;
	
	public Product(String name, int price, int ps) {
		this.name = name;
		this.price = price;
		this.ps = ps;
	}

	@Override
	public String toString() {
		return name+"\t"+price+"\t"+ps;
	}
	
	

}
