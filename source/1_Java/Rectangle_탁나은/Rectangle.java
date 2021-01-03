package com.lec.ex4_Object;

public class Rectangle {
	private int width;
	private int height;
	private String color;
	
	public Rectangle() {
		this.width = 0;
		this.height = 0;
		this.color = "검정";
	}
	
	public Rectangle(int width, int height, String color) {
		this.width = width;
		this.height = height;
		this.color = "빨강";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj!=null && obj instanceof Rectangle) {
			if(width==((Rectangle)obj).width && height==((Rectangle)obj).height && color==((Rectangle)obj).color) {
				return true;
			}
		}//
		return false;
	}

	@Override
	public String toString() {
		return "[가로 "+width+"cm, "+"세로 "+height+"cm의 "+color+"색 사각형]" ;
	}
	
	
	
	
	
	

	
	

}
