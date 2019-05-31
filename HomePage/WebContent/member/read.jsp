<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" /> 
<% 
		String id = request.getParameter("id");
		String grade = (String)session.getAttribute("grade");	

		if(id==null){
			id = (String)session.getAttribute("id");
			
		}
		MemberDTO dto = dao.read(id);
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>회원정보</title>
  <META CHARSET="UTF-8">
  <script type="text/javascript">
        function del(){
        	var url = "deleteForm.jsp";
        	url += "?id=<%=id%>";
        	url += "&oldfile=<%=dto.getFname()%>";
        	
  			location.href = url; 
        }
  		function update(){
  			var url = "updateForm.jsp";
  			url += "?id=<%=id%>";
  			location.href = url;
  		}
  		function updateFile(){
  			var url = "updateFileForm.jsp";
  			url += "?id=<%=id%>";
  			url += "&oldfile=<%=dto.getFname()%>";
  			
  			location.href = url;
  		}
  		
  		function listM(){
  			var url = "list.jsp";
  			
  			
  			location.href = url;
  		}
  
  		function updatePw(){
  			var url = "updatePwForm.jsp";
  			url += "?id=<%=id%>";
  			  			
  			location.href = url;
  		}
  		
  		function listM(){
  			var url = "<%=root %>/admin/list.jsp";
  			
  			
  			location.href = url;
  		}
  		function filedown(){
  			var url = "<%=root%>/download";
  			url += "?dir=/member/storage";
  			url += "&filename=<%=dto.getFname()%>";
  			
  			location.href = url;
  		}
  
  </script>
</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10"><%=dto.getMname() %>의 회원정보</h1>
 <table class="table table-bordered">
 <tr>
 		<td colspan="2" style="text-align: center">
 		<img src="./storage/<%=dto.getFname() %>"
				                class="img-rounded" width="250px" height="250px">
 		</td>
 </tr>
 <tr>
 		<th>ID</th>
 		<td><%=dto.getId() %></td>
 </tr>
 <tr>
 		<th>NAME</th>
 		<td><%=dto.getMname() %></td>
 </tr>
 <tr>
 		<th>TEL</th>
 		<td><%=dto.getTel() %></td>
 </tr>
 <tr>
 		<th>EMAIL</th>
 		<td><%=dto.getEmail() %></td>
 </tr>
 <tr>
 		<th>ZIPCODE</th>
 		<td><%=dto.getZipcode() %></td>
 </tr>
 <tr>
 		<th>ADDRESS</th>
 		<td>
  		<%=dto.getAddress1() %>
 		<%=dto.getAddress2() %>	 
 		</td>
 </tr>
 <tr>
 		<th>JOB</th>
 		<td><%=dto.getJob() %>(<%=Utility.getCodeValue(dto.getJob()) %>)</td>
 </tr>
 <tr>
 		<th>DATE</th>
 		<td><%=dto.getMdate() %></td>
 </tr>
 
 
 </table>
 
 <div style="text-align: center">
 <button class="btn" onclick="update()">정보 수정</button>
 <button class="btn" onclick="del()">회원 탈퇴</button>
 <%if(id !=null && !grade.equals("A")) {%>
 <button class="btn" onclick="updateFile()">사진 수정</button>
 <button class="btn" onclick="updatePw()">패스워드 변경</button>
 <button class="btn" onclick="filedown()">다운로드</button>
 <%} %>
 <%if(id != null && grade.equals("A")) {%> 
 <button class="btn" onclick="listM()">회원목록</button>
 <%} %>
</div>
</div>
</body> 
</html> 