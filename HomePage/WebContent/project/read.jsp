<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="project.*,java.util.*"%>
<jsp:useBean id="dao" class="project.ProjectDAO" />
<jsp:useBean id="dto" class="project.ProjectDTO" />
<%
	request.setCharacterEncoding("utf-8");

	int imgno = Integer.parseInt(request.getParameter("imgno"));
	dao.upViewcnt(imgno);
	dto = dao.read(imgno);

	String content = dto.getContent();

	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진정보</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readGo(imgno){
	var url = "./read.jsp";
	url = url +"?imgno="+imgno;
	
	location.href=url;
}
function updateM(){
	var url = "updateForm.jsp";
	url += "?imgno=<%=dto.getImgno()%>";
	url += "&oldfile=<%=dto.getFname()%>";
		
	location.href=url;
}
function deleteM(){
	var url = "deleteForm.jsp";
	url += "?imgno=<%=dto.getImgno()%>";
	url += "&oldfile=<%=dto.getFname()%>";

		location.href = url;

	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10"><%=dto.getMname() %>님의 회원정보</h1>
<table class="table table-bordered">
<tr>
<td colspan="2" style="width: 50%">
<img src="./storage/<%=dto.getFname() %>" width="50%" >
</td>
</tr>
<tr>
   <th>제목</th>
   <td><%=dto.getTitle() %></td>
 </tr>
<tr>
   <th>내용</th>
   <td><%=dto.getContent() %></td>
 </tr>
<tr>
   <th>이름</th>
   <td><%=dto.getMname() %></td>
 </tr>
<tr>
   <th>날짜</th>
   <td><%=dto.getWdate() %></td>
 </tr>
<tr>
   <th>조회수</th>
   <td><%=dto.getViewcnt() %></td>
 </tr>
</table>
<TABLE style="width: 50%">
<tr>
<%
List list = dao.imgRead(imgno);
String[] files = (String[])list.get(0);
int[] noArr = (int[])list.get(1);
for(int i=0; i<5; i++){
	if(files[i]==null){  
%>
 <td class="td_padding"><img src="./storage/123.jpg" width="100%"><td>
  <%    
        }else{
        	if(noArr[i]==imgno){
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%    
        }else{
  %>
   <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
        
  <%
        }
       }      
      }
  %>
  </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록'
						onclick="location.href='createForm.jsp'">
    <input type='button' value='목록' onclick="location.href='list.jsp'">
  	<input type='button' onclick="updateM()" value='수정'>
  	<input type='button' onclick="deleteM()" value='삭제'>

  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</div>
			</body>
<!-- *********************************************** -->
</html> 

