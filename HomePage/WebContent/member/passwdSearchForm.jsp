<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호 찾기</title>
  <META CHARSET="UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/
              jquery/1.9.1/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	function pwSearch(){
		var url = "pwsearch.jsp";
		var param = $("#pwsearch1").serialize();
		$.get(
			url,
			param,
			function(data,textStatus){
			//	alert(textStatus);
			//	alert(data);
				$("#pwsearch").text(data);
			}
		);
	}
</script>
<style type="text/css">
#pwsearch {
	color: red;
}
</style>

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">search Password </h1>
<form id="pwsearch1" action="passwdSearchProc.jsp" class="form-horizontal" method="post">
<p class="col-sm-offset-2 col-sm-10">ID를 입력하세요</p>

<div class="form-group">
	<label class = "control-label col-sm-2" for="id">ID</label>
	<div class="col-sm-4">
      <input type="text" name="id" id="id" class="form-control" required="required" value="pdjcy7">
    </div>
</div>

<p class="col-sm-offset-2 col-sm-10">이메일 입력하세요</p>
<div class="form-group">
	<label class = "control-label col-sm-2" for="email">이메일</label>
	<div class="col-sm-4">
      <input type="text" name="email" id="email" class="form-control" required="required" value="jj@naver.com">
    </div>
</div>

  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn" type="button" onclick="pwSearch()">찾기</button>
    <button type="button" class="btn" onclick="window.close()">취소</button>
    <div id="pwsearch"></div>
   </div>
  </div> 


</form>  
</div>
</body> 
</html> 