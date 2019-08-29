<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manpa.login.*"%>
<%@ page import="java.sql.*"%>    
<% request.setCharacterEncoding("UTF-8"); %> 
 <jsp:useBean id="dto" class="com.manpa.login.loginDto"/>
 <jsp:setProperty name="dto" property="*"/>  
<%
	String idinput = request.getParameter("idinput");
	loginDao dao = loginDao.getInstance();
	int check = dao.confirmId(idinput);
	if(check == 1){
%>
<b><font color="black"><%=idinput%></font>는 이미 사용중입니다.</b>
<form name="checkFrom" method="post" action="idcheckok.jsp">
<b>다른아이디 선택하세요.</b><br><br>
<input type="text" name="idinput">
<input type="submit" value="중복확인">
</form>
<%
	}else{
%><center>
	<b>입력하신<%=idinput%></b><br>
		사용할 수 있는 Id입니다.<br>
		<input type="button" value="닫기" onclick="setId()">
</center>
<%} %>

<script language="javascript">
	function setId(){
		opener.document.f.id.value="<%=idinput%>";
		window.close();
	}
</script>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
