<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>

<%! 
Connection DB_Connection() throws ClassNotFoundException, SQLException, Exception
{
	String url = "jdbc:mysql://localhost:3306/jyy3k";
    String id = "jyy3k";
    String pwd ="aortlzh3";
   
    try{
        //[1] JDBC 드라이버 로드
        Class.forName("com.mysql.jdbc.Driver");
       						
    }catch(Exception e){
        e.printStackTrace();
    }
    
    //[2]데이타베이스 연결 
    Connection conn = DriverManager.getConnection(url,id,pwd);
     
	return conn;
}

String TO_DB(String str) throws Exception
{
	if(str == null)
		return null;
	return new String(str.getBytes("8859_1"), "UTF-8");
}
%>
