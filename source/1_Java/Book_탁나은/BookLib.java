package com.lec.ex5_library;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class BookLib implements ILendable {
	private String bookNo;
	private String bookTitle;
	private String writer;
	private String borrower;
	private Date checkoutDate;
	private byte state;
	
	public BookLib() {}
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
		borrower = null;
		state = STATE_NORMAL;
	}
	

	@Override
	public void checkout(String borrower) throws Exception {
		if(state!= STATE_NORMAL) {
			throw new Exception("���� ������ ������ �ƴմϴ�.");
		}
		this.borrower = borrower;
		
		checkoutDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd�� (E)");  // ���� �� ��� �������̵� �ȿ��� �־���ϴ��� �տ��� �����ϸ� ����
		
		System.out.println(bookTitle+"��(��) ���� �Ϸ�Ǿ����ϴ�.");
		state = STATE_BORROWED;
		System.out.println("[������] "+borrower);
		System.out.println("[������]"+sdf.format(checkoutDate));
	}
	@Override
	public void checkin() throws Exception {
		if(state!=STATE_BORROWED) {
			throw new Exception("���� ���� ������ �ƴմϴ�.");
		}
		Date now = new Date();   //�и����� ����ؼ� ��ĥ �������� ���
		long diff = now.getTime() - checkoutDate.getTime();
		long day = diff / (24*60*60*1000);
		if(day>14) {
		
			System.out.println("��ü�ᰡ ���� 100�� �ΰ��˴ϴ�.");
			day= day -14;
			System.out.println("���ž� �� ��ü��� "+(day*100)+"��");
			System.out.println("��ü�Ḧ �����ϼ̽��ϱ�? (Y/N)");
			Scanner ok = new Scanner(System.in);
			String i = ok.next();
			if(! i.equalsIgnoreCase("y")) {
			System.out.println("��ü�Ḧ �������ּ���.");
		}
	}else {
			System.out.println("�ݳ��� �Ϸ�Ǿ����ϴ�.");
			state = STATE_NORMAL;
			checkoutDate = null;
			this.borrower = null;
	}
}//

	@Override
	public String toString() {
		String result = " ["+bookNo + " | "+ bookTitle+ " | "+writer+ " | "+" ���� ���� : ";
		if(state==STATE_NORMAL) {
			 result += "���� ����" ;
		}else if (state==STATE_BORROWED) {
			result += "���� ��" ;
		}
		return result;
	}
		

	public String getBookNo() {
		return bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public String getBorrower() {
		return borrower;
	}

	public Date getCheckoutDate() {
		return checkoutDate;
	}

	public byte getState() {
		return state;
	}
	

}
