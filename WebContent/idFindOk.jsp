<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="com.manpa.login.*"%>
 <jsp:useBean id="dto" class="com.manpa.login.loginDto"/>
 <jsp:setProperty name="dto" property="*"/>  
 <%
	request.setCharacterEncoding("utf-8");

	loginDao dao = loginDao.getInstance();
	String id = dao.idFind(dto);
%>
<% if(id==null){ %>
		<script language="javascript">
			alert("존재하지 않는 계정입니다.");
			history.go(-1);
		</script>
<% }else{ 
%>
		<script language="javascript">
			alert("찾으시는 아이디는 <%=id%>입니다.");
			location.href="sang/login.html";
		</script>
<%
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>