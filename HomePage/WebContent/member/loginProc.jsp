<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
//client가 입력한 정보를 String 변수에 저장
		String id = request.getParameter("id"); 
		String passwd = request.getParameter("passwd");
//저장된 내용을 map에 저장		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pw", passwd);
		
		boolean flag = dao.loginCheck(map);
		String grade = null;   //회원등급을 저장할 변수
		if(flag){
			grade = dao.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			
//------cookie저장, checkbox는 선택하지 않으면 null임------
			Cookie cookie=null;
			
			String c_id = request.getParameter("c_id"); //Y, 아이디 저장 여부
			
			if(c_id != null){  //처음에는 값이 없음으로 null 체크로 처리
				cookie = new Cookie("c_id", "Y"); //아이디 저장 여부 쿠키
				cookie.setMaxAge(120);   //2분 유지
				response.addCookie(cookie); //쿠키 기록
				
				cookie= new Cookie("c_id_val", id); //아이디 값 저장 쿠키
				cookie.setMaxAge(120); //2분 유지
				response.addCookie(cookie); //쿠키 기록
			}else{
				cookie= new Cookie("c_id", ""); //쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
//----------------------------------------------------------
		}
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Login처리</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">Login 처리</h2>
 <div class="well well-lg">
 <%
 	if(flag){
 		out.print("로그인이 되었습니다.");
 	}else{
 		out.print("ID 혹은 PASSWORD를 잘못 입력하셨거나, <BR>");
 		out.print("회원이 아닙니다.");
 	}
 
 %>
 
 </div>
 <button class="btn" onclick="location.href='../homepage/index.jsp'">Home</button>   
 <button class="btn" onclick="history.back()">다시시도</button>   
</div>
</body> 
</html> 