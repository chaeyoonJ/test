<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
//검색관련--------------------------------------------
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")) word="";

//페이지관련---------------------------------------------
int nowPage=1; //현재 보고있는 페이지
if(request.getParameter("nowPage")!=null){
	nowPage= Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage=3; //한 페이지당 보여 줄 레코드갯수
//DB에서 가져올 순번---------------------
int sno = ((nowPage-1)*recordPerPage) + 1;
//ex)현재 페이지가 2 라면 (2-1)*3 + 1 = 4레코드부터 시작
int eno = nowPage * recordPerPage; //-> 2*3 = 6레코드까지

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", 	sno);
map.put("eno", eno);

int total = dao.total(col,word);


List<BbsDTO> list = dao.list(map);
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">
   <script type="text/javascript" >
  			function read(bbsno){  //javascript변수:bbsno,url / jsp변수: col,word,nowPage
  				var url = "read.jsp";
  				url += "?bbsno="+bbsno;
  				//게시물을 확인하고 다시 목록으로 돌아갈 때 초기화되는것을 막기위해
  				url += "&col=<%=col%>";
  				url += "&word=<%=word%>";
  				url += "&nowPage=<%=nowPage%>";
  				
  				location.href=url;
  			}
  			function update(bbsno){
  			    var url="updateForm.jsp";
  			    url += "?bbsno="+bbsno;
  			    
  			    location.href=url;
  			}
  			function del(bbsno){
  				if(confirm("정말 삭제 하시겠습니까?")){
  					
  					var url = "deleteProc.jsp";
  					url += "?bbsno="+bbsno;
  					
  					location.href=url;
  				}
  			}
  
  </script>
  <style>
/*   body{ */
/*   		background-image: url("la.jpg"); */
  		
/*   } */
  </style>
</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h2>게시판 목록</h2>
<br>
<form class="form-inline" action="./list.jsp" method="post">
    <div class="form-group">
        <select class="form-control" name="col">
          <option value="wname" <% if(col.equals("wname")) out.print("selected"); %>>
          성명</option>
          <option value="title"
          <% if(col.equals("title")) out.print("selected"); %>
          >제목</option>
          <option value="content"
          <% if(col.equals("content")) out.print("selected"); %>
          >내용</option>
          <option value="title_content"
          <% if(col.equals("title_content")) out.print("selected"); %>
          >제목+내용</option>
          <option value="total"
          <% if(col.equals("total")) out.print("selected"); %>
          >전체출력</option>
        </select>
        </div>
      <div class="form-group">
         <input type="text" class="form-control" placeholder="Enter 검색어"
                       name="word" value="<%=word %>">
       </div>
       <button type="submit" class="btn btn-default">검색</button>
       <button type="button" class="btn btn-default">등록</button>
       </form>
  <table class="table table-striped">
    	<thead>
    		<tr>
    		 	<th>번호</th>
    		 	<th>제목</th>
    		 	<th>작성자</th>
       		 	<th>grpno</th>
    		 	<th>indent</th>
    		 	<th>ansnum</th>
    		 </tr>
    		</thead>
     <tbody>
<%
		if(list.size()==0){
%>     
     <tr>
     			<td colspan="5">등록된 게시판정보가 없습니다.</td>
     </tr>
<% }else{
	
	for(int i=0;i<list.size();i++){
		BbsDTO dto = list.get(i);
%>
		<tr>
			<td><%=dto.getBbsno() %></td>
			<td>
			<%
				for(int r=0;r<dto.getIndent();r++){ //indent가 1이면 1번, 2라면 2번 들여쓰기문 실행
					out.print("&nbsp;&nbsp;"); //들여쓰기
				}
				if(dto.getIndent()>0){   //indent가 0보다 크면 화살표 이미지를 붙여준다.
					out.print("<img src='../images/re.jpg'>");
					}
			%>
			
			<a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
<!-- 			                 제목을 누르면 해당 bbsno를 가지고 read로 이동 -->
			<% if(Utility.compareDay(dto.getWdate())){ %> 
					<img src="../images/new.gif">
<!-- 					 compareDay를 실행한 결과, true 값은 wdate가 당일~2일전까지일때이다 -->
<!-- 					 new.gif붙임 -->
			
			<%} %>
			</td>
			<td><%=dto.getWname() %></td>
			<td><%=dto.getGrpno() %></td>
			<td><%=dto.getIndent() %></td>
			<td><%=dto.getAnsnum() %></td>
				
			
	    </tr>
<%			
	}
}
%>
     			
     </tbody>
  </table>
<!-- <button type="button" onclick="location.href='createForm.jsp'">등록</button> -->
<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
 </div>
 </body>
 </html>