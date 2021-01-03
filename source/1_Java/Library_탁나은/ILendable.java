package com.lec.examLib;

public interface ILendable {
	public int STATE_BORROWED = 1 ; 
	public int STATE_NORMAL = 0 ; 
	
	public void checkOut(String borrower, String checkOutDate); // ¥Î√‚
	public void checkIn (); // π›≥≥
	public void printState(); 
}
