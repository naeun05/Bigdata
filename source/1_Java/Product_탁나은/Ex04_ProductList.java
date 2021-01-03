package com.lec.ex2_dataInputStreamoutputStream;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class Ex04_ProductList {
	public static void main(String[] args) {
		InputStream is = null;
		DataInputStream ds = null;
		ArrayList<Product> products = new ArrayList<Product>();

		try {
			is = new FileInputStream("txtFile/product.dat");
			ds = new DataInputStream(is);

			while (true) {
				String name = ds.readUTF();
				int price = ds.readInt();
				int ps = ds.readInt();

				products.add(new Product(name, price, ps));
			}

		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("목록");
		} finally {
			try {
				if (ds != null)
					ds.close();
				if (is != null)
					is.close();

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println("물건명\t" + "가격\t" + "개수");
			for (Product product : products) {
				System.out.println(product);
			}
		}
	}// main

}
