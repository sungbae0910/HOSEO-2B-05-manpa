<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="manpaboard.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		String writer = request.getParameter("writer");
		String contents =  request.getParameter("contents");
		int starpoint = Integer.parseInt(request.getParameter("starpoint"));
		int division =  Integer.parseInt(request.getParameter("division"));
		
		new commentDao().commetplus(writer, contents, starpoint, division);
		
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 작성에 성공하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
		
		
	%>
</body>
</html>