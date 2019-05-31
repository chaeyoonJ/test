<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO" /> 
<jsp:useBean id="dto" class="project.ProjectDTO" />

<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir);
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setMname(UploadSave.encode(upload.getParameter("mname")));
		
		FileItem fileItem = upload.getFileItem("fname");
		int size = (int)fileItem.getSize();
		
		String fname = UploadSave.saveFile(fileItem, upDir);
		
		if(size>0) {
			dto.setFname(fname);
		}else{
			dto.setFname("member.jpg");
		}
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
		out.print("이미지를 업로드했습니다.");
	}else{
		out.print("이미지 업로드를 실패했습니다.");
	}
%>

</div>
<button type="button" onclick="location.href='createForm.jsp'">다시 등록</button>
<button type="button" onclick="location.href='list.jsp'">목록</button>

</div>
</body> 
</html> 