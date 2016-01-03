<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>전화 중국어 하오 차이나</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<style>
		.imageFrame{
			width:35%; 
			height:35%;
			padding:10px 10px 10px 10px;
			position:fixed; 
			top:30%;
			left:0px;
			right:0px;
			margin:0px auto;
			border:2px solid rgb(100,100,100); 
		}
		.gallery{
			width:95%;
			height:95%;
			position:absolute;
			margin:0px auto;
			border:2px solid rgb(100,100,100); 
		}
		.mainScreen{
			background-color:rgb(230,230,230); 
			width: 100%; 
			height: 100%; 
			text-align:center; 
			position:relatvie; 
			top:0; 
			left:0
		}
			
	</style>

</head>

<body>
	<!-- navigation bar -->
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-left">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="HelloWorld.jsp">하오차이나 전화 중국어</a>
	    </div>
	    <div>
	      <ul class="nav navbar-nav">
	        
	        <li class="active dropdown">
	        	<a href="ownerprofile.jsp" class="dropdown-toggle">Home</a>
		          <ul class="dropdown-menu">
		            <li><a href="ownerprofile.jsp">원장 약력</a></li>
		          </ul>
	        </li>
	        
	        <li><a href="Teacher Introduction.jsp">선생님 소개</a></li>
	        <li><a href="Lecture Philosophy.jsp">하오차이나 수업철학</a></li> 
	        <li><a href="Lecture Program.jsp">수강 프로그램</a></li> 
	        <li><a href="lectureRegComm.jsp">수강 후기</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>	
	<br><br>

	<!-- Main screen -->
	<div class="mainScreen">
	    <br><br><br><br>
	    <h1>하오차이나 전화중국어</h1>
	    <h2 style="color:rgb(255,0,0);">Hao China</h2> 
	    <br>
	    <!-- imageSlider -->	
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:30%; margin:0 auto">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
			  <div class="item active">
			    <img src="img/haochina_2.png" alt="Chania">
			  </div>
			  <div class="item">
			    <img src="img/haochina_1.jpg" alt="Chania">
			  </div>
			  <div class="item">
			    <img src="img/haochina_1.jpg" alt="Chania">
			  </div>
			  <div class="item">
			    <img src="img/haochina_1.jpg" alt="Chania">
			  </div>
			  
			</div>
		
		<!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	    <br><br>	    
	</div>
	<br>
	
	
	
	<!-- Bender Information -->
	<p>사업자등록번호 : 168-09-00110 대표자 : 김남훈 Copyright (c) 2015 하오차이나 전화중국어 Reserved.</p> 
	
	<!-- tool tip -->
	<br>
	<a href="https://www.facebook.com/fastsbird86"title="Facebook 접속하기">
		        <button type="button" class="btn btn-default btn-sm">
		        <span class="glyphicon glyphicon-user"></span> Facebook 
		        </button>
	</a>
		
	<a href="https://twitter.com/twitter" title="원장님 twitter">
			    <button type="button" class="btn btn-default btn-sm">
		        <span class="glyphicon glyphicon-thumbs-up"></span> twitter
		        </button>
	</a>
 	
 	<script>
 	$(document).ready(function() {
 	    $('.nav li.dropdown').hover(function() {
 	        $('.dropdown-menu').fadeIn(700);
 	    }, function() {
 	        $('.dropdown-menu').fadeOut(700);
 	    });
 	});
 	</script>
 	
</body>
</html>