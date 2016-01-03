<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%@ include file="DBConnection.jsp"%>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	stmt = conn.createStatement();
	StringBuffer query = null;

	String dbsubject = request.getParameter( "dbsubject" );
	String dbmemo = request.getParameter( "dbmemo" );
  	String dbname = request.getParameter( "dbname" );
  	String dbemail = request.getParameter( "dbemail" );
  	String dbhomepage = request.getParameter( "dbhomepage" );
  	String aid = request.getParameter("str_aid");
  	
  	dbname = new String(dbname.getBytes("8859_1"),"UTF-8");
	dbemail = new String(dbemail.getBytes("8859_1"),"UTF-8");
	dbhomepage = new String(dbhomepage.getBytes("8859_1"),"UTF-8");
	dbsubject = new String(dbsubject.getBytes("8859_1"),"UTF-8");
	dbmemo = new String(dbmemo.getBytes("8859_1"),"UTF-8");
	aid = new String(aid.getBytes("8859_1"),"UTF-8");
  	
	try 
  	{
   	query = new StringBuffer();
  	query
    .append("update boardcontext set \n")
    .append("  dbsubject ='").append(dbsubject).append("', \n")
    .append("  dbmemo ='").append(dbmemo).append("', \n")
    .append("  dbname ='").append(dbname).append("', \n")
    .append("  dbemail ='").append(dbemail).append("', \n")
    .append("  dbhomepage ='").append(dbhomepage).append("' \n")
    .append("  where aid = '").append(aid).append("' \n");

 	stmt.executeUpdate( query.toString() );
 	stmt.close(); 
	conn.close();

	}catch( Exception e ) {
	out.println( e.toString() );
	return;
	}
 %>

<html>
<head>
	<script>
		self.window.alert("입력한 글을 수정하였습니다.");
		location.href="lectureRegComm.jsp";
	</script>
</head>
</html>

