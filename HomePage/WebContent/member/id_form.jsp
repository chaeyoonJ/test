<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>ID 중복확인</title>
  <META CHARSET="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style type="text/css">
  #red{
  		color : red;
  }
  
  </style>
</head>
<body>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">ID 중복확인</h1>
 <form class="form-horizontal" method="post" 
       action="idProc.jsp">
  
  <p id="red" class="col-sm-offset-2 col-sm-10">아이디를 입력하세요</p>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">아이디</label>
    <div class="col-sm-4">
      <input type="text" name="id" id="id" class="form-control" required="required">
    </div>
  </div>
  
  
  
  
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">중복확인</button>
    <button type="button" class="btn" onclick="window.close()">취소</button>
   </div>
  </div> 

</form>  
</div>
</body> 
</html> 