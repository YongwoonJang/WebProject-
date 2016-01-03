<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>원장 약력</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
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
	        	<a href="ownerprofile.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Home</a>
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
	<br><br><br><br><br>
	
	<div style = "text-indent:10pt; line-height:40pt; width:60%; margin: 0 auto;">
		<table class="table" width:100%">
		    <thead>
		        <tr>
		            <th colspan="2">기본정보</th>
		        </tr>
		
		    </thead>
		    <tbody>
		    	<tr>
		    		<td rowspan="2" style="width:20%"><img src="img/Apple.png"></td>
		    		<td style="width:80%"><p>김남훈</p></td>
		    	</tr>
		    	<tr>
		    		<td><p>010 - 7300 - 7707 / fastbird:카카오톡</p></td>
		    	</tr>
		    </tbody>
		</table>
		<br>
		
		<table class="table" width:100%">
		    <thead>
		        <tr class="danger">
		            <th colspan="2">경력</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr>
		    		<td>2013</td>
		    		<td>서강대학교 중문과 학사</td>
		    	</tr>
		    	<tr>
		    		<td>2013</td>
		    		<td>북경사범대대외한어과정 수료</td>
		    	</tr>
		    	<tr>
		    		<td>2005</td>
		    		<td>중앙고등학교 졸</td>
		    	</tr>
		    </tbody>
		</table>
	</div>

</body>
</html>