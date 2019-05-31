<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/ssi_project.jsp" %>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<%
   //검색관련
   String col = Utility.checkNull(request.getParameter("col"));
   String word = Utility.checkNull(request.getParameter("word"));
   
   if(col.equals("total")) word="";
   
   //페이징 관련
   int nowPage=1;
   int recordPerPage=5;
   
   if(request.getParameter("nowPage")!=null){
	   nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   int sno = ((nowPage - 1) * recordPerPage) + 1;
   int eno = nowPage * recordPerPage;
   
   Map map = new HashMap();
   
   map.put("col", col);
   map.put("word", word);
   map.put("sno", sno);
   map.put("eno", eno);
   
   int total = dao.total(map);
   
   List<ProjectDTO> list = dao.list(map);
   
   String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

%>

<!DOCTYPE html>
<html>
<head>
<title>사진목록</title>
<meta charset="utf-8">
<script type="text/javascript">
    function read(imgno){
      var url = "read.jsp";
      url += "?imgno="+imgno;
      
      location.href = url;
    }
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="container">
		  <form class="form-inline"
          method="post"
          action="list.jsp"
    >
    <h1>사진 목록</h1>
    <div class="form-group">
       <select class="form-control" name="col">
          <option value="mname"
           <% if(col.equals("mname")) out.print("selected"); %>
          >이름</option>
          <option value="title"
           <% if(col.equals("title")) out.print("selected"); %>
          >제목</option>
          <option value="total"
           <% if(col.equals("total")) out.print("selected"); %>
          >전체출력</option>
       </select>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter words" name="word" value="<%=word%>">
    </div>
    <button type="submit" class="btn btn-default">검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='createForm.jsp'">등록</button>
    </form>
    <br><br>
    <% for(int i=0;i<list.size();i++){
    	      ProjectDTO dto = list.get(i);
    %>
    
		<table class="table table-bordered">
		  <thead>
		    <tr>
		      <td rowspan="5">
		        <img src="./storage/<%=dto.getFname()%>"
		        class="img-rounded" width="200" height="200">
		      </td>
		      <th class="col-sm-2">번호</th>
		      <td class="col-sm-8"><a href="javascript:read('<%=dto.getImgno()%>')"><%=dto.getImgno() %></a></td>
		    </tr>
		    <tr>
		      <th>성명</th>
		      <td><%=dto.getMname() %></td>
		    </tr>
    
		    <tr>
		      <th>제목</th>
		      <td><%=dto.getTitle() %></td>
		    </tr>
    
	        <tr>
	          <th>조회수</th>
	          <td><%=dto.getViewcnt() %></td>
	        </tr>

	         <tr>
	          <th>날짜</th>
	          <td><%=dto.getWdate() %></td>
	        </tr>
		 	
		 	   
		    
         
		  </thead>
		</table>
		<%} %>
		<%=paging %>
	  </div>
</body>
</html>
