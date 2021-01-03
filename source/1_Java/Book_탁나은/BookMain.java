package com.lec.ex5_library;

import java.io.ObjectInputStream.GetField;
import java.util.Date;
import java.util.Scanner;

public class BookMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("123ㄱ-100", "monkey", "강동원"),
				new BookLib("456ㄱ-101", "red","손예진"),
				new BookLib("789ㄱ-102", "apple","김태리")};
		Scanner scanner = new Scanner(System.in);
		int fn,idx;
		String bTitle, borrower;
		
		do {
			System.out.println("0.전체 대출 현황 열람 1.대출 2.반납 그외:종료 ");
			fn= scanner.nextInt();
			switch(fn) {
			case 0 :
				for(BookLib book : books) {
					System.out.println(book);
				}
				break;
			case 1 :
				System.out.println("어떤 도서를 대출하십니까?");
				bTitle = scanner.next();
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
					borrower = scanner.next();
					try {
						books[idx].checkout(borrower);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}	
						break;
				case 2 :
					System.out.println("어떤 도서를 반납하십니까?");
					bTitle = scanner.next();
					for(idx = 0; idx<books.length ; idx++) {
						if(bTitle.equals(books[idx].getBookTitle())) {
							break;
						}
					}
					if(idx==books.length) {
						System.out.println("해당 도서는 본 도서관이 소유하고 있지 않은 도서입니다.");
					}else {
						try {
						books[idx].checkin();
					}catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}
			break;
	
		}while(fn==0 || fn==1 || fn==2 );
					System.out.println("종료되었습니다.");
		
			
		
		}
		
}
