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
		
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest
		=new MultipartRequest(request, directory, maxSize, encoding,
					new DefaultFileRenamePolicy());
		
		
		String title = multipartRequest.getParameter("title");
		String categori = multipartRequest.getParameter("categori");
		String price = multipartRequest.getParameter("price");
		String mainimg = multipartRequest.getFilesystemName("file");
		String content = multipartRequest.getParameter("content");
		String pi = multipartRequest.getParameter("pi");
		
		new BDao().write(title, categori, price, mainimg, content,pi);
		
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('글이 성공적으로 작성되었습니다.')");
		script.println("location.href = 'productlist.jsp'");
		script.println("</script>");
		
	%>
</body>
</html>