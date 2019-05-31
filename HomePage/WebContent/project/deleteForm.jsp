<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String oldfile = request.getParameter("oldfile");
%>
<!DOCTYPE html>
<html>
<head>
  <title>이미지 삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  	#red{
		color:red;
  	}
  </style>
</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h2 class="text-center">삭제</h2>
  <form class="form-horizontal" method="post" action="deleteProc.jsp">
	<p id="red" class="text-center">이미지를 삭제하면 복구할 수 없습니다.</p>
	<input type="hidden" name="imgno" value="<%=imgno%>">
	<input type="hidden" name="oldfile" value="<%=oldfile%>">

	  <div class="form-group">
        <label class="control-label col-sm-4" for="passwd">비밀번호</label>
          <div class="col-sm-4 ">
            <input type="password" name="passwd" id="passwd" class="form-control">
          </div>
       </div>

		<div class="form-group">
		  <div class="text-center">
			<button class="btn btn-default">삭제</button>
			<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
		  </div>
		</div>


		</form>
	</div>

</body>
</html>