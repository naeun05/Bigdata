package com.lec.ex4_Object;

public class Ex04_Rectangle {
	public static void main(String[] args) {
		Rectangle r1 = new Rectangle();
		Rectangle r2 = new Rectangle(30, 40, "»¡°­");
		Rectangle r3 = new Rectangle(30, 40, "»¡°­");
		Rectangle r4 = new Rectangle(40, 40, "»¡°­");
		
		System.out.println(r1);
		System.out.println(r2);
		System.out.println(r3);
		System.out.println(r4);
		
		System.out.println(r2.equals(r3));
		System.out.println(r3.equals(r4));
	}

}
