package com.lec.ex5_library;

import java.util.Scanner;

public interface ILendable {
	public byte STATE_BORROWED = 1;
	public byte STATE_NORMAL = 0;
	
	public void checkout (String borrower)throws Exception;
	public void checkin() throws Exception;

}
