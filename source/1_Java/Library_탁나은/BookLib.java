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
			System.out.println("�������� �����Դϴ�.");
			return;
		}
		this.borrower = borrower;
		this.checkOutDate =checkOutDate;
		state = STATE_BORROWED;
		System.out.println("������ ����Ǿ����ϴ�.");

	}

	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("���� ���� ������ �ƴմϴ�.");
			return;
		}
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println("�ݳ��� �Ϸ�Ǿ����ϴ�.");

	}

	@Override
	public void printState() {
		if(state == STATE_NORMAL) {
			System.out.printf("%s, %s�� - ���� ����\n",
					getBookTitle(), getWriter());
		}else if (state == STATE_BORROWED) {
			System.out.printf("%s, %s�� - ������\n",
					getBookTitle(), getWriter());
		}else {
			System.out.printf("%s, %s�� - ���ɻ����Դϴ�.\n",
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