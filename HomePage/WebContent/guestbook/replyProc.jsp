<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />
<jsp:useBean id="dto" class="guestbook.GuestbookDTO" />
<jsp:setProperty name="dto" property="*" />
<% 
Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());
dao.upAnsnum(map);
boolean flag = dao.createReply(dto);


%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/menu/top.jsp" /> 
<div class="container">
<fieldset>
<legend>방명록 남기기</legend>
<% if(flag){
	        out.print("방명록 답변을 남겼습니다.");
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