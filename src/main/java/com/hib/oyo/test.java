package com.hib.oyo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) {
		BookingDAO dao=new BookingDAO();
		 Date date = new Date();
	      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
	       String str = formatter.format(date);
		System.out.println(dao.convertDate(date));

	}

}


