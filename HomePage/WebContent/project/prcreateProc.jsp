<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_project.jsp" %> 
<jsp:useBean id="dao" class="project.ProjectDAO" />
<%


		UploadSave upload = new UploadSave(request,-1,-1,tempDir);
        
		
		String id = UploadSave.encode(upload.getParameter("id"));
		
		
		String str = "";
		
		if(dao.duplicateId(id)){
			str = "중복된 아이디 입니다. 아이디 중복을 확인하세요";
		}else{
		request.setAttribute("upload", upload);
		%>
		<jsp:forward page="/project/createProc.jsp" />
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