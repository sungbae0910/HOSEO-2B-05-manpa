<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.manpa.post.*"%>
<%@ page import="java.sql.*"%> 
 <% request.setCharacterEncoding("utf-8"); %> 
 <%
 	String juso = request.getParameter("juso");
 %>  

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="checkpost.jsp">
		<input type="text" name="juso" placeholder="주소입력 : 공덕동">
		<input type="submit" value="검색">
	</form><br>
	<table id="tableval" border="1">
		<tr>
			<th width="100">우편번호</td>
			<th width="600">주소</td>
		</tr>
	<%
		postDto dto = new postDto(); 
		try(Connection conn = postDao.getInstance().getConnection()){
			PreparedStatement pstmt = conn.prepareStatement("select * from zip_code where juso like '%"+ juso +"%'");
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()){
				do{
					String post = set.getString("post");
					String addr = set.getString("juso");
	%>
		<tr>
		<td><%=post%></td>
		<td><%=addr%></td>
		</tr>
		
		<%
				}while(set.next());
		%>
		</table>
		<%
				}else{
				}
			}catch(Exception e){
				e.printStackTrace();	
			}
				
		%>
		
		
	<script>
	$("#tableval tr").click(function(){
		
			var str=""
			var tdArr=new Array();
			
			var tr = $(this);
			var td = tr.children();			
			
			var zipcode = td.eq(0).text();
			var addrs = td.eq(1).text();
			
			opener.document.getElementById("post2").value = zipcode; // 회원가입폼에 우편번호값 입력
			opener.document.getElementById("adress2").value = addrs; // 회원가입폼에 첫번째 주소값 입력
			window.close(); // 창 종료
			opener.document.getElementById("adress3").focus(); // 회원가입폼의 두번째 주소박스에 커서이동
	});

</script>		
	

</body>
</html>
