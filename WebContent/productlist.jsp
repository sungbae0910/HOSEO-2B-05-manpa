<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="manpaboard.Bdto" %>
<%@ page import="manpaboard.BDao" %>
<%@ page import="java.util.ArrayList" %>
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
<title>맨파</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
ul,ol,li {list-style:none;}
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



.line{
	width: 5000px; 
    height: 150px;
    border-bottom: 1px solid gray;
}

.logoimage{
	width:70px;
	height:57px;
	margin-left:460px;
	position:relative;
	bottom:150px;
}
.no-uline { text-decoration:none; }


.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% 'Helvetica Neue', Helvetica, Arial, sans-serif;
font-size:14px;
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
font-size:12px;
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

table{
	font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	width:40%;
	margin:auto;
	text-align:center;
	position:relative;
	left:30px;
}

.td{
	padding-top:60px;
}
tr{
	padding-bottom:30px;
}

.product{
	width:220px;

}

.side{
	width:7%;
	position:relative;
	left:470px;
	bottom:10px;
	float:left;
	font-family: 'Jua', sans-serif;

}

.cate{
	position:relative;
	left:690px;
	bottom:10px;
	font-family: 'Jua', sans-serif;
}

.prod {margin-left:700px;}
.prod01 {}
.productUl{
   margin: 0 auto;
   width:1200px;
}

.productLi{
   text-align:center;
   margin: 10px 0 0 10px;
    border: 1px solid #ccc;
    width: 300px;
    list-style: none;
    float:left;
    box-sizing: border-box;
}

.productUl::after {
  content: "";
  clear: both;
  display: table;
}
.PageNum{
	left:6000px;
}
</style>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">




</head>
<body>
<%
	String pageNumber = request.getParameter("pageNumber");
	if(pageNumber==null){
		pageNumber = "1";
	}
	
	
   //WatTimeProductDAO 연결.
   BDao productDAO = new BDao();
   //초기 배열을 빈 배열로 선언
   ArrayList<Bdto> productList = null;
   
   //화면에 표시할 게시물 갯수
   int pageSize = 9;
   //URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
   int currentPage = Integer.parseInt(pageNumber);
   int startRow = (currentPage - 1) * pageSize + 1;
   //처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
    int brandstartRow = (currentPage - 1) * pageSize + 1;
   //끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
    int endRow = pageSize;
   //테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
    int count = 0;
   //???
    int number = 0;
    count = productDAO.getpage();
    number = count-(currentPage-1)*pageSize;
  

 %>
<div>
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
<h5 class="cate">홈>디자인>간판디자인</h5>
<div class="side">
	<h2>디자인</h2><br>
	&nbsp&nbsp&nbsp&nbsp로고 디자인<br><br>
	&nbsp&nbsp&nbsp&nbsp간판 디자인<br><br>
	&nbsp&nbsp&nbsp&nbsp명함, 인쇄물<br><br>
	&nbsp&nbsp&nbsp&nbsp캐릭터<br><br>
	&nbsp&nbsp&nbsp&nbsp포토샵 편집<br><br>
	&nbsp&nbsp&nbsp&nbsp의류 디자인<br><br>
</div>
<%	
		String num = null;
		if(session.getAttribute("num")!=null){
			num = (String) session.getAttribute("num");
		}
		
		if(request.getParameter("pageNumber")!=null){
		}
	%>

	<div class="prod">
	<ul class="productUl">
	<%
				BDao bdao = new BDao();
				ArrayList<Bdto> list = bdao.getList(Integer.parseInt(pageNumber),startRow,endRow);
				for(int i = 0; i < list.size(); i++){
			%>
	 <li class="productLi">
			<div><a href="product.jsp?num=<%=list.get(i).getNum()%>"><img alt="s" src="upload/<%= list.get(i).getMainimg()%>" class="product" width="200" height="200"></a></div>
			<div><%= list.get(i).getTitle() %></div>
			<div><%= list.get(i).getPrice() %>원</div>
	</li>


	<%
	}
	%>
	</ul>


</div>
		
<% 
   
   //테이블의 행이 0 초과일 경우
   if (count > 0) {
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = 1 ;
      
      if(currentPage % 10 != 0){
         startPage = (int)(currentPage/10)*2 + 1;
      }else{
         startPage = ((int)(currentPage/10)-1)*10 + 1;
      }
      int pageBlock = 10;
      int endPage = startPage + pageBlock - 1;
      if (endPage > pageCount){
         endPage = pageCount;
      }
        if (startPage > 10) { 
%>
         <input type="button" name="back"  value="이전" id="PageNum" onclick="back('<%=startPage - 10%>')">
<%      
      }
        for (int i = startPage ; i <= endPage ; i++) {  
		if(i==Integer.parseInt(pageNumber)){
%>
                <input type="button" class="page" name="nowPageNum" id="nowPageNum"  value="<%=i %>" onclick="pageNum(this.value)">
<%
            }else{
%>
                <input type="button" class="page" name="pageNum" id="PageNum"  value="<%=i %>" onclick="pageNum(this.value)">
<%
            }
        }
        if (endPage < pageCount) {  %>
           <input type="button" class="page" name="back" value="다음" id="PageNum" onclick="next('<%=startPage + 10%>')">
<%
        }
    }
%>
<c:if test="${id ne null}">
<input type="button" onclick="location.href='productwrite.jsp'" class="btn btn-info pull-right" style="position:relative; right:460px;font-family: 'Jua', sans-serif;" value="글쓰기">
</c:if>
<script>
//다음
function next(pageNum){
   var form = document.createElement("form");
   form.setAttribute("charset", "utf-8");
   form.setAttribute("method", "Post"); // Get 또는 Post 입력
   form.setAttribute("action", "productlist.jsp?pageNum="+pageNum);

   hiddenField = document.createElement("input");
   hiddenField.setAttribute("type", "hidden");
   hiddenField.setAttribute("name", "pageNumber");
   hiddenField.setAttribute("value", pageNum);
   form.appendChild(hiddenField);
     
   document.body.appendChild(form);
   
   form.submit();
}

function back(pageNum){
	   var form = document.createElement("form");
	   form.setAttribute("charset", "utf-8");
	   form.setAttribute("method", "Post"); // Get 또는 Post 입력
	   form.setAttribute("action", "productlist.jsp?pageNum="+pageNum);

	   hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "hidden");
	   hiddenField.setAttribute("name", "pageNumber");
	   hiddenField.setAttribute("value", pageNum);
	   form.appendChild(hiddenField);
	     
	   document.body.appendChild(form);
	   
	   form.submit();
	}
	
function pageNum(pageNum){
	   var form = document.createElement("form");
	   form.setAttribute("charset", "utf-8");
	   form.setAttribute("method", "Post"); // Get 또는 Post 입력
	   form.setAttribute("action", "productlist.jsp?pageNum="+pageNum);

	   hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "hidden");
	   hiddenField.setAttribute("name", "pageNumber");
	   hiddenField.setAttribute("value", pageNum);
	   form.appendChild(hiddenField);
	     
	   document.body.appendChild(form);
	   
	   form.submit();
	}

</script>
</body>
</html>