<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
String id = request.getParameter("id");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("id", id);
map.put("email", email);

String passwd = dao.passwdsearch(map);

 if(passwd != null){
	 out.print("passwd는 "+ passwd + "입니다");
 }else{
	 out.print("다시 입력하세요");
	 
 }


%>