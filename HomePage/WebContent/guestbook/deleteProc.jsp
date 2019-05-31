<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />


<% 
int no = Integer.parseInt(request.getParameter("no"));   
boolean flag = dao.delete(no);


%>
<!DOCTYPE html> 
<html> 
<head>
  <title>방명록 삭제</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
	function listM(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
	}
	</script>

</head>
<body>
<jsp:include page="/menu/top.jsp" /> 
<div class="container">
<fieldset>
<legend>방명록 삭제확인</legend>
<% if(flag){
	        out.print("방명록을 삭제했습니다.");
       }else{
    	   out.print("방명록 삭제를 실패했습니다.");
       }
	%>

</fieldset>
<button type="button" onclick="location.href='createForm.jsp'">다시 등록</button>
<button type="button" onclick="listM()">목록</button>
</div>
</body> 
</html> 