package com.lec.loop;

import java.util.Scanner;

public class Work04 {
	public static void main(String[] args) {
		  int computer, you ;
			Scanner scanner = new Scanner(System.in);
			do {
			System.out.println("����(0), ����(1), ��(2) �� �ϳ��� ������ : ");
			you = scanner.nextInt();
			
			if (you ==0) {
				System.out.println("����� ����");
				
			} else if (you == 1) {
				System.out.println("����� ����");
				
			} else if (you == 2) {
				System.out.println("����� ��");
				
			} else {
				System.out.println("�߸��� ���ڸ� �Է���");
				
			}//�����
			
			computer = (int)(Math.random()*3);
			
			if (computer ==0) {
				System.out.println("��ǻ�ʹ� ����");
			} else if (computer == 1) {
				System.out.println("��ǻ�ʹ� ������");
			} else {
				System.out.println("��ǻ�ʹ� ��");
			}//��ǻ��
			
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
			}//do				
			   while((you+1)%3== computer || you==computer || you>2 ) ; //do-while
			   scanner.close();
			   System.out.println("�̰���ϴ� ���ϵ帳�ϴ�");
			}//
	}


				
				
		
					
				
			

						
					
			
	




				
			
	


