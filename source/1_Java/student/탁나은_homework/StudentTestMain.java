package com.lec.homework;

public class StudentTestMain {
	public static void main(String[] args) {
		Student[] student = { new Student ("정우성", 90, 80, 95),
										new Student ("김하늘", 100, 80, 95),
										new Student ("황정민", 95, 80, 90),
										new Student ("강동원", 95, 90, 99),
										new Student ("유아인", 90, 90, 90)};
		
		System.out.println("\t■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println(" \t\t\t\t성적표");
		System.out.println("\t----------------------------------------------------");
		System.out.println(Student.count);
		
		System.out.println("\t번호"+"\t이름\t"+"국어\t"+"영어\t"+"수학\t"+"총점\t"+"평균\t " );
		System.out.println("\t----------------------------------------------------");
		
		System.out.println();
		
	
		for( Student s : student) {
			s.print();
		}
		
		System.out.println("\t■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
	
	}
}
