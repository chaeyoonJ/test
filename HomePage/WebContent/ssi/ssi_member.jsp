<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import = "member.MemberDAO" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "java.util.*" %>
<%@ page import = "utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<% request.setCharacterEncoding("utf-8"); 
		String root = request.getContextPath(); //현재 폴더에 해당하는 webtest
		
String upDir = "/member/storage";
String tempDir = "/member/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

%>