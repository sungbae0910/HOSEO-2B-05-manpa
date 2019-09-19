<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript">
	function pValue(){
    document.getElementById("id").value = opener.document.f.id.value;
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<gr size="1" width="460">
	<br>
	<div id="chk">
		<form method="post" action="idcheckok.jsp" id="checkForm">
			<input type="text" name="idinput" id="id">
			<input type="submit" value="중복확인">
		</form>
</div>

</body>
</html>