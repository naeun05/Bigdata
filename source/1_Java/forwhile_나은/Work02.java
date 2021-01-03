package com.lec.loop;

public class Work02 {
	public static void main(String[] args) {
		int sum=0 ;
		for(int i=1 ;  i<=6 ; i++) {
			for(int j=1 ; j<=6 ; j++) {
				if(i+j==6) {
					sum=i+j ;
					System.out.println(i+","+j);
					
				}
			}
			
			
		}
		
		
	}

}
