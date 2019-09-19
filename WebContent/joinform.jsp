<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script language="javascript">
	function checkPost(){
		window.open("checkpost.jsp","","width=500 height=500 scrollbars=yes");
	}
	
	</script>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="post" size="10" readonly></input><input type="button" value="우편번호체크" onClick="javascript:checkPost()"></input><br>
	<input type="text" id="addr1"  readonly></input><br>
	<input type="text" id="addr2" ></input>
</body>
</html>