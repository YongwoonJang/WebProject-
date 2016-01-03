<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp"%>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;
	ResultSet rs = null;
	stmt = conn.createStatement();
	
	String str_aid=request.getParameter("str_aid");
	int aid = Integer.parseInt(str_aid);
	String sql = "delete from boardcontext where aid=" + aid;
		
	try
	{
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}catch(Exception e){
		out.println(e.toString());
		return;
	}
	
%>

<html>
	<head>
		<script>
			self.window.alert("글을 삭제하였습니다.");
			location.href="lectureRegComm.jsp";
		</script>
	</head>
</html>