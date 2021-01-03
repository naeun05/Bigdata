package com.lec.loop;

public class Work01 {
	public static void main(String[] args) {
		int result = 0 ;
		
		for(int i = 1 ; i<=20 ; i++ ) {
			for(int j = 1 ; j<=20 ; j++) {
			if(i%2 !=0 && i%3 !=0 ) {
				result +=i ;
				
			} //if
				
		}//for
	} System.out.println(result);
	}
}
