<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<%
		int imgno = Integer.parseInt(request.getParameter("imgno"));
		String oldfile = request.getParameter("oldfile");
		ProjectDTO dto = dao.read(imgno);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>이미지 업로드</title>
  <meta charset="utf-8">
  </head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container">
 <h1 class="col-sm-offset-2 col-sm-10">사진 수정</h1>
 <form class="form-horizontal" method="post" 
       action="updateProc.jsp"
       enctype="multipart/form-data"
       >
<input type="hidden" name="imgno" value="<%=imgno %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">

<div class="form-group">
    <div class="col-sm-6">
      <img src="./storage/<%=oldfile %>"
				                class="img-rounded" width="200" height="200">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname" >변경파일</label>
    <div class="col-sm-6">
     <input type="file" name="fname" class="form-control" 
                    accept=".png, .jpg, .gif" required="required">
    </div>  
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="mname">NAME</label>
    <label class="col-sm-4"><%=dto.getMname() %></label>
</div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control" value="<%=dto.getTitle() %>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
     <textarea rows="5" cols="5" id="content" name="content" 
                          class="form-control" ><%=dto.getContent() %></textarea>
    </div>  
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control" >
    </div>
  </div>
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn-default btn" type="submit">수정</button>
    <button type="button" class="btn-default btn" onclick="history.back()">취소</button>
   </div>
  </div> 

</form>  
</div>
</body> 
</html> 