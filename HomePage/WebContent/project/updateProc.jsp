<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_project.jsp"%>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<jsp:useBean id="dto" class="project.ProjectDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	int imgno = Integer.parseInt(upload.getParameter("imgno"));
	String oldfile = upload.getParameter("oldfile");
	String passwd = upload.getParameter("passwd");
	String fname = "";
	Map map = new HashMap();
	map.put("imgno", imgno);
	map.put("passwd",passwd);


	dto.setImgno(imgno);
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	

	
	boolean flag = false;
	boolean pflag = dao.passCheck(map);
	
	if(pflag==true){
		//form의 선택한 파일 받기
		FileItem fileItem = upload.getFileItem("fname");
		int size = (int) fileItem.getSize();
		
		if (size > 0) {
			UploadSave.deleteFile(upDir,oldfile);
			fname = UploadSave.saveFile(fileItem, upDir);
		} else {
			fname = oldfile;
		}
		dto.setFname(fname);
		
		flag = dao.update(dto);
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<META CHARSET="UTF-8">

</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
		<div class="well well-lg">
			<%
				if (flag) {
					out.print("사진수정 성공");
				} else {
					out.print("사진수정 실패");
				}
			%>


		</div>
		<button class="btn"
			onclick="location.href='read.jsp?imgno=<%=dto.getImgno()%>'">사진정보</button>
		<button class="btn" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>
