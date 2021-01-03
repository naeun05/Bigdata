package com.lec.examLib;

import java.util.Scanner;

import com.lec.ex09lib.Book;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = {new Book("123ㄱ-100", "monkey", "강동원"),
				new Book("456ㄱ-101", "red","손예진"),
				new Book("789ㄱ-102", "apple","김태리"),
				new Book("987ㄱ-103", "banana","김준호"),
				new Book("654ㄱ-104", "train","전지현")};
		
		Scanner sc = new Scanner(System.in);
		int fn, idx=0;
		String bTitle, borrower, checkOutDate;
		
		do {
			System.out.println("1.대출 | 2.반납 | 3.도서 현황 | 0.종료");
			fn = sc.nextInt();
			switch(fn) {
			case 1 :
				System.out.println("어떤 도서를 대출하십니까?");
				bTitle = sc.next();
				for(idx = 0; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("해당 도서는 본 도서관이 소유하고 있지 않은 도서입니다.");
				}else if(books[idx].getState()==ILendable.STATE_BORROWED) {
					System.out.println("해당 도서는 대출중인 도서입니다.");
				}else {
					System.out.println("대출하시려는 분의 성함을 입력해주세요");
					borrower = sc.next();
					System.out.println("대출하시려는 날짜를 입력해주세요");
					checkOutDate = sc.next();
					books[idx].checkOut(borrower, checkOutDate);
				}	
				break;
			case 2 :
				System.out.println("어떤 도서를 반납하십니까?");
				bTitle = sc.next();
				for(idx = 0; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx==books.length) {
				System.out.println("해당 도서는 본 도서관이 소유하고 있지 않은 도서입니다.");
				}else {
				books[idx].checkIn();
				}
				break;
			
			case 3 :
				for(Book book : books) {
					book.printState();
				}
			}		
 	}while(fn!=0);
		System.out.println("시스템 종료");
 	


	}
 }


