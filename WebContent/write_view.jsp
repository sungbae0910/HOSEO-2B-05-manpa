<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
		
	session.setAttribute("id", id);
	session.setAttribute("name", name);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
head{
	height:15%
}

body {
    font-family: 'Jua', sans-serif;
   color: #333333;
   background: #FFFFFF;
   position:relative;
   top:180px;
	height:63%;
   margin-bottom:120px;
}

.signUp {
   position: relative;
   margin: 5px auto;
   width: 450px;
   background: #FFFFFF;
}



.signUpTitle {
	paddin-bottom:10px;
   line-height: 1px;
   font-size: 17px;
   font-weight: 300;
   color: #777;
   text-align: left;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #ffffff;
}



input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   	width: 90%;
   	height: 40px;
   	margin:-5px;	
   	font-size: 18px;
   	background: white;
   	border: 2px solid #EBEBEB;
   	border-radius: 4px;
   	-webkit-box-shadow: inset 0 -2px #EBEBEB;
   	box-shadow: inset 0 -2px #EBEBEB;
   	
}

.signUpInput:focus {
   border-color: #CFCFCF;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #CFCFCF;
   box-shadow: inset 0 -2px #CFCFCF;
}
.signUpButton {
   position: relative;
   vertical-align: top;
   width: 44.5%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #00C6ED;
   border: 0;
   border-bottom: 2px solid #00C6ED;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #00C6ED;
   box-shadow: inset 0 -2px #00C6ED;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

.logoimage{
	width:70px;
	height:57px;
	margin-left:460px;
}
.logohead{
	width:100%;
	height:57px;

	position:relative;
	bottom:150px;
	background-color:#D8D8D8;
}



.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% 'Helvetica Neue', Helvetica, Arial, sans-serif;
font-size:20px;
font-weight:bold;
position:relative;
bottom:150px;
}

.menubar ul{
background:#ffffff;
height:50px;
list-style:none;
margin:0;
padding-left:420px;
font-family: 'Jua', sans-serif;
}

.menubar li{
float:left;
width:12%;
padding:0px;

}

.menubar li a{
background: #FFFFFF;
color:#000000;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.menubar li a:hover, .menubar ul li:hover a{
background:#BDBDBD;
color:#FFFFFF;
text-decoration:none;
}

.menubar li ul{
background: rgb(109,109,109);
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.menubar li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
background:#878787;
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.menubar li:hover li a{
background:none;
}

.menubar li ul a{
display:block;
height:50px;
font-size:16px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color:#ffffff;
text-decoration:none;
}

.menubar p{
clear:left;
}

.menu1 a{cursor:pointer;}
.menu1 .hide{display:none;}

footer{

	width:100%;
	height:21%;
	background-color:gray;
	text-align:center;
	color:white;
	overflow:hidden;
	margin-top:100px;
}

.write{
	width:55%;
	margin:auto;
	font-family: 'Jua', sans-serif;
	padding-left:40px;
	position:relative;
	bottom:70px;
}
.upload{
	width:100%;
}
.upload label {
	position:relative; 
	cursor:pointer; 
	display:inline-block; 
	vertical-align:middle; overflow:hidden; 
	width:150px; height:30px; 
	background:#00C6ED; color:#fff; 
	text-align:center; 
	line-height:30px;
}
.upload label input {
	position:absolute; 
	width:0; 
	height:0; 
	overflow:hidden;
}
.upload input[type=text] {
	vertical-align:middle; 
	display:inline-block; 
	width:60%; 
	height:28px; 
	line-height:28px; 
	font-size:11px; 
	padding:0; 
}
.imgs_wrap {
	width: 600px;
	margin-top: 50px;
}
.imgs_wrap img {
	max-width: 200px;
}
</style>

<!-- 섬머노트를 사용하는데 필요한 것들 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>



<!-- 섬머노트 에디터를 불러오는 스크립트  -->
<script>
$(document).ready(function() {
    $('#summernote').summernote({
    		width: 900,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
}); 
</script>
</head>
<body>
<div class="logohead">
	<c:choose> 
	<c:when test="${id ne null}">
	<a href="mainjoin.jsp"><img src="img/logo.png" class="logoimage"></a>
	</c:when>
	<c:otherwise>
	<a href="main.jsp"><img src="img/logo.png" class="logoimage"></a>
	</c:otherwise>
	</c:choose>
</div>
<div class="menubar">
   	<ul>
      	<li><a href="#">IT 프로그래밍</a>
      		<ul>
           		<li><a href="#">간판 디자인</a></li>
          	 	<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
        	</ul>
      	</li>     	
      	<li><a href="#" id="current">디자인</a>
         	<ul>
           		<li><a href="#">간판 디자인</a></li>
           		<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
         	</ul>
      	</li>
      	<li><a href="#">마케팅</a>
      		<ul>
           		<li><a href="#">간판 디자인</a></li>
          	 	<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
        	</ul>
      	</li>
      	<li><a href="#">문서, 취업</a>
      		<ul>
           		<li><a href="#">간판 디자인</a></li>
          	 	<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
        	</ul>
      	</li>
      	<li><a href="#">콘텐츠 제작</a>
      		<ul>
           		<li><a href="#">간판 디자인</a></li>
          	 	<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
        	</ul>
      	</li>
      	<li><a href="#">번역</a>
      		<ul>
           		<li><a href="#">자막 번역</a></li>
          	 	<li><a href="#">썸네일 디자인</a></li>
           		<li><a href="#">인쇄물 디자인</a></li>
           		<li><a href="#">패키지 디자인</a></li>
        	</ul>
      	</li>
   	</ul>
</div>

<div class="write">
	<form action="write.do" method="post">
	<h2>공지사항 쓰기</h2><br><br>
	<h3>작성자</h3>
	<input type="text" class="signUpInput" name="name">
	<h3>제목</h3>
	<input type="text" class="signUpInput" name="title">
	<h3>내용</h3>
	<textarea name="content" id="summernote"></textarea>
	<input type="submit" value="올리기" class="signUpButton">
	<input type="button" value="취소" class="signUpButton" onclick="location.href='list.do'">
	</form>
</div>

<footer>
	<div class="foo_div">
		<span>맨파</span> <span>/</span>
		<span>대표:홍길동</span> <span>/</span>
		<span>사업자 등록번호:010-000-0000</span>
		<p>대한민국 어딘가</p>
	</div>
</footer>

</body>
</html>