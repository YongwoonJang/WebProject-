<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*"%>
<%@ page import="java.io.*, java.text.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<title>게시판 글쓰기</title>

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
	<br><br><br><br><br><br>

	<form name=writeform action="board_write_insert.jsp" accept-charset="UTF-8" style="width:80%; margin:0 auto">

 		<div class="form-group" >
			<label >제목</label>
			<input class="form-control" name=dbsubject placeholder="제목">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" name=dbmemo rows="10" placeholder="내용을 적으세요"></textarea>			
		</div>
		<div class="form-group">
			<label>작성자명</label>
			<input type=text class="form-control" name=dbname placeholder="작성자명">
		</div>
		<div class="form-group">
			<label>이메일 주소</label>
			<input type="text" class="form-control" name=dbemail placeholder="이메일 주소">			
		</div>
		<div class="form-group">
			<label>홈페이지</label>
			<input type=text class="form-control" name=dbhomepage placeholder="Homepage">
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input type=text class="form-control" name=dbpassword placeholder="초기값 : 0000" value="0000">
		</div>
 	
 	</form>
 		
	<!-- button div -->
	<div style="width:90%">
	<button class="btn btn-danger pull-right" OnClick="javascript:writeCheck()">등록 하기</button>
	<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="window.location='lectureRegComm.jsp'">이전 페이지</button>
	</div>	
	
	<script language = "javascript">
		function writeCheck(){
			
			var form = document.writeform;
			
			if(!form.dbname.value){
				alert("이름을 적어주세요" + form.dbname.value +"...");
				form.dbname.focus();
				return;
			}
			
			if(!form.dbsubject.value ){
			    alert( "제목을 적어주세요" );
			    form.dbsubject.focus();
			    return;
		    }
		
			if(!form.dbmemo.value ){
			    alert( "내용을 적어주세요" );
			    form.dbmemo.focus();
			    return;
			}
		
			if(!form.dbemail.value ){
			    alert( "이메일을 적어주세요" );
			    form.dbemail.focus();
			    return;
			}
		
			if(form.dbemail.value.indexOf("@")== -1){
			    alert( "정확한 이메일을 적어주세요" );
			    form.dbemail.focus();
			    return;
			}
		
			if(!form.dbhomepage.value )
			{
			    alert( "홈페이지를 적어주세요" );
			    form.dbhomepage.focus();
			    return;
			}
			form.submit();
		}
	</script>
</body>
</html>
