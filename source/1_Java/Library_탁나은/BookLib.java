package com.lec.examLib;

import com.lec.ex09lib.ILendable;

public class BookLib extends BookInfo implements ILendable {
	private String borrower; 
	private String checkOutDate;
	private int state; 
	
	public BookLib() {}

	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}
	public BookLib(String borrower, String checkOutDate, int state) {
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		this.state = state;
	}

	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state != STATE_NORMAL) {
			System.out.println("대출중인 도서입니다.");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate =checkOutDate;
		state = STATE_BORROWED;
		System.out.println("도서가 대출되었습니다.");

	}

	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("대출 중인 도서가 아닙니다.");
			return;
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println("반납이 완료되었습니다.");

	}

	@Override
	public void printState() {
		if(state == STATE_NORMAL) {
			System.out.printf("%s, %s저 - 대출 가능\n",
					getBookTitle(), getWriter());
		}else if (state == STATE_BORROWED) {
			System.out.printf("%s, %s저 - 대출중\n",
					getBookTitle(), getWriter());
		}else {
			System.out.printf("%s, %s저 - 유령상태입니다.\n",
					getBookTitle(), getWriter());

	}
  }

	public String getBorrower() {
		return borrower;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public int getState() {
		return state;
	}
}