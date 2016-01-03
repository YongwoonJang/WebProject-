<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp"%>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	ResultSet rs = null;

	Vector v_name = new Vector();
	Vector v_email = new Vector();
	Vector v_homepage = new Vector();
	Vector v_subject = new Vector();
	Vector v_memo = new Vector();
	Vector v_hits = new Vector();

	String aid = request.getParameter( "str_aid" );

	aid = new String(aid.getBytes("8859_1"),"UTF-8");
	
	String sql_a = "select dbname, ifnull(dbemail,' '), ifnull(dbhomepage,' '), dbsubject, dbmemo, dbhits from boardcontext where aid=" + aid;
	
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql_a);
		if(rs.next()){
			v_name.addElement( rs.getString(1) );
		    v_email.addElement( rs.getString(2) );
		    v_homepage.addElement( rs.getString(3) );
		    v_subject.addElement( rs.getString(4) );
		    v_memo.addElement( rs.getString(5) );
		    v_hits.addElement( rs.getString(6));
		}
	   rs.close();
	   stmt.close();
	   conn.close();
	}catch(Exception e){
		out.println(e.toString());
		return;
	}
%>

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
	
<title>수강신청 및 상담</title>
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
	<br><br><br><br>
	
	 <!-- Form -->
	<div class="panel panel-danger" style="width:80%; margin:0 auto">
		<form name=w action="modifyboard_insert.jsp" accept-charset="UTF-8" style="width:80%; margin:0 auto">
			<div class="form-group" >
				<label >제목</label>
				<input class="form-control" name=dbsubject value="<%=v_subject.elementAt(0)%>">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name=dbmemo rows="10"><%=v_memo.elementAt(0)%></textarea>			
			</div>
			<div class="form-group">
				<label>작성자명</label>
				<input type=text class="form-control" name=dbname value="<%=v_name.elementAt(0)%>">
			</div>
			<div class="form-group">
				<label>이메일 주소</label>
				<input type="text" class="form-control" name=dbemail value="<%=v_email.elementAt(0)%>">			
			</div>
			<div class="form-group">
				<label>홈페이지</label>
				<input type=text class="form-control" name=dbhomepage value="<%=v_homepage.elementAt(0)%>">
			</div> 
			<input type=hidden name=str_aid value="<%=aid %>">
		</form>	
	</div>
	<br>
		  
	<!-- button -->
	<div style="width:90.5%">
		<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="window.location='lectureRegComm.jsp'">이전 페이지</button>
		<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="javascript:writeCheck();">수정</button>
	</div>

	<script language="javascript">
		function writeCheck() {
		
			var form = document.w;
			
			if(!form.dbsubject.value){
				alert( "제목을 적어주세요" );
				form.dbsubject.focus();
		    	return;
		   	}
			
			if( !form.dbmemo.value ){
		    	alert( "내용을 적어주세요" );
		    	form.dbmemo.focus();
		    	return;
		   	}
		   	
		   	form.submit();
		}
	</script> 
	
</body>
</html>