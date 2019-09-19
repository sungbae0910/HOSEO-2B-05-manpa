<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%

		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>manpa</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>	
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <style>
        .container{
        	display: flex;
            flex-direction:column;
            justify-content:center;
}

        .item1{
       		justify-content:space-between;
            display:flex;
     		border-bottom:1px solid gray;
           
        }

	/*버튼이미지 교체*/
	.con img:last-child{display:none} 
	.con:hover img:first-child{display:none} 
	.con:hover img:last-child{display:inline-block}

	.desi img:last-child{display:none} 
	.desi:hover img:first-child{display:none} 
	.desi:hover img:last-child{display:inline-block}

	.docu img:last-child{display:none} 
	.docu:hover img:first-child{display:none} 
	.docu:hover img:last-child{display:inline-block}

	.it img:last-child{display:none} 
	.it:hover img:first-child{display:none} 
	.it:hover img:last-child{display:inline-block}
	
	.mar img:last-child{display:none} 
	.mar:hover img:first-child{display:none} 
	.mar:hover img:last-child{display:inline-block}

	.tran img:last-child{display:none} 
	.tran:hover img:first-child{display:none} 
	.tran:hover img:last-child{display:inline-block}
      	
 	.slide{
 		margin-top:10px;
 	}
.zeta-menu { margin: 0; padding: 0;}
.zeta-menu-bar {z-index:99999999999999999999999;   margin-top:25px;}
.zeta-menu li {
  float: right;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: #C6C6C6; } 
.zeta-menu li.expand { background: white; }
.zeta-menu li.expand>a { color: #C6C6C6; }
.zeta-menu a {
  color: black;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 105px;
  height: 80	px;
}
        
    </style>
<script>
$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
</script>
</head>
<body>
	 <div class="container">
        	<div class="item1">
        		<div id="logo">
        			<a href="main.jsp"><img src="img/logoimg.png" width="150"></a>
        		</div>

        			<div class="zeta-menu-bar">
	 				 <ul class="zeta-menu">
	 				   <li><a href="#3"><%= name %>님</a>
	 			     <ul>
				       <li><a href="#">정보수정</a></li>
				       <li><a href="logout.jsp">로그아웃</a></li>
	      			</ul>
	    			</li> 
	  				</ul>
					</div>

        	</div>
</body>
</html>
