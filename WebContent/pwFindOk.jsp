<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.manpa.login.*"%>
 <jsp:useBean id="dto" class="com.manpa.login.loginDto"/>
 <jsp:setProperty name="dto" property="*"/>  
 <%
	request.setCharacterEncoding("utf-8");
 
	String id = request.getParameter("id");
	String eMail = request.getParameter("eMail");
	loginDao dao = loginDao.getInstance();
	String pass = dao.pwFind(dto);
%>
<% if(pass==null){ %>
		<script language="javascript">
			alert("존재하지 않는 계정입니다.");
			history.go(-1);
		</script>
<%
	}else{ 
		session.setAttribute("id", id);
%>
		<script language="javascript">
			location.href="sang/pwchange.html";
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>