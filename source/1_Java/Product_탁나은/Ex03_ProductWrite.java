package com.lec.ex2_dataInputStreamoutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class Ex03_ProductWrite {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		OutputStream os = null;
		DataOutputStream ds = null;
		String name, answer;
		int price, ps;

		try {
			os = new FileOutputStream("txtFile/product.dat",true);
			ds = new DataOutputStream(os);
			do {
				System.out.println("재고 데이터를 입력하시겠습니까?(Y/N)");
				answer = scanner.next();
				if (answer.equalsIgnoreCase("y")) {
					System.out.println("물건명을 입력해주세요");
					name = scanner.next();
					ds.writeUTF(name);
					System.out.println("가격을 입력해주세요");
					price = scanner.nextInt();
					ds.writeInt(price);
					System.out.println("개수를 입력해주세요");
					ps = scanner.nextInt();
					ds.writeInt(ps);

				} else if (answer.equalsIgnoreCase("n")) {
					break;
				} // if

			} while (true);
			{
				System.out.println("저장 완료");
			} // do-while
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (ds != null)
					ds.close();
				if (os != null)
					os.close();

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
