<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.manpa.login.*"%>
 <jsp:useBean id="dto" class="com.manpa.login.loginDto"/>
 <jsp:setProperty name="dto" property="*"/>  

 <%
	String id = (String)session.getAttribute("id");
	dto.setId(id);
 	loginDao dao = loginDao.getInstance();
 	int ri = dao.changePass(dto);
 	
 	if(ri==1){
 %>
 	<script language="javascript">
		alert("정보수정 되었습니다.");
		document.location.href="sang/login.html";
	</script>
<%
	session.invalidate();
	}else{
%>
	<script language="javascript">
		alert("정보수정 실패 입니다.");
		history.go(-1);
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