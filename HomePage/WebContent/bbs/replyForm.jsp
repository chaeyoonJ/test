<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id ="dao" class="bbs.BbsDAO" />
<%
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
                                //read에서 보내온 bbsno 받아 저장
		BbsDTO dto = dao.readReply(bbsno);
                               //bbsno 들고 readReply 실행후 받은 return 값(dto) 저장
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
<h1 class="col-sm-offset-2 col-sm-10">게시판 답변</h1>
<form class="form-horizontal" method="post" 
       action="replyProc.jsp"> 
<!--        등록 버튼을 누르면 replyProc로 갈 것이다. -->
       
<!-- 답변을 달 때, 가지고 가야 할 value들 -->
<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">       
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">       
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">       
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<!--  hidden 타입 : 들고가는 데이터를 사용자가 보지못하게 한다.      -->
<!-- div 태그로 답변 작성 폼 설정 (label, input테그 이용)    -->
  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="wname" id="wname" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" 
                     class="form-control" value="<%=dto.getTitle()%>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
     <textarea rows="12" cols="7" id="content" name="content" class="form-control"></textarea>
    </div>  
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
  </div> 

</form>  
</div>
</body> 
</html> 