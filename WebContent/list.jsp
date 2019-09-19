<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.head{
	width:100%;
	position:relative
}	
body {
   font-family: 'Jua', sans-serif;
   color: #333333;
   background: #FFFFFF;
   position:relative;
   top:180px;
   margin-bottom:120px;
   height:85%;
}

.signUp {
   position: relative;
   margin: 50px auto;
   width: 600px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;

   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -10px -10px 10px;
   padding: 5px 15px;
   line-height: 30px;
   font-size: 15px;
   font-weight: 300;
   color: #777;
   text-align: left;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #ffffff;
}

.tmi {
   margin: -10px -10px 10px;
   padding: 5px 15px;
   line-height: 30px;
   font-size: 12px;
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
   width: 98%;
   height: 32px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #E1E1E1;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #E1E1E1;
   box-shadow: inset 0 -2px #E1E1E1;
}

.signUpInput:focus {
   border-color: #CFCFCF;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #CFCFCF;
   box-shadow: inset 0 -2px #CFCFCF;
}

.write {
   width: 93%;
   height: 300px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 15px;
   background: white;
   border: 2px solid #E1E1E1;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #E1E1E1;
   box-shadow: inset 0 -2px #E1E1E1;
}




.signUpButton {
   position: relative;
   vertical-align: top;
   width: 49%;
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
	height:14%;
	background-color:#D8D8D8;
	text-align:center;
	color:black;
	font-family: 'Jua', sans-serif;
	margin-top:60px;
}

#notice{
	position:relative;
	bottom:70px;
	width:1000px;
	margin:auto;
	padding:auto;
	font-family: 'Jua', sans-serif;
	
}

.noticeTitle{
	position:relative;
	left:460px;
	bottom:100px;
	font-family: 'Jua', sans-serif;
}
.search {
   width: 15%;
   height: 26px;
   font-size: 12px;
   background: white;
   border: 2px solid #E1E1E1;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #E1E1E1;
   box-shadow: inset 0 -2px #E1E1E1;
}
.noticeSearch{
	position:relative;
	left:730px;
	top:10px;
}
</style>

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

<body>
<h2 class="noticeTitle">공지사항</h2>
<table class="table table-hover" id="notice">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<jsp:useBean id="today" class="java.util.Date"/>
	<fmt:formatDate value='${today}' pattern='yyyyMMdd' var="nowdate"/>
	<c:choose>
	<c:when test="${nowdate eq dto.bDate}">
	<c:forEach items="${list}" var="dto">
		<tr>
			<td>new ${dto.id}</td>
			<td><a href="content_view.do?id=${dto.id}">${dto.title}</a></td>
			<td>${fn:substring(dto.bDate,0,10)}</td>
			<td>${dto.readcount}</td>
		</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.id}</td>
			<td><a href="content_view.do?id=${dto.id}">${dto.title}</a></td>
			<td>${fn:substring(dto.bDate,0,10)}</td>
			<td>${dto.readcount}</td>
		</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</tbody>
	
</table>
<c:if test="${id eq 'admin'}">
<input type="button" onclick="location.href='write_view.jsp'" class="btn btn-info pull-right" style="position:relative; right:460px;font-family: 'Jua', sans-serif;" value="글쓰기">
</c:if>
<div class="text-center">
	<ul class="pagination">
	<c:url var="action" value="list.do"/>
		<li><a href="${action}?page=${paging.firstPageNo}"><<</a></li>
		<li><a href="${action}?page=${paging.prevPageNo}"><</a></li>
		<c:forEach step="1" begin="${paging.startPageNo}" end="${paging.endPageNo}" var="i">
			<c:choose>
				<c:when test="${i eq paging.pageNo}">
					<li><a href="${action}?page=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${action}?page=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
					<li><a href="${action}?page=${paging.nextPageNo}">></a></li>
					<li><a href="${action}?page=${paging.finalPageNo}">>></a></li>
	</ul>
</div>
<div class="noticeSearch">
<form>
	<select name="opt">
    	<option value="0">제목</option>
    	<option value="1">내용</option>
    	<option value="2">제목+내용</option>
    	<option value="3">작성자</option>
	</select>
	<input type="text" class="search" name="condi">
	<input type="submit" value="검색" class="btn btn-info" style="position:relative; height:26px;font-family: 'Jua', sans-serif;"/>
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