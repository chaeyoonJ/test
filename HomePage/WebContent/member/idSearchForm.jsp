<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<META CHARSET="UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	function idSearch(){
		var url = "idsearch.jsp";
		var param = $("#idsearch1").serialize();
		$.get(
			url,
			param,
			function(data,textStatus){
//				alert(textStatus);
// 				alert(data);
				$("#idsearch").text(data);
			}
		);
	}
</script>
<style type="text/css">
#idsearch {
	color:red;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">ID찾기</h1>
		<form id="idsearch1" action="idsearch.jsp" class="form-horizontal" method="post">
			<p class="col-sm-offset-2 col-sm-10">이름을 입력하세요</p>

			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름</label>
				<div class="col-sm-4">
					<input type="text" name="mname" id="mname" class="form-control"
						required="required" value="조채윤">
				</div>
			</div>

			<p class="col-sm-offset-2 col-sm-10">이메일 입력하세요</p>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">이메일</label>
				<div class="col-sm-4">
					<input type="text" name="email" id="email" class="form-control"
						required="required" value="jj@naver.com">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn" type="button" onclick="idSearch()">찾기</button>
					<button type="button" class="btn" onclick="window.close()">취소</button>
					<div id="idsearch"></div>
   				
				</div>
			</div>


		</form>
	</div>
</body>
</html>
