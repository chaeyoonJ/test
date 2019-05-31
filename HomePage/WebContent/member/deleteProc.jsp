<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" /> 
<%-- <jsp:useBean id="dto" class="member.MemberDTO" /> --%>
<%-- <jsp:setProperty name="dto" property="*" />  --%>
<%
		String id = request.getParameter("id");
		String oldfile = request.getParameter("oldfile");
		String grade = (String)session.getAttribute("grade");
		
		boolean flag = dao.delete(id);
		
		if(flag && !oldfile.equals("member.jpg")){
			UploadSave.deleteFile(upDir, oldfile);
		}
		
		if(flag && !grade.equals("A")){
			session.invalidate();
		}

%>

<!DOCTYPE html> 
<html> 
<head>
  <title>회원탈퇴</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
<div class="well well-lg">
<%
		if(flag){
			out.print("회원탈퇴 성공. 자동 로그아웃 됩니다.");
		}else{
			out.print("회원탈퇴 실패");
		}

%>
</div>
  
    <button class="btn" onclick="location.href='<%=root%>/homepage/index.jsp'">홈</button>
    <button class="btn" onclick="history.back()">다시시도</button>
    
</div>
</body> 
</html> 