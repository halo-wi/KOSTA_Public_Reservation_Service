package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BookId {

	public String getBookId() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yy-MM-dd HH:mm:ss");
		
		Date time = new Date();
		
		String time1 = format1.format(time);
		int randomNum = (int)(Math.random() * 10000 +1); 
		String intStr1 = time1.replaceAll("[^0-9]", "");
		System.out.println(intStr1+randomNum);
		return intStr1+randomNum;
		

	}
}
