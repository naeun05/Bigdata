package com.lec.homework;

public class Student {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	
	//넘버링
	
	private int serialNo;
	public static int count=0;

	

	
	//생성자
	
	public Student() {}
	
	public Student (String name, int kor, int eng, int mat ) {
		
		serialNo=++count;
				
		
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor+eng+mat;
		avg = tot/3.0;
	}
	
	public void print() {
		System.out.printf("\t%d \t%s \t%d \t%d \t%d \t%d \t %.1f \n",serialNo,name,kor,eng,mat,tot,avg);
	}
	//
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getKor() {
		return kor;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getEng() {
		return eng;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getMat() {
		return mat;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public int getTot() {
		return tot;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public double getAvg() {
		return avg;
	}
	
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	

}
