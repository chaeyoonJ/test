<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
		session.invalidate(); //모든 세션변수 삭제
		response.sendRedirect("../homepage/index.jsp");
%>