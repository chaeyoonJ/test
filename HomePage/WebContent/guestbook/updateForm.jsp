<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id = "dao" class="guestbook.GuestbookDAO" />
<%
   int no = Integer.parseInt(request.getParameter("no"));
   GuestbookDTO dto = dao.read(no);
   
   String part = dto.getPartstr();

   
%>

<!DOCTYPE html> 
<html> 
<head>
<jsp:include page="/menu/top.jsp" />
  <title>방명록 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container">
<h1 class = "col-sm-offset-2 col-sm-10">방명록 수정</h1>

<form class = "form-horizontal" method="post" action="updateProc.jsp" 
             name="frm">
     <input type="hidden" name="no" value="<%=dto.getNo()%>">
     <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
     <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
     <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<!--                                                         )와 % 사이에 띄어쓰기 하면 에러 -->
     <div class = "form-group">
     <label class="control-label col-sm-2" for="name">이름</label>
     <div class="col-sm-10">
          <%=dto.getName() %>
     </div>
     </div>    
     
     <div class="form-group">
      <label class="control-label col-sm-2">성별</label>
      <div class="col-sm-10">
           <%=dto.getGender() %>
      </div>
      </div>       
     
      <div class="form-group">
      <label class = "control-label col-sm-2">제목</label>
      <div class="col-sm-10">
      <input type = "text" class="form-cotrol" name="title"
                     value="<%=dto.getTitle() %>" id="title">
      </div>
      </div>
     
      <div class="form-group">
      <label class="control-label col-sm-2">내용</label>
      <div class="col-sm-10">
      <textarea rows="4" cols="50" name="content" ><%=dto.getContent() %></textarea> 
      </div>
      </div>
      
      <div class="form-group">
      <label class="control-label col-sm-2">분야</label>
      <div class="col-sm-10">
           <label class="checkbox-inline">
           <input type="checkbox" name="part" value="안부"
           <%if(part.indexOf("안부")!=-1) out.print("checked"); %>
           >안부
           </label>
           <label class="checkbox-inline">
           <input type="checkbox" name="part" value="질문"
           <%if(part.indexOf("질문")!=-1) out.print("checked"); %>
           >질문
           </label>
           <label class="checkbox-inline">
           <input type="checkbox" name="part" value="불만"
           <%if(part.indexOf("불만")!=-1) out.print("checked"); %>
           >불만
           </label>
       </div>
       </div>    
       <script type="text/javascript">
          document.frm.part.value='<%=dto.getPart() %>';
       </script>
      <div class="form-group">
      <label class="control-label col-sm-2">비밀번호</label>
      <div class="col-sm-10">
      <input type = "text" class="form-cotrol" name="password"
                     value="<%=dto.getPassword() %>" id="password">
      </div>
      </div>     
      
      <div class="form-group">
           <div class="col-sm-offset-2 col-sm-5">
           <button class ="btn">수정</button>
           <button type = "reset" class="btn">취소</button>
           </div>
      
      </div>
      
      

</form>
</div>
</body> 
</html> 