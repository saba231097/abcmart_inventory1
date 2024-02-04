package com.app.beans;

public class Product {
	public int id;
	public String name;
	public int qty;
	public double price_per_unit;
	public Product(int id, String name, int qty, double price_per_unit) {
		super();
		this.id = id;
		this.name = name;
		this.qty = qty;
		this.price_per_unit = price_per_unit;
	}
	

}
