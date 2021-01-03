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
			throw new Exception("대출 가능한 도서가 아닙니다.");
		}
		this.borrower = borrower;
		
		checkoutDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");  // 질문 이 경우 오버라이드 안에만 넣어야하는지 앞에서 선언하면 에러
		
		System.out.println(bookTitle+"이(가) 대출 완료되었습니다.");
		state = STATE_BORROWED;
		System.out.println("[대출인] "+borrower);
		System.out.println("[대출일]"+sdf.format(checkoutDate));
	}
	@Override
	public void checkin() throws Exception {
		if(state!=STATE_BORROWED) {
			throw new Exception("대출 중인 도서가 아닙니다.");
		}
		Date now = new Date();   //밀리세컨 계산해서 며칠 지났는지 계산
		long diff = now.getTime() - checkoutDate.getTime();
		long day = diff / (24*60*60*1000);
		if(day>14) {
		
			System.out.println("연체료가 일일 100원 부과됩니다.");
			day= day -14;
			System.out.println("내셔야 할 연체료는 "+(day*100)+"원");
			System.out.println("연체료를 지불하셨습니까? (Y/N)");
			Scanner ok = new Scanner(System.in);
			String i = ok.next();
			if(! i.equalsIgnoreCase("y")) {
			System.out.println("연체료를 지불해주세요.");
		}
	}else {
			System.out.println("반납이 완료되었습니다.");
			state = STATE_NORMAL;
			checkoutDate = null;
			this.borrower = null;
	}
}//

	@Override
	public String toString() {
		String result = " ["+bookNo + " | "+ bookTitle+ " | "+writer+ " | "+" 대출 상태 : ";
		if(state==STATE_NORMAL) {
			 result += "대출 가능" ;
		}else if (state==STATE_BORROWED) {
			result += "대출 중" ;
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
