<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" /> 
<%
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		
		if(col.equals("total")) word="";
		
		int nowPage=1;   //현재 페이지는 1이다.
		if(request.getParameter("nowPage")!=null){ //클라이언트가 설정(클릭?)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage=3; //한 페이지당 게시글 수
		int sno = ((nowPage-1)*recordPerPage)+1; //첫번째 게시글
		int eno = nowPage*recordPerPage;  //마지막 게시글
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = dao.total(map);

		
		List<GuestbookDTO> list = dao.list(map);
		
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
 

   <script type="text/javascript">
      function read(no){
    	  var url = "read.jsp";
    	  url += "?no="+no;
    	  url += "&col=<%=col%>";
    	  url += "&word=<%=word%>";
    	  url += "&nowPage=<%=nowPage%>";
    	  
    	  location.href=url;
      }
      function update(no){
    	  var url = "updateForm.jsp";
    	  url += "?no="+no;
    	  url += "&col=<%=col%>";
    	  url += "&word=<%=word%>";
    	  url += "&nowPage=<%=nowPage%>";
    	  
    		  location.href=url;  
    	  
    	  
      }
      function del(no){
    	  if(confirm("정말 삭제하시겠습니까?")){
    		  var url = "deleteProc.jsp";
    		  url += "?no="+no;
    		  url += "&col=<%=col%>";
        	  url += "&word=<%=word%>";
        	  url += "&nowPage=<%=nowPage%>";
    		  
    		  location.href=url;
    	  }
      }
   
   </script>
   
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container">
<h2>방명록 목록</h2>
<br>
<form class="form-inline" method="post" action="./list.jsp" >
<div class="form-group">
<select class="form-control" name="col">
		<option value="name"
		<% if(col.equals("name")) out.print("selected"); %>
		>이름</option>
		<option value="title"
		<% if(col.equals("title")) out.print("selected"); %>
		>제목</option>
		<option value="content"
		<% if(col.equals("content")) out.print("selected"); %>
		>내용</option>
		<option value="title_content"
		<% if(col.equals("title_content")) out.print("selected"); %>
		>제목+내용</option>
		<option value="part"
		<% if(col.equals("part")) out.print("selected"); %>
		>분야</option>
		<option value="total"
		<% if(col.equals("total")) out.print("selected"); %>
		>전체출력</option>
</select>
</div>
<div class="form-group">
		<input type="text" class="form-control" placeholder="Enter 검색어"
					 name="word" value="<%=word %>">
</div>
<button type="submit" class="btn btn-default" >검색</button>
<button type="button" class="btn btn-default" 
                  onclick = "location.href='createForm.jsp'">등록</button>
</form>
    <table class="table table-striped">
       <thead>
            <tr>
               <th>번호</th>
               <th>이름</th>
               <th>제목</th>
               <th>분야</th>
               <th>날짜</th>
               <th>grpno</th>
               <th>indent</th>
               <th>ansnum</th>
               <th>수정/삭제</th>
               
            </tr>
      </thead>
      
      <tbody>
<%
		if(list.size()==0){
%>               
       <tr>
         <td colspan="9">등록된 방명록이 없습니다.</td>
        </tr>
<% }else{
	   
	  for(int i=0;i<list.size();i++){
		  GuestbookDTO dto = list.get(i);
%>
      <tr>
         <td><%=dto.getNo() %></td>
         <td><%=dto.getName() %></td>
         <td>
         <% for(int r=0;r<dto.getIndent();r++){
        	     out.print("&nbsp; &nbsp;");
         }
         if(dto.getIndent()>0){
        	  out.print("<img src='../images/re.jpg'>");
         }
         %>
         <A href="javascript:read('<%=dto.getNo() %>')"><%=dto.getTitle() %></A></td>
         <td><%=dto.getPartstr() %></td>
         <td><%=dto.getRegdate() %></td>
         <td><%=dto.getGrpno() %></td>
         <td><%=dto.getIndent() %></td>
         <td><%=dto.getAnsnum() %></td>
         <td>
         <a href="javascript:update('<%=dto.getNo() %>')">수정</a>/
         <a href="javascript:del('<%=dto.getNo() %>')">삭제</a>
         </td>
       </tr>
<%       
	  }
}
%>
</tbody>
</table>
<!-- <button type="button" onclick="location.href='createForm.jsp'">등록</button>          -->
<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
</div>
</body> 
</html> 