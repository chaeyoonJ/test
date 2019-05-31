<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_project.jsp" %>
<!-- // 파일업로드(not null, 이미지파일만 받도록), 내용, 제목, 이름, 비번, wdate -->
<!DOCTYPE html> 
<html> 
<head>
  <title>이미지 업로드</title>
  <meta charset="utf-8">
  </head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container">
 <h1 class="col-sm-offset-2 col-sm-10">이미지 등록</h1>
 <form class="form-horizontal" method="post" 
       action="createProc.jsp"
       enctype="multipart/form-data"
       >
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname">이미지</label>
    <div class="col-sm-6">
      <input type="file" accept=".jsp, .gif, .png" name="fname" id="fname" class="form-control">
    </div>
</div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="mname">이름</label>
    <div class="col-sm-6">
      <input type="text" name="mname" id="mname" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
     <textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
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