<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" /> 
<jsp:useBean id="dto" class="bbs.BbsDTO" /> 
<jsp:setProperty name="dto" property="*" />
<%
//Map에 dto에서 가져온 grpno과 ansnum 저장
Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());
//map의 데이터를 가지고 dao의 upAnsnum 실행 , 리턴값이 따로 없음
dao.upAnsnum(map);

boolean flag = dao.createReply(dto);
//flag에는 createReply를 실행한 결과가 담긴다.
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>게시판 답변처리</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<div class="well well-lg">
   <%
   if(flag){
	   out.println("글 답변 성공입니다.");
   }else{
	   out.println("글 답변 실패입니다.");
   }
   
   %>
   <div class="col-sm-offset-2 col-sm-5">
    <button type="button" onclick="location.href='createForm.jsp'">다시 등록</button>
    <button type="button" onclick="location.href='list.jsp'	">목록</button>
   </div>
  </div> 
</div>
  

</body> 
</html> 