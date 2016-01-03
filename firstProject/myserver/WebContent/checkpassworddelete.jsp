<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%@ page import="java.io.*, java.text.*" %>
<%@ include file="DBConnection.jsp"%>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	ResultSet rs = null;

	Vector v_password = new Vector();

	int aid = Integer.parseInt(request.getParameter( "str_aid" ));
	
	String sql_a = "select pass from boardcontext where aid=" + aid;
	
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql_a);
		if(rs.next()){
			v_password.addElement( rs.getString(1) );
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
	
	<title>암호 확인</title>
	
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

	<!-- Data 전달 -->
	<form name=writeform action="deleteBoard.jsp" accept-charset="UTF-8" style="width:80%; margin:0 auto">
			
			<div class="form-group" >
			<label>암호</label>
			<input type=text class="form-control" name=contraryPassword>
			<input type=hidden name=str_aid value= "<%=aid%>">
			</div>
		
 	</form>
 		
	<!-- button div -->
	<div style="width:90%">
		<button class="btn btn-danger pull-right" OnClick="javascript:writeCheck()">확인</button>
		<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="window.location='lectureRegComm.jsp'">이전 페이지</button>
	</div>	

</body>

<script language = "javascript">
		function writeCheck(){
			
			var password = "<%=v_password.elementAt(0)%>";
			var form = document.writeform;
			
			if(password != form.contraryPassword.value){
				alert("비밀번호가 맞지 않습니다.");
				form.dbname.focus();
				return;
			}
			form.submit();
		}
</script>

</html>