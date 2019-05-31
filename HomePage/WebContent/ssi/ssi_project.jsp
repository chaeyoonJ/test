<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utility. *"%>
<%@ page import="project.ProjectDAO"%>
<%@ page import="project.ProjectDTO"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	//현재 프로젝트 폴더(webtest) 인식

	String upDir = "/project/storage";
	String tempDir = "/project/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
%>