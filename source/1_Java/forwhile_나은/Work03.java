package com.lec.loop;

import java.util.Scanner;

public class Work03 {
	public static void main(String[] args) {
    int computer, you ;
	Scanner scanner = new Scanner(System.in);
	while(true) {	
	System.out.println("가위(0), 바위(1), 보(2) 중 하나를 내세요 (종료를 원할 경우 -1) : ");
	
	you = scanner.nextInt();
	
	if(you==-1) {
		break;
	}
	
	if (you ==0) {
		System.out.println("사용자 가위");
		
	} else if (you == 1) {
		System.out.println("사용자 바위");
		
	} else if (you == 2) {
		System.out.println("사용자 보");
		
	} else {
		System.out.println("잘못된 숫자를 입력함");
		
	}		
	
	
	computer = (int)(Math.random()*3);
	if (computer ==0) {
		System.out.println("컴퓨터는 가위");
	} else if (computer == 1) {
		System.out.println("컴퓨터는 바위야");
	} else {
		System.out.println("컴퓨터는 보");
	}
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
		}
	}
}
