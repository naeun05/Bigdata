package com.lec.loop;

import java.util.Scanner;

public class Work03 {
	public static void main(String[] args) {
    int computer, you ;
	Scanner scanner = new Scanner(System.in);
	while(true) {	
	System.out.println("����(0), ����(1), ��(2) �� �ϳ��� ������ (���Ḧ ���� ��� -1) : ");
	
	you = scanner.nextInt();
	
	if(you==-1) {
		break;
	}
	
	if (you ==0) {
		System.out.println("����� ����");
		
	} else if (you == 1) {
		System.out.println("����� ����");
		
	} else if (you == 2) {
		System.out.println("����� ��");
		
	} else {
		System.out.println("�߸��� ���ڸ� �Է���");
		
	}		
	
	
	computer = (int)(Math.random()*3);
	if (computer ==0) {
		System.out.println("��ǻ�ʹ� ����");
	} else if (computer == 1) {
		System.out.println("��ǻ�ʹ� ������");
	} else {
		System.out.println("��ǻ�ʹ� ��");
	}
	if ( you == 0 ) {
		if (computer == 0) {
			System.out.println("���");
		} else if (computer == 1) {
			System.out.println("��ǻ�� ��");
		} else {
			System.out.println("����� ��");
		}
	}
	
		else if ( you == 1 ) {
			if (computer == 0) {
				System.out.println("��� ��");
			} else if (computer == 1) {
				System.out.println("���");
			} else {
				System.out.println("��ǻ�� ��");
			}
	}
	
	
		else if ( you == 2 ) {
			if (computer == 0) {
				System.out.println("��ǻ�� ��");
			} else if (computer == 1) {
				System.out.println("����� ��");
			} else {
				System.out.println("���");

	
	
	
				}
			}
		}
	}
}
