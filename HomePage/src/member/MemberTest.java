package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		updatePw(dao);
	}

	private static void updatePw(MemberDAO dao) {
		
		Map map = new HashMap();
		map.put("id", "user100");
		map.put("pw", "123457");
	
		
		
		if(dao.updatePw(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user1");
		p(dto);
		
	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		p("전체레코드 갯수: "+dao.total(map));
		
	}

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "개발자");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemberDTO> list = dao.list(map);
		Iterator<MemberDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("-------------------------");
		}
		
	}

	private static void p(MemberDTO dto) {
		p("ID: "+dto.getId());
		p("NAME: "+dto.getMname());
		p("EMAIL: "+dto.getEmail());
		p("TEL: "+dto.getTel());
		p("JOB: "+dto.getJob());
		p("ADDRESS1: "+dto.getAddress1());
		p("ADDRESS2: "+dto.getAddress2());
		p("ZIPCODE: "+dto.getZipcode());
		p("PHOTO: "+dto.getFname());
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("user105");
		dto.setPasswd("4567");
		dto.setMname("장은영");
		dto.setTel("01028315245");
		dto.setEmail("jey11@naver.com");
		dto.setZipcode("12345");
		dto.setAddress1("경기도 고양시 일산동구 풍산역");
		dto.setAddress2("130-2");
		dto.setJob("A02");
		dto.setFname("member.jpg");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
