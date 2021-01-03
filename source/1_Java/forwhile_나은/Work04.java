package com.lec.loop;

import java.util.Scanner;

public class Work04 {
	public static void main(String[] args) {
		  int computer, you ;
			Scanner scanner = new Scanner(System.in);
			do {
			System.out.println("가위(0), 바위(1), 보(2) 중 하나를 내세요 : ");
			you = scanner.nextInt();
			
			if (you ==0) {
				System.out.println("사용자 가위");
				
			} else if (you == 1) {
				System.out.println("사용자 바위");
				
			} else if (you == 2) {
				System.out.println("사용자 보");
				
			} else {
				System.out.println("잘못된 숫자를 입력함");
				
			}//사용자
			
			computer = (int)(Math.random()*3);
			
			if (computer ==0) {
				System.out.println("컴퓨터는 가위");
			} else if (computer == 1) {
				System.out.println("컴퓨터는 바위야");
			} else {
				System.out.println("컴퓨터는 보");
			}//컴퓨터
			
			if ( you == 0 ) {
				if (computer == 0) {
					System.out.println("비김");
				} else if (computer == 1) {
					System.out.println("컴퓨터 승");
				} else {
					System.out.println("당신이 승");
				}
			}
			
				else if ( you == 1 ) {
					if (computer == 0) {
						System.out.println("당신 승");
					} else if (computer == 1) {
						System.out.println("비김");
					} else {
						System.out.println("컴퓨터 승");
					}
			}
				else if ( you == 2 ) {
					if (computer == 0) {
						System.out.println("컴퓨터 승");
					} else if (computer == 1) {
						System.out.println("당신이 승");
					} else {
						System.out.println("비김");
					}
				}
			}//do				
			   while((you+1)%3== computer || you==computer || you>2 ) ; //do-while
			   scanner.close();
			   System.out.println("이겼습니다 축하드립니다");
			}//
	}


				
				
		
					
				
			

						
					
			
	




				
			
	


