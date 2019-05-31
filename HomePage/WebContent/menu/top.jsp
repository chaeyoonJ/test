<%@ page contentType="text/html; charset=UTF-8" %> 
<%String root = request.getContextPath();
	  String id = (String)session.getAttribute("id");
	  String grade = (String)session.getAttribute("grade");
	  
	  String str = "";
	  if(id !=null && !grade.equals("A")){
		  str = "Hello " + id + "!!"; 
	  }else if(id!=null && grade.equals("A")){
		  str = "Administraion";
	  }
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <META CHARSET="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>

.h3{

font-size:60px;
padding-top: 10px;

}
.col-sm-4{
font-size:30px;
padding-top: 10px;
padding-bottom: 20px;
}

nav{
font-size:30px;
}

	#img_profile{
	width:500px;
	height:500px;
	margin:20px;
	}
	
	.bg-main{
	background-color: #1abc9c;
            color:#fff;
            font-weight: bold;
            font-size:60px;
            padding-top: 50px;
            padding-bottom: 250px;
}

	.bg-sub{
	background-color: #474e5d;
            color:#fff;
            font-size:30px;
            padding-top: 70px;
            padding-bottom: 70px;
	}
	
	.bg-sub2{
	background-color: #fff;
            color:#999;
            padding-top: 70px;
            padding-bottom: 100px;
            font-size: 14px;
	}
	
	.footer{
	background-color: #333;
            color:#ccc;
            padding-top: 70px;
            padding-bottom: 50px;
            font-size: 12px;
	}
	#welcome{
			color: lightblue;
	}
	
</style>
  

</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">MENU</a></div>
				  <p id="welcome"><%=str %></p>
	    	                                 
	    <ul class="nav navbar-nav">
	    	<li class="active"><a href="<%=root %>/homepage/index.jsp">HOME</a></li>
	       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
	    	Board<span class="caret"></span></a>
	     <ul class="dropdown-menu">
	        	<li><a href="<%=root %>/bbs/createForm.jsp">Create</a></li>
	        	<li><a href="<%=root %>/bbs/list.jsp">List</a></li>
	    </ul>
	    </li>
	    
	    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
	    	Guestbook<span class="caret"></span></a>
	     <ul class="dropdown-menu">
	        	<li><a href="<%=root %>/guestbook/createForm.jsp">Create</a></li>
	        	<li><a href="<%=root %>/guestbook/list.jsp">List</a></li>
	    </ul>
	    </li>

	    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
	    	Image<span class="caret"></span></a>
	     <ul class="dropdown-menu">
	        	<li><a href="<%=root %>/project/createForm.jsp">Create</a></li>
	        	<li><a href="<%=root %>/project/list.jsp">List</a></li>
	    </ul>
	    </li>
	    <%if(id==null) { %>
	    <li><a href="<%=root %>/member/agreement.jsp">Sign up</a></li>
	    <li><a href="<%=root %>/member/loginForm.jsp">Log in</a></li>
	    <%}else{ %>
	    <li><a href="<%=root %>/member/read.jsp">My Info</a></li>
	    <li><a href="<%=root %>/member/updateForm.jsp">Update Info</a></li>
	    <li><a href="<%=root %>/member/logout.jsp">Log out</a></li>
	    <%} %>
	    <%if(id!=null && grade.equals("A")) {%>
	    <li><a href="<%=root %>/admin/list.jsp">guest list</a></li>
	    <%} %>
	  </ul>

  
</div>
</nav>
</body> 
</html> 