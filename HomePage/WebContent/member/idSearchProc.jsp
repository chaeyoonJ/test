<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" /> 
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	String mname = request.getParameter("mname"); 
	String email = request.getParameter("email");
	Map map = new HashMap();
	map.put("mname", mname);
	map.put("email", email);
	
	String id = dao.idsearch(map);
	
	
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<div class="well well-lg">
<% if(id != null){
out.print("ID는 "+id +"입니다");
}else{
out.print("다시 입력하세요");
}
%>
</div>
 <button class="btn" onclick="location.href='./loginForm.jsp'">Log in</button>   
 <button class="btn" onclick="history.back()">다시시도</button>   

</div>
</body> 
</html> 