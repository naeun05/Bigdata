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
				System.out.println("��� �����͸� �Է��Ͻðڽ��ϱ�?(Y/N)");
				answer = scanner.next();
				if (answer.equalsIgnoreCase("y")) {
					System.out.println("���Ǹ��� �Է����ּ���");
					name = scanner.next();
					ds.writeUTF(name);
					System.out.println("������ �Է����ּ���");
					price = scanner.nextInt();
					ds.writeInt(price);
					System.out.println("������ �Է����ּ���");
					ps = scanner.nextInt();
					ds.writeInt(ps);

				} else if (answer.equalsIgnoreCase("n")) {
					break;
				} // if

			} while (true);
			{
				System.out.println("���� �Ϸ�");
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
