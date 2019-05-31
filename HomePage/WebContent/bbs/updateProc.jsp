<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name = "dto" property="*" />
<%
    Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
 	boolean flag = false;
	boolean pflag = dao.passCheck(map);	
	if(pflag){flag=dao.update(dto);}
		
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">
   
   <script type="text/javascript">
   		function listM(){
   			var url = "list.jsp";
   			url += "?col=<%=request.getParameter("col")%>";
   			url += "&word=<%=request.getParameter("word")%>";
   			url += "&nowPage=<%=request.getParameter("nowPage")%>";
   			
   			location.href = url;
   		}
   
   </script>
</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">

<div class="well well-lg">
<% if(!pflag){
			out.print(" 잘못된 비밀번호 입니다.");
	    }else if(flag){
	    	out.print("글 수정을 성공했습니다.");
	    }else{
	    	out.print("글 수정을 실패했습니다.");
	    }
%>
</div>
<%if(!pflag){ %>
<button class="btn" onclick="history.back()">다시시도</button>
<%} %>

<button type="button" onclick="location.href='createForm.jsp'">다시등록</button>
<button type="button" onclick="listM()">목록</button>

</div>
</body>
</html>
	    