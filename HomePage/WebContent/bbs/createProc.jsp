<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
 		boolean flag = dao.create(dto);
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
<%
 if(flag){
	 out.println("게시판등록 성공입니다.");
 }else{
	 out.println("게시판등록 실패입니다.");
 }

%>
<div class="col-sm-offset-2 col-sm-5">
	<button type="button" onclick="location.href='createForm.jsp'">다시등록</button>
	<button type="button" onclick="location.href='list.jsp'">목록</button>
</div>

</div>
</div>
</body> 
</html> 