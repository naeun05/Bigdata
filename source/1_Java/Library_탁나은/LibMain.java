package com.lec.examLib;

import java.util.Scanner;

import com.lec.ex09lib.Book;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = {new Book("123��-100", "monkey", "������"),
				new Book("456��-101", "red","�տ���"),
				new Book("789��-102", "apple","���¸�"),
				new Book("987��-103", "banana","����ȣ"),
				new Book("654��-104", "train","������")};
		
		Scanner sc = new Scanner(System.in);
		int fn, idx=0;
		String bTitle, borrower, checkOutDate;
		
		do {
			System.out.println("1.���� | 2.�ݳ� | 3.���� ��Ȳ | 0.����");
			fn = sc.nextInt();
			switch(fn) {
			case 1 :
				System.out.println("� ������ �����Ͻʴϱ�?");
				bTitle = sc.next();
				for(idx = 0; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx==books.length) {
					System.out.println("�ش� ������ �� �������� �����ϰ� ���� ���� �����Դϴ�.");
				}else if(books[idx].getState()==ILendable.STATE_BORROWED) {
					System.out.println("�ش� ������ �������� �����Դϴ�.");
				}else {
					System.out.println("�����Ͻ÷��� ���� ������ �Է����ּ���");
					borrower = sc.next();
					System.out.println("�����Ͻ÷��� ��¥�� �Է����ּ���");
					checkOutDate = sc.next();
					books[idx].checkOut(borrower, checkOutDate);
				}	
				break;
			case 2 :
				System.out.println("� ������ �ݳ��Ͻʴϱ�?");
				bTitle = sc.next();
				for(idx = 0; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx==books.length) {
				System.out.println("�ش� ������ �� �������� �����ϰ� ���� ���� �����Դϴ�.");
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
		System.out.println("�ý��� ����");
 	


	}
 }


