<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.manpa.login.*"%>
<%@ page import="java.sql.*"%>
 <% request.setCharacterEncoding("utf-8"); %> 
 <jsp:useBean id="dto" class="com.manpa.login.loginDto"/>
 <jsp:setProperty name="dto" property="*"/>  
 <%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String eMail = request.getParameter("eMail");
	String gender = request.getParameter("gender");
	String post = request.getParameter("post");
	String adress = request.getParameter("adress");
	String adress2 = request.getParameter("adress2");
	
	
 	// rDate�� �����Է��� �ƴ� ��ǻ�Ϳ��� �Է����ִ� ���̹Ƿ� ���� ����
 	dto.setrDate(new Timestamp(System.currentTimeMillis()));
 	loginDao dao = loginDao.getInstance();
 	
			int ri = dao.insertMember(dto);
			if(ri == loginDao.MEMBER_JOIN_SUCCESS){
				session.setAttribute("id", dto.getId());
 %>
 	<script language="javascript">
 		alert("ȸ�������� �����մϴ�.");
 		document.location.href="sang/login.html";
 	</script>
 <%
		}else{
 %>
 	<script language="javascript">
 		alert("ȸ�����Կ� �����߽��ϴ�.");
 		document.location.href="sang/membership.html";
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