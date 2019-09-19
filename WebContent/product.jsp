<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "manpaboard.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맨파</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 50px;
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
.writeButton {
   position: relative;
   vertical-align: top;
   width: 80px;
   height: 30px;
   font-size:20px;
   padding: 0;
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
.signUpInput {
   width: 180px;
   height: 30px;
   background: white;
   border: 2px solid #E1E1E1;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #E1E1E1;
   box-shadow: inset 0 -2px #E1E1E1;
}
.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
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
.menu{
border:none;
border:0px;
margin:0px;
padding:0px;
font-size:15px;
font-weight:bold;
position:relative;
bottom:150px;
right:100px;
list-style:none;
font-family: 'Jua', sans-serif;

}

.menu ul{
background:#ffffff;
height:50px;
list-style:none;
margin:0;
padding-left:350px;
font-family: 'Jua', sans-serif;
}

.menu li{
float:left;
width:12%;
padding:0px;
}

.menu li a{
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

.menu li a:hover, .menu ul li:hover a{
background:#ffffff;
color:#000000;
text-decoration:none;
}

.menu li ul{
background: #ffffff;
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}

.menu li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menu li li {
background:#FCFCFC;
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.menu li:hover li a{
background:none;
}
#cus{
	position:relative;
	bottom:42px;
	left:1350px;
}
.menu li ul a{
display:block;
height:50px;
font-size:16px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menu li ul a:hover, .menubar li ul li:hover a{
background:#D8D8D8;
border:0px;
color:#ffffff;
text-decoration:none;
}

.menu p{
clear:left;
}
footer{

	width:100%;
	height:21%;
	background-color:gray;
	text-align:center;
	color:white;
	overflow:hidden;
	margin-top:100px;
}

.pro{
	font-family: 'Jua', sans-serif;
	width:55%;
	margin:auto;
	position:relative;
	left:30px;
	bottom:50px;
}

.td{
	vertical-align:top;
	width:700px;
	padding-left:30px;
}

.product{
	width:600px;

}

.cate{
	position:relative;
	left:470px;
	bottom:50px;
	font-family: 'Jua', sans-serif;
}

.slim{
	font-weight:100;
	opacity:0.8;
}

.select{
	width:80%;
	height:30px;
}

.content{
	font-family: 'Jua', sans-serif;
	width:55%;
	margin:auto;

}

.move {
   position: relative;
   left:40px;
   vertical-align: top;
   width: 25%;
   height: 50px;
   padding: 0;
   font-size: 22px;
   color: black;
   text-align: center;
   background: #E1E1E1;
   cursor: pointer;
   margin-left:-6px;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}
.explanation{
	position:relative;
	left:35px;
}
.price{
	width:70%;
	border: 1px solid #444444;
}
.th{
	text-align:center;
	border: 1px solid #444444;
	width:25%;
}

.td1{
	height:150px;
	text-align:center;
	border: 1px solid #444444;
}


</style>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- 클릭시 스크롤을 이동하게 해주는 스크립트  -->
<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>


</head>
<body>
<%
int num = 1;
if(request.getParameter("num")!=null){
	num = Integer.parseInt(request.getParameter("num"));	
}
%>
<%
		String userID = null;
		if (session.getAttribute("userID")!= null){
			userID = (String) session.getAttribute("userID");
		}
		if(request.getParameter("num")!=null){
			num = Integer.parseInt(request.getParameter("num"));
		}
		if(num == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'productlist.jsp'");
			script.println("</script>");
		}
		Bdto man = new BDao().getBdto(num);
	%>
<div>

<c:if test="${id eq 'admin'}">
<a href="deleteAction.jsp?num=<%=num %>"><input type="button" onclick="delecteAction.jsp?num=<%=num %>" class="btn btn-info pull-right" style="position:relative; right:460px;font-family: 'Jua', sans-serif;" value="글삭제"></a>
</c:if>
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
<table class="pro">
	<tr>
		<td><img alt="1" src="upload/<%= man.getMainimg()%>" class="product"></td>
		<td class="td">
			<h2><%=man.getTitle() %></h2><br><br>
			<h3><%=man.getPrice() %></h3>
			<h4 class="slim">간판, 실사 디자인 일반 디자인 1종<br><br>원본 파일 제공, 고해상도 파일 제공, 상업적 이용 가능</h4><br><br>
			<select name="select" class="select">
    			<option value="">종류 선택</option>
    			<option value="STANDARD">STANDARD - +50,000원</option>
    			<option value="DELUXE">DELUXE - +100,000원</option>
    			<option value="PREMIUM">PREMIUM - +150,000원</option>
			</select>
			<h4 class="slim">작업일:2일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp수정횟수:3회</h4><br><br><br>
			<input type="button" value="구매" class="signUpButton">
		</td>
	</tr>
</table>



<div class="content">
	<input type="button" value="서비스 설명" class="move" onclick="fnMove('1')">
	<input type="button" value="가격 정보" class="move" onclick="fnMove('2')">
	<input type="button" value="취소 및 환불규정" class="move" onclick="fnMove('3')">
	<input type="button" value="서비스평가" class="move" onclick="fnMove('4')"><br>
	<div class="explanation">
		<h4 id="div1">서비스 설명</h4><br><br><br>
		<h4><%=man.getContent() %></h4>
		<h4 id="div2">가격정보</h4><br>
		<table class="price">
			<tr>
			
			
			
			
			
				<td><%=man.getPi() %></td>
			</tr>
		</table>
		<br><br><br><br>
		<h3 id="div3">취소 및 환불 규정</h3><br><br>
		<h4>01. 전문가와 의뢰인 간의 상호 협의 후 청약철회가 가능합니다.<br><br>
		02. 전문가의 귀책사유로 디자인작업을 시작하지 않았거나 혹은 이에 준하는 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.<br>	<br>
		03. 전문가가 작업 기간 동안 지정된 서비스를 제공하지 못할 것이 확실한 경우 지급받은 서비스 비용을 일할 계산하여 작업물 개수와 작업 기간 일수만큼 공제하고 잔여 금액을 환불합니다.<br><br>
		04. 서비스 받은 항목을 공제하여 환불하며, 공제 비용은 정가 처리됩니다.<br><br>
		가. 소비자 피해 보상 규정에 의거하여 작업물 원본의 멸실 및 작업 기간 미이행 및 이에 상응하는 전문가 책임으로 인한 피해 발생 시, 전액 환불<br><br>
		나. 시안 작업 진행된 상품 차감 환불<br><br>
		ⓐ. '디자인'에 대한 금액이 서비스 내 별도 기재가 되지 않았거나, 디자인 상품 패키지 내 수정 횟수가 1회(1회 포함) 이상인 서비스 상품의 시안 or 샘플이 제공된 경우<br><br>
		→ 구매금액의 10% 환불(디자인 비용이 별도 기재되어 있는 경우, 해당금액 차감 후 환불)<br><br>
		※ 시안 제공 및 수정이 추가로 이뤄진 경우 환불 금액내 수정 횟수에 따라 분할하여 환불.<br><br>

		05. 주문 제작 상품 등 서비스 받은 항목이 없으며, 결제 후 1일 이내 작업이 진행되기 전 시점은 전액 환불 가능.<br><br>

		06. 다만, 환불이 불가능한 서비스에 대한 사실을 표시사항에 포함한 경우에는 의뢰인의 환불요청이 제한될 수 있습니다.<br><br>
		가. 고객의 요청에 따라 개별적으로 주문 제작되는 재판매가 불가능한 경우(인쇄, 이니셜 각인, 사이즈 맞춤 등)<br><br>
		ⓐ. 주문 제작 상품 특성상 제작(인쇄 등) 진행된 경우.<br><br>		
		ⓑ. 인쇄 색상의 차이 : 모니터의 종류에 따라 색상의 차이가 발생하며,인쇄 시마다 합판 인쇄 방법의 특성상 색상 표현의 오차가 발생함.<br><br>
		ⓒ. 디자인 서비스이며 수정 횟수가 존재하지 않았던 상품일 경우 시안 수령 후 환불 불가</h4><br><br><br><br>
		<h3 id="div4">서비스 평가</h3>
		<form action="commentaction.jsp" method="post">
			<tr>
			<td>작성자명:<input type="text" name="writer" class="signUpInput">&nbsp&nbsp</td>
			<td>내용:<input type="text" name="contents" class="signUpInput">&nbsp&nbsp</td>
			<td>별점:<input type="text" name="starpoint" class="signUpInput">&nbsp&nbsp</td>
			<td><input type="submit" value="작성" class="writeButton"></td>
			<td><input type="hidden" name="division" value="<%=num %>"></td>
			</tr>
		</form>
			<%
				commentDao com = new commentDao();
				ArrayList<commentDto> list = com.getList(num);
				for(int i = 0; i < list.size(); i++){
			%>
			<table>
				<tr>
					<td>작성자:<%=list.get(i).getWriter() %>&nbsp&nbsp&nbsp&nbsp</td>
					<td>내용:<%=list.get(i).getContents() %>.&nbsp&nbsp&nbsp&nbsp</td>
					<td>별점:<%=list.get(i).getStarpoint()%> &nbsp&nbsp&nbsp&nbsp
						
    					
						
					</td>&nbsp&nbsp&nbsp&nbsp
					<td><input type="button" onclick="" value="댓글달기" class="writeButton"></intput>
				</tr>
			</table>
			
			<%
			} 
			%>
			
	</div>
	
	
	
	
</div>

<footer>
	<div class="foo_div">
		<span>맨파</span> <span>/</span>
		<span>대표:홍길동</span> <span>/</span>
		<span>사업자 등록번호:010-000-0000</span>
		<p>대한민국 어딘가</p>
	</div>
</footer>

<%
			if(userID != null && userID.equals(man.getNum())){
				
			
		%>
			<a href="update.jsp?num=<%=num %>">수정</a>
			<a href="delecteAction.jsp?num=<%=num %>">삭제</a>
		<%
			}
		%>
</body>
</html>