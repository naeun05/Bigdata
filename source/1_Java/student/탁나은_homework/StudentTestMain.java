package com.lec.homework;

public class StudentTestMain {
	public static void main(String[] args) {
		Student[] student = { new Student ("���켺", 90, 80, 95),
										new Student ("���ϴ�", 100, 80, 95),
										new Student ("Ȳ����", 95, 80, 90),
										new Student ("������", 95, 90, 99),
										new Student ("������", 90, 90, 90)};
		
		System.out.println("\t�����������������������������������������������������");
		System.out.println(" \t\t\t\t����ǥ");
		System.out.println("\t----------------------------------------------------");
		System.out.println(Student.count);
		
		System.out.println("\t��ȣ"+"\t�̸�\t"+"����\t"+"����\t"+"����\t"+"����\t"+"���\t " );
		System.out.println("\t----------------------------------------------------");
		
		System.out.println();
		
	
		for( Student s : student) {
			s.print();
		}
		
		System.out.println("\t�����������������������������������������������������");
	
	}
}
