<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />
<jsp:useBean id="dto" class="guestbook.GuestbookDTO" />
<jsp:setProperty name="dto" property="*" />
<% 
   boolean flag = dao.create(dto);


%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  
</head>
<body>
 <jsp:include page="/menu/top.jsp" />
<div class="container">
<fieldset>
<legend>방명록 남기기</legend>
<% if(flag){
	        out.print("방명록을 남겼습니다.");
       }else{
    	   out.print("실패했습니다.");
       }
	%>

</fieldset>
<button type="button" onclick="location.href='createForm.jsp'">다시 등록</button>
<button type="button" onclick="location.href='list.jsp'">목록</button>
</div>
</body> 
</html> 