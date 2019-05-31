package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	public static String getCodeValue(String code){
		String value = null;
		Hashtable codes = new Hashtable();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		 
		value = (String)codes.get(code);
		 
		return value;
		}
	/**
     * 등록날짜와 오늘,어제,그제날짜와 비교
     * @param wdate - 등록날짜
     * @return - true:오늘,어제,그제중 등록날짜와 같음
     *           false:오늘,어제,그제 날짜가 등록날짜와 다 다름
     */
	public static boolean compareDay(String wdate) {
		boolean flag=false;
		List<String> list = getDay();   //list를 생성하고 getDay()의 결과물을 저장
		
		if(wdate.equals(list.get(0))      // wdate가 인덱스 0,1,2의 값과 하나라도 같다면 
			|| wdate.equals(list.get(1))  
		    || wdate.equals(list.get(2))) {
			
			
			flag = true;  //true    //당일~2일전까지라면 true 반환
		}
		return flag;
	}
	/**
     * 오늘,어제,그제 날짜 가져오기
     * @return List- 날짜들 저장
     */
	private static List<String> getDay() {
		List<String> list = new ArrayList<String>();  //list생성
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); //현재 위치에 맞는 시간 제공
		for(int j=0; j<3; j++) {
			list.add(sd.format(cal.getTime())); //cal에서 얻은 시간을 sd형태로 포멧해서 add
			cal.add(Calendar.DATE, -1); //cal에는 그 전날을 저장 
		}    //결국 for문을 통한 결과는 현재 날짜와 전날, 전전날을 저장하는것
		
		return list; 
	}

	public static String checkNull(String str) {
		if(str==null)
				str = "";
		
			return str;
	}
	  /** 
	  *  
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 레코드 수  
	  * @param col 검색 컬럼  
	  * @param word 검색어
	  * @return 페이징 생성 문자열
	  */ 
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 5; // 블럭당 페이지 수 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 몇 페이지?(전체레코드/한페이지당레코드수)  
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 몇 그룹(블럭)? 
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 보이는 그룹(블럭) 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	    
	   StringBuffer str = new StringBuffer(); 
	   str.append("<div style='text-align:center'>"); 
	   str.append("<ul class='pagination'> "); //부트스트랩에서 제공
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 5개 이전 페이지로 이동 
	   if (nowGrp >= 2){  //2그룹부터 "이전" 추가
	     str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ 
	       str.append("<li class='active'><a href=#>"+i+"</a></li>"); //현재 보고있는 페이지로는 이동할 필요x 
	     }else{ 
	       str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
	     } 
	   } 
	       
	   _nowPage = (nowGrp * pagePerBlock)+1; // 5개 다음 페이지로 이동 
	   if (nowGrp < totalGrp){ //현재그룹이 전체그룹보다 작을때 "다음"이동, 같거나 크다면 이동할 곳이x 
	     str.append("<li><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
	   } 
	   str.append("</ul>"); 
	   str.append("</div>"); 
	    
	   return str.toString(); 
	} 
}
