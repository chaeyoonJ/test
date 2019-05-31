<%@ page contentType="text/html; charset=UTF-8" %> 
<%
// -----------쿠키설정 내용 시작
		String c_id = "";
		String c_id_val = "";
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		
		if(cookies!=null){
			for(int i = 0; i<cookies.length;i++){
				cookie = cookies[i];
				
				if(cookie.getName().equals("c_id")){
					c_id = cookie.getValue();
				}else if(cookie.getName().equals("c_id_val")){
					c_id_val = cookie.getValue();
				}
			}
		}
//-------쿠키설정 내용 끝------------
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">

</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">Login</h1>
 <form class="form-horizontal" method="post" 
       action="<%=request.getContextPath() %>/member/loginProc.jsp">
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">ID</label>
    
    <div class="col-sm-4">
      <input type="text" name="id" id="id" class="form-control"  value='<%=c_id_val %>'  required="required">
     </div>
     <div class="col-sm-2">
     <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
       <% 
       }else{ %> 
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
       <% 
       } 
       %> 
       </div>
    
    
    
  </div>
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">Password</label>
    <div class="col-sm-4">
      <input type="password" name="passwd" id="passwd" 
                     class="form-control" required="required">
    </div>
  </div>
  
    
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-7">
    <button class="btn">Log in</button>
    <button type="button" class="btn" onclick="location.href='agreement.jsp'">Sign up</button>
    <button type="button" class="btn" onclick="location.href='idSearchForm.jsp'">search ID</button>
    <button type="button" class="btn" onclick="location.href='passwdSearchForm.jsp'">search Password</button>
   </div>
   	  </div> 

</form>  
</div>
</body> 
</html> 