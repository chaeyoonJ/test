<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%


		UploadSave upload = new UploadSave(request,-1,-1,tempDir);
        
		
		String id = UploadSave.encode(upload.getParameter("id"));
		String email = UploadSave.encode(upload.getParameter("email"));
		
		String str = "";
		
		if(dao.duplicateId(id)){
			str = "중복된 아이디 입니다. 아이디 중복을 확인하세요";
		}else if(dao.duplicateEmail(email)){
			str = "중복된 이메일 입니다. 이메일 중복을 확인하세요";
		}else{
			//createProc.jsp로 이동해서 db에 회원정보를 저장한다.
			request.setAttribute("upload", upload);
		%>
		<jsp:forward page="/member/createProc.jsp" />
<!-- 요청된 페이지 말고 forward page로 응답함   -->
<!-- 이동은 됐지만 요청객체(request)는 살아있다. -->
		<%
			return;
		}
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>ID 및 EMAIL 중복확인</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<div class="well well-lg">
<br>
<%=str %>  
</div>
<button type="button" onclick="history.back()">다시시도</button>

</div>
</body> 
</html> 