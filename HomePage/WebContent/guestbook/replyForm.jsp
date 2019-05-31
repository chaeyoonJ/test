<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id = "dao" class="guestbook.GuestbookDAO" />
<%
int no = Integer.parseInt(request.getParameter("no"));
GuestbookDTO dto =dao.readReply(no);

%>
<!DOCTYPE html> 
<html> 
<head>
  <title>방명록 남기기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
#need{color:red;}
</style>
<script type="text/javascript">
   function incheck(f){
	   
	   if(f.name.value.length==0){
		   alert('이름을 입력하세요');
		   f.name.focus();
		   return false;
	   }
	   
	   if(f.gender[0].checked==false && f.gender[1].checked==false){
		   alert("성별을 체크해주세요");
		   f.gender[0].focus();
		   return false;
		}
	   
  }

</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">방명록 답변</h1>

<form class="form-horizontal" method="post" 
              action="replyProc.jsp" onsubmit="return incheck(this)">
<input type="hidden" name="no" value="<%=dto.getNo() %>">              
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">              
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">              
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">              
              
 <div class="form-group">
  <label class="control-label col-sm-2" for="name">이름<span id="need">*</span></label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
  </div>
 </div>

 <div class="form-group">
 <label class="control-label col-sm-2">성별<span id="need">*</span></label>
 <div class="col-sm-10">
    <label class="radio-inline">
      <input type="radio" name="gender" value="남자">남자
    </label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="여자">여자
    </label>
 </div>
 </div>
 
 <div class="form-group">
 <label class="control-label col-sm-2">분야</label> 
 <div class="col-sm-10">
    <label class="checkbox-inline">
      <input type="checkbox" name="part" value="안부">안부
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="part" value="질문">질문
    </label>
    <label class="checkbox-inline">
      <input type="checkbox" name="part" value="불만">불만
    </label>
 </div>
 </div>
 
  <div class="form-group">
  <label class="control-label col-sm-2" for="title">제목</label>
  <div class="col-sm-3">
    <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
  </div>
 </div>
 
<div class="form-group">
 <label class="control-label col-sm-2" for="content">내용</label>
  <div class="col-sm-3">
    <textarea rows="4" cols="50" name="content" ></textarea>
  </div>
  </div>
 
  <div class="form-group">
  <label class="control-label col-sm-2" for="password">비밀번호</label>
  <div class="col-sm-3">
    <input type="text" class="form-control" id="password" placeholder="Enter password" name="password">
  </div>
 </div>
 
 <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>

</form>
<div class="col-sm-offset-2 col-sm-10;">
     <span id="need">*</span>는 필수 입력사항 입니다.

</div>

</div>
</body> 
</html> 