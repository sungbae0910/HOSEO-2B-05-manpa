<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>프로잭트</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <style>
 		body{
 			display:flex;
 			align-items:flex-start;
 			justify-content:center;
 		}
 		.table{
 			diplay:flex;
 			flex-direction:row;
 		}
        .container{
        	display: flex;
            flex-direction:column;
            justify-content:center;
        }
        header{
        	display:flex;
        	flex-direction:column;
       
        }
        footer{
    	    justify-content:center;
        	display:flex;
            text-align: center;
            padding-top:20px;
            flex-direction:row;
        }
        .content{
        	flex-direction:column;
            display:flex;
        }
        .item{
       		justify-content:center;
            display:flex;
            padding-bottom:80px;
        }
        .item1{
       		justify-content:space-between;
            display:flex;
           
        }
        .item2{
       		justify-content:center;
            display:flex;
            padding-bottom:80px;
        }
        .item3{
            display:flex;
            flex-direction:column;
           
        }
        .item4{
            display:flex;
            flex-direction:column;
            padding-left:300px;
            padding-right:300px;
        }
        .content nav{
            flex-shrink:1;
            
        }
        .content aside{
            flex-shrink:1;
           
        }
   
       .content main{
            flex-shrink:1;
            padding-left:20px;
            padding-right:20px;
           
        }
        logo {
        	float:left;
        	padding-left:500px;
        }
        join {
        	display:flex;
        	float:right;
        	justify-content:center;
        }
        
    </style>

</head>
<body>
	 <div class="container">
	 	
        <header>
        
        	<div class="item1">
        		<div id="logo">
        			<img src="img/logoimg.png">
        		</div>
        		<div id="join">
        			<a href="https://www.naver.com">회원가입</a>
        			<a href="https://www.naver.com">로그인</a>
        		</div>
        	</div>
        	<div class="item2">
        		<img src="img/topimg.PNG">
        	</div>
        	<div class="select">

        	</div>
        
		</header>
	
        <section class="content">
      		<div class="item">
         	  	<nav>
          	 	    <img src="img/man1.png">      
         	   </nav>
         	  	<main>
           		    <img src="img/man2.png">
          	  </main>
      			<aside>
             	  	<img src="img/man3.png">
          	 	</aside>
            </div>
            <div class="item">
            	<nav>
          	 	    <img src="img/man1.png">      
         	   </nav>
         	  	<main>
           		    <img src="img/man2.png">
          	  </main>
      			<aside>
             	  	<img src="img/man3.png">
          	 	</aside>
            </div>
           
        </section>
        
        <footer>
        	<div class="item3">
	        	<img src="img/but1.png">
	        	<img src="img/but1.png">
	        </div>
	        <div class="item4">
           		<img src="img/but2.png">
           		<img src="img/but2.png">
           	</div>
           	<div class="item3">         
           	    <img src="img/but3.png">       
           	    <img src="img/but3.png">
           	</div>
         </footer>
        	
    </div>
</body>
</html>