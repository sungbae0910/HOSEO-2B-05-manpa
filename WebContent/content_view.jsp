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
}

body {
    font-family: 'Jua', sans-serif;
   color: #333333;
   background: #FFFFFF;
   position:relative;
   top:180px;
	height:78%;
   margin-bottom:120px;
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
	margin-top:50px;
}

.noticeTitle{
	font-family: 'Jua', sans-serif;
	position:relative;
	left:660px;
}

.noticeContent{
	font-family: 'Jua', sans-serif;
	position:relative;
	left:660px;
	padding-top:20px;
}
.content{
	width:50%;
}
</style>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">




</head>
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

<div class="content">
<form action="modify_view.do" mehtod="post">
	<input type="hidden" name="id" value="${content_view.id}">
	<h2 class="noticeTitle">[공지사항] ${content_view.title}
	<h5 class="noticeTitle">${content_view.bDate}</h5>
	</h2><br><br>
	<h4 class="noticeContent">
	${content_view.content}
	</h4>
	<c:if test="${id eq 'admin'}">
		<input type="submit" value="수정" class="btn btn-info pull-left" style="position:relative; left:660px; top:30px; font-family: 'Jua', sans-serif;"> &nbsp;&nbsp;
		<input type="button" value="삭제" onclick="location.href='delete.do?id=${content_view.id}'" class="btn btn-info pull-left" style="position:relative; left:660px; top:30px; font-family: 'Jua', sans-serif;">
		</c:if>
		<a href="list.do" class="btn btn-info pull-left" style="position:relative; left:660px; top:30px; font-family: 'Jua', sans-serif;">목록보기</a> &nbsp;&nbsp; 
<br><br><br><br><br><br><br><br>
<h3 class="noticeTitle">△[공지사항] 오늘 수업은 휴강입니다.</h3>
<h3 class="noticeTitle">▽[공지사항] 오늘 수업은 개강입니다.</h3>
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