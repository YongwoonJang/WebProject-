<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp"%>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	
	String dbname = request.getParameter("dbname");
	String dbemail = request.getParameter("dbemail");
	String dbhomepage = request.getParameter("dbhomepage");
	String dbsubject = request.getParameter("dbsubject");
	String dbmemo = request.getParameter("dbmemo");
	String dbpassword = request.getParameter("dbpassword");

	dbname = new String(dbname.getBytes("8859_1"),"UTF-8");
	dbemail = new String(dbemail.getBytes("8859_1"),"UTF-8");
	dbhomepage = new String(dbhomepage.getBytes("8859_1"),"UTF-8");
	dbsubject = new String(dbsubject.getBytes("8859_1"),"UTF-8");
	dbmemo = new String(dbmemo.getBytes("8859_1"),"UTF-8");
	dbpassword = new String(dbpassword.getBytes("8859_1"),"UTF-8");
	
	try{
		
		stmt = conn.createStatement();  // 커넥션 개체로 부터 Statement 생성 핸들러 연결
		String seq = "select max(aid) from boardcontext";  // 쿼리문
		ResultSet rs = stmt.executeQuery( seq );  // 쿼리문 명령 실행, 리턴값은 처리항 행의 갯수 ResultSet 에 결과 저장
	
		int aid = -1;
		if(rs.next())
			aid=rs.getInt(1);
		aid ++;
		
		 String sql = "";
		 sql += "insert into boardcontext values( ";
		 sql +=     aid;
		 sql +=     ", ";
		 sql +=     aid;
		 sql +=     ", '";
		 sql +=     dbsubject;
		 sql +=     "', '";
		 sql +=     dbname;
		 sql +=     "', now(), '";
		 sql +=     dbemail;
		 sql +=     "', '";
		 sql +=     dbhomepage;
		 sql +=     "', 0, '";
		 sql +=     dbmemo;
		 sql +=     "', '";
		 sql +=     dbpassword;
		 sql +=     "')";
		 
		 //out.print(sql);
		 stmt.executeUpdate(sql);
		 stmt.close();
		 
	}catch(Exception e){
		
		out.println(e.toString());
	}
	

%>

<html>
 <head>
 <script>
  self.window.alert("입력한 글을 저장하였습니다.");
  location.href="lectureRegComm.jsp";
 </script>
 </head>
 <body>
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


