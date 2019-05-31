<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<%                                                                                           //setAttribute로 저장해놨었음
		UploadSave upload = (UploadSave)request.getAttribute("upload"); 
                                                  //forward로 이동할때만 request가 살아있음 / 꺼내올때는 다운캐스팅, 저장할때는 업캐스팅
		dto.setId(upload.getParameter("id"));
		dto.setEmail(upload.getParameter("email"));
		dto.setPasswd(upload.getParameter("passwd"));
		dto.setTel(upload.getParameter("tel"));
		dto.setZipcode(upload.getParameter("zipcode"));
		dto.setMname(UploadSave.encode(upload.getParameter("mname"))); //여기부턴 한글처리
		dto.setJob(UploadSave.encode(upload.getParameter("job")));
		dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
		dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
		
		FileItem fileItem = upload.getFileItem("fname");
		int size = (int)fileItem.getSize();
		
		String fname = UploadSave.saveFile(fileItem, upDir);
				
		if(size>0){
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
	 out.print("회원가입을 했습니다.");
 }else{
	 out.print("회원가입을 실패했습니다.");
 }
 
 %> 
 </div>
 <%if(flag){ %>
  		<input type='button' value='로그인'
  		                onclick="location.href='loginForm.jsp'">
  		<input type='button' value='홈'
  		                onclick="location.href='../homepage/index.jsp'">
 <%}else{ %>   
       <input type='button' value='다시시도'
  		                onclick="history.back()">
  		<input type='button' value='홈'
  		                onclick="location.href='../homepage/index.jsp'">
<%} %>
 </div>
 </body> 
</html> 