package com.lec.ex5_library;

import java.io.ObjectInputStream.GetField;
import java.util.Date;
import java.util.Scanner;

public class BookMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("123��-100", "monkey", "������"),
				new BookLib("456��-101", "red","�տ���"),
				new BookLib("789��-102", "apple","���¸�")};
		Scanner scanner = new Scanner(System.in);
		int fn,idx;
		String bTitle, borrower;
		
		do {
			System.out.println("0.��ü ���� ��Ȳ ���� 1.���� 2.�ݳ� �׿�:���� ");
			fn= scanner.nextInt();
			switch(fn) {
			case 0 :
				for(BookLib book : books) {
					System.out.println(book);
				}
				break;
			case 1 :
				System.out.println("� ������ �����Ͻʴϱ�?");
				bTitle = scanner.next();
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
					borrower = scanner.next();
					try {
						books[idx].checkout(borrower);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}	
						break;
				case 2 :
					System.out.println("� ������ �ݳ��Ͻʴϱ�?");
					bTitle = scanner.next();
					for(idx = 0; idx<books.length ; idx++) {
						if(bTitle.equals(books[idx].getBookTitle())) {
							break;
						}
					}
					if(idx==books.length) {
						System.out.println("�ش� ������ �� �������� �����ϰ� ���� ���� �����Դϴ�.");
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
					System.out.println("����Ǿ����ϴ�.");
		
			
		
		}
		
}
