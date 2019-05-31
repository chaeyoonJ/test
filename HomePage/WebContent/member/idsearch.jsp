<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
String mname = request.getParameter("mname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("mname", mname);
map.put("email", email);

String id = dao.idsearch(map);

 if(id != null){
	 out.print("ID는 "+ id + "입니다");
 }else{
	 out.print("다시 입력하세요");
	 
 }


%>
