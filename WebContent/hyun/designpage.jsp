<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<SCRIPT language=javascript type=text/javascript>

 var count=1; // 처음 카운트 부분 - default : 1
 // 이동되는 페이지 지정부분
 // 추가시는 link_array[X] = '페이지 경로';를
 // 원해는 갯수대로 추가하고 X에 1부터 차례대로 적여주면 됨
 // 페이지는 만드시면 됩니다.
 //링크의 주소
 var link_array = new Array();
 link_array[1] = 'designpage.jsp';
 link_array[2] = 'designpage2.jsp';
 link_array[3] = 'designpage3.jsp';
 link_array[4] = 'designpage4.jsp';
 link_array[5] = 'designpage5.jsp';
function page1(){//버튼 1을 눌렀을때 발생할 이벤트
	if (link_array.length == 1){//값이 참이면 버튼에 강조
		document.all.pg1.focus();
		
	}else{//값이 아닐경우 카운트에 1의 값을 넘겨 페이지 1번으로 이동
		count = 1;
		document.location.href = link_array[count];
	}
}
function page2(){//위와 중복
	if (link_array.length == 2){
		document.all.pg2.focus();
		
	}else{
		count = 2;
		document.location.href = link_array[count];
	}
}
function page3(){
	if (link_array.length == 3){
		document.all.pg3.focus();
		
	}else{
		count = 3;
		document.location.href = link_array[count];
	}
}
function page4(){
	if (link_array.length == 4){
		document.all.pg4.focus();
		
	}else{
		count = 4;
		document.location.href = link_array[count];
	}
}
function page5(){
	if (link_array.length == 5){
		document.all.pg5.focus();
		
	}else{
		count = 5;
		document.location.href = link_array[count];
	}
}
function next() {
 if ((count + 1) >= link_array.length) {
   // 처음 카운트 부분에 1씩 합해진값이 link_array의 길이보다 크거나 같을때
  alert('다음 페이지가 없습니다.'); // 다음 페이지가 없을시 나타내는 경고창
  document.all.prev.focus(); // prev이란 이름을 가지는 버튼에 포커스
 }else { // 원문 : That was the last page
  count = count + 1; // 처음 카운트 부분에 1씩 합해서 카운트에 대입
  // 타겟 target_example로 넘기면서 이동되는 페이지 부분의 X가 1씩 합해짐
  document.location.href = link_array[count];
 }
}
function previous() {
 if ((count - 1) <= 0) { // 처음 카운트 부분에 차해진값이 0보다 작거나 같을때
  alert('이전 페이지가 없습니다.'); // 이전 페이지가 없을시 나타내는 경고창
  document.all.next.focus(); // next이란 이름을 가지는 버튼에 포커스
 } else { // 원문 : This is the first page
  count = count - 1; // 처음 카운트 부분에 1씩 차해서 카운트에 대입
  // 타겟 target_example로 넘기면서 이동되는 페이지 부분의 X가 1씩 차해짐
  document.location.href = link_array[count];
 }
}
</SCRIPT>
	<style>
		body{
			display:flex;
			align-content:center;
			justify-content:center;
		}
        .container{
            display: flex;
            flex-direction: column;
        }
        header{
            border-bottom:1px solid skyblue;
            padding-left:20px;
        }
        footer{
            border-top:1px solid skyblue;
            padding:20px;
            text-align: center;
        }
        .content{
            display:flex;
            
        }
        .content nav{
            border-right:1px solid skyblue;
        }
        nav{
            flex-basis: 200px;
        }
        main{
        	display:flex;
            padding:10px;
            flex-direction: column;
        }
        .shop{
        	align-content:center;
        	justify-content:center;
        	display:flex;
        	padding:10px;
        }
        center{
 
        }
        .page{
        	display:flex;
        	align-content:center;
        	justify-content:center;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
			<div class="logo">
				로로로로로고고고고고고
			</div>
			<div class="list">
				<tr>
            	<td>디자인</td>
            	<td>IT*프로그래밍</td>
            	<td>콘텐츠 제작</td>
            	<td>마케팅</td>
            	<td>번역*통역</td>
            	<td>문서*취업</td>
            </tr>
			</div>
        </header>
        <section class="content">
            <nav>
                <ul>
                    <li>디자인</li>
                    <li>로고디자인</li>
                    <li>명함*인쇄물</li>
                    <li>상세페이지*배너</li>
                    <li>웹*모바일디자인</li>
                    <li>켈리그라피</li>
                </ul>
            </nav>
            
            <main>

            	<div class="shop">
            		<div class="left"><img src="img/test1.PNG"></div>
            		<div class="center"><img src="img/test1.PNG"></div>
            		<div class="right"><img src="img/test1.PNG"></div>
            	</div>
            	<div class="shop">
            		<div class="left"><img src="img/test1.PNG"></div>
            		<div class="center"><img src="img/test1.PNG"></div>
            		<div class="right"><img src="img/test1.PNG"></div>
            	</div>
            	<div class="shop">
            		<div class="left"><img src="img/test1.PNG"></div>
            		<div class="center"><img src="img/test1.PNG"></div>
            		<div class="right"><img src="img/test1.PNG"></div>
            	</div>
            	<div class="page">
            		<INPUT type="button" value="이전" name="prev" onclick="previous();">
					<INPUT type="button" value="1" name="pg1" onclick="page1();">
					<INPUT type="button" value="2" name="pg2" onclick="page2();">
					<INPUT type="button" value="3" name="pg3" onclick="page3();">
					<INPUT type="button" value="4" name="pg4" onclick="page4();">
					<INPUT type="button" value="5" name="pg5" onclick="page5();">
					<INPUT type="button" value="다음" name="next" onclick="next();">
            	</div>

            </main>
            
          
        </section>
        <footer>
            <div class="Explanation">
            	ㅆ쏼라쏼라
            </div>
        </footer>
    </div>
</body>
</html>