<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	ResultSet rs = null;
	
	Vector<String> v_articleid = new Vector<String>(); // article id 글 번호
	Vector<String> v_name = new Vector<String>();
	Vector<String> v_email = new Vector<String>();
	Vector<String> v_homepage = new Vector<String>();
	Vector<String> v_subject = new Vector<String>(); // String 문자열 저장
	Vector v_memo = new Vector();
	Vector<String> v_date = new Vector<String>();  // Vector 런타임 크기 변경 O, 메모리 허용 범위
	Vector<String> v_hits = new Vector<String>();  // Vector 객체 저장
	Vector<String> v_rid = new Vector<String>();
	int hits = 0;
	int aid = 0;
	
	String str_aid = request.getParameter("str_aid");
	String str_c_page = request.getParameter("str_c_page");
	String sql = "select ";
	sql += "dbname, ifnull(dbemail,''), ifnull(dbhomepage,''),dbsubject,dbmemo,dbhits ";
	sql += "from boardcontext where aid=" + str_aid;
	
	try{
		stmt=conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next())
		{
			v_name.addElement(rs.getString(1));
			v_email.addElement(rs.getString(2));
			v_homepage.addElement(rs.getString(3));
			v_subject.addElement(rs.getString(4));
			v_memo.addElement(rs.getString(5));
			v_hits.addElement(rs.getString(6));
		
		}
		
		hits = Integer.parseInt( v_hits.elementAt(0).toString() );
		aid = Integer.parseInt( str_aid );
		hits++;
		 
		sql = "update boardcontext set dbhits=" + hits + " where aid=" + aid;
		stmt.executeUpdate( sql );
		rs.close();
		stmt.close();
		
	}catch(Exception e){
		out.println(e.toString());
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

<title>내용 보기</title>
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
	<br><br><br><br>
	
	<div class="panel panel-danger" style="width:80%; margin:0 auto">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><%=v_subject.elementAt(0)%></div>
	  <div class="panel-body">
	    <p><%=v_memo.elementAt(0)%></p>
	  </div>
	
	  <!-- Context table -->
	  <table class="table">
	    <tr><td><b>조회수</b></td><td><%=hits%></td><td><b>작성자 </b></td><td><%=v_name.elementAt(0)%></td></tr>
		<tr><td><b>이메일 </b></td><td><%=v_email.elementAt(0)%></td><td><b>홈페이지 </b></td><td><%=v_homepage.elementAt(0)%></td></tr>
	  </table>
	</div>
	<br>
	
	<!-- button -->
	<div style="width:90.5%">
	<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="window.location='lectureRegComm.jsp'">이전 페이지</button>
	<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="javascript:boarddelete();">삭제</button>
	<button class="btn btn-danger pull-right" style="margin-right:10px" OnClick="javascript:boardmodify();">수정</button>
	</div>	
	
</body>

<script>
	function boarddelete(){
		location.href="checkpassworddelete.jsp?str_aid=<%=aid%>";
	}
	function boardmodify(){
		location.href="checkPassword.jsp?str_aid=<%=aid%>";
	}
</script>

</html>
