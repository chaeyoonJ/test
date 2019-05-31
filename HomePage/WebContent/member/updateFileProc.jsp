<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" /> 
<% 
	UploadSave upload = 
	             new UploadSave(request, -1, -1, tempDir);
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("fname");
	
	if(oldfile != null && !oldfile.equals("member.jpg")){
	     UploadSave.deleteFile(upDir, oldfile); //원본파일 지운다.
	}
	
	String fname = UploadSave.saveFile(fileItem, upDir);
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("fname", fname);
	boolean flag = dao.updateFile(map);
	
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>사진수정 확인</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
<div class="well well-lg">
<%
if(flag){
	out.print("사진수정을 성공했습니다.");
}else{
	out.print("사진수정을 실패했습니다.");
}
%>
<button onclick="location.href='read.jsp?id=<%=id%>' ">나의정보 보기</button>
<button onclick="history.back()">다시시도</button>
</div>
</div>
</body> 
</html> 