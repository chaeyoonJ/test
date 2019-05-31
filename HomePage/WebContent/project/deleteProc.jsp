<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_project.jsp"%>
<jsp:useBean id="dao" class="project.ProjectDAO"></jsp:useBean>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");
	
	Map map = new HashMap();
	map.put("imgno",imgno);
	map.put("passwd",passwd);
	
	boolean flag = false;
	boolean pflag = false;
	
	pflag = dao.passCheck(map);
	
	if(pflag == true){
		flag = dao.delete(imgno);
	}
	
	if (flag && oldfile.equals("default.jpg")) {
		UploadSave.deleteFile(upDir, oldfile);//원본파일이 기본사진이 아닐경우 원본파일을 삭제하겠다는 뜻
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>이미지삭제 확인</title>
<meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br><BR>

  <div class="container">
    <fieldset>
      <legend>이미지 삭제확인</legend>
	    <%
	  	   if(pflag ==true){
	   	   if(flag)
		      out.print("이미지를 삭제 했습니다. ");
	   	   else
		      out.print("이미지를 삭제하지 못했습니다. ");
	  	   }else{
	  		  out.print("비밀번호가 맞지 않습니다 ");	
	  	   }
	     %>
    </fieldset>

	  <button class="btn btn-default" onclick="history.back()">이전</button>
	  <button class="btn btn-default" onclick="location.href='<%=root%>/project/list.jsp'">목록</button>
	  <button class="btn btn-default" type="button" onclick="location.href='createForm.jsp'">다시등록</button>
  </div>

</body>
</html>