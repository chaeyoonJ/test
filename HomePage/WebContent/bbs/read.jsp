<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		
		dao.upViewcnt(bbsno);
		BbsDTO dto = dao.read(bbsno);
		String content = dto.getContent().replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">
	<script type="text/javascript">
	function updateM(){
		var url = "updateForm.jsp";
		url += "?bbsno=<%=dto.getBbsno()%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		
		location.href=url;
	}
	function deleteM(){
		var url = "deleteForm.jsp";
		url += "?bbsno=<%=dto.getBbsno()%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	function replyM(){
		var url = "replyForm.jsp";
		url += "?bbsno=<%=dto.getBbsno()%>";
		
		location.href=url;
		
	}
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
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h2>조회</h2>

<div class="panel panel-default">
<div class="panel-heading">번호</div>
<div class="panel-body"><%=dto.getBbsno() %></div>

<div class="panel-heading">작성자</div>
<div class="panel-body"><%=dto.getWname() %></div>

<div class="panel-heading">제목</div>
<div class="panel-body"><%=dto.getTitle() %></div>

<div class="panel-heading">내용</div>
<div class="panel-body"><%=dto.getContent() %></div>

<div class="panel-heading">조회수</div>
<div class="panel-body"><%=dto.getViewcnt() %></div>

<div class="panel-heading">등록일</div>
<div class="panel-body"><%=dto.getWdate() %></div>
</div>

<div>
<button type="button" class="btn" onclick="location.href='./createForm.jsp'">등록</button>
<button type="button" class="btn" onclick="updateM()">수정</button>
<button type="button" class="btn" onclick="deleteM()">삭제</button>
<button type="button" class="btn" onclick="replyM()">답변</button>
<button type="button" class="btn" onclick="listM()">목록</button>
</div>

</div>
</body>
</html>