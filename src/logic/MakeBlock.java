package logic;



public class MakeBlock {
//블록 생성
	
	//인트 값 리턴
	public int makeBlockNum(String start_time,String end_time) {
		int si1=start_time.indexOf(":");
		int si2=end_time.indexOf(":");
		int su1=Integer.parseInt(start_time.substring(0,si1));
		int su2=Integer.parseInt(end_time.substring(0,si2));
		System.out.println(su1);
		System.out.println(su2);
		int result=su2-su1;
		
		  if(result<=0) { return 0; }
		 
		return result;
	}
	

	
}
