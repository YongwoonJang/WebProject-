<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
Connection conn = DB_Connection();
Statement stmt = null;
ResultSet rs = null;

Vector<String> v_articleid = new Vector<String>(); // article id 글 번호
Vector<String> v_name = new Vector<String>();  // String 배열 크기 한정. 런타임 크기 변경 X, 크기 증가 가능
Vector<String> v_subject = new Vector<String>(); // String 문자열 저장
Vector<String> v_date = new Vector<String>();  // Vector 런타임 크기 변경 O, 메모리 허용 범위
Vector<String> v_hits = new Vector<String>();  // Vector 객체 저장
Vector v_memo = new Vector();
Vector<String> v_rid = new Vector<String>();

String str_c_page = request.getParameter( "str_c_page" );  
if( str_c_page == null ) 
	str_c_page = "1";
int c_page = Integer.parseInt( str_c_page );	
	
int total_cnt = 0;
int list_num = 10;
int start, end = 0;
int t_page = 0;

String dbsearch = request.getParameter("dbsearch");
if(dbsearch == null || dbsearch.trim().length()==0)
		dbsearch ="%";

try{
	String sql_n = "select count(*) from boardcontext";
	sql_n += " where upper(dbsubject) like upper('%" + dbsearch + "%')";
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql_n);
	
	if(rs.next())
		total_cnt = rs.getInt(1);
	
 
	start = (c_page-1)*list_num;
	end = 10*c_page;
		 
	String sql_c="";
	
	sql_c += "select aid, dbname, dbsubject, DATE_FORMAT(dbdate, '%Y-%m-%d') AS dd, dbhits, dbmemo from (";
	sql_c += "select * from ( ";
	sql_c += "select * from boardcontext order by rid asc ) as A ";
	sql_c += "where upper(dbsubject) like upper('%" + dbsearch + "%') ) as B ";
	sql_c += "limit "+ start +", "+ end;
	
	rs = stmt.executeQuery( sql_c );
	int title_len = 100;
	int aid = start;
	
	while( rs.next() ){
		v_articleid.addElement( Integer.toString( rs.getInt(1) ) );
	    v_name.addElement( rs.getString(2) );
	    v_subject.addElement( rs.getString(3) );
	    v_date.addElement( rs.getString(4) );
	    v_hits.addElement( Integer.toString( rs.getInt(5) ) );
	    StringBuffer buf = new StringBuffer( rs.getString(6) );
	
	    if( buf.length() > title_len ){
		    buf.setLength( title_len ); 
		    v_memo.addElement( buf + "..." );
	    }else{
	     	v_memo.addElement( buf );
	   		aid--;
	   	}
	
	}
		stmt.close();
		rs.close();
}catch(Exception e){
		out.println(e.toString());
}

%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>수강 신청 및 상담</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<style>
			
			#search{
				width:70%;
				height:30px;
				vertical-align:middle;
				margin-right:10px;
			}
			
			#boardcss_list_search{
				width:80%;
				margin:0 auto;
				padding:10px 10px 10px 10px;
				margin-top:50px;
			}
			
			.write_button{
				width:80%;
				margin:0 auto;
			}
			
			<!-- list information table -->
			.boardcss_list_table{
				width:100%;
			}
			
			.list_table{
				width:80%;
				margin:0 auto;
			}
				
			.list_table tbody td{
				padding:5px 0;
				text-align:center;
				border-bottom: 1px solid rgb(100,100,100);
				
			}
			
			<!-- page number table -->
			.boardcss_page_table{
				width:100%;
				margin: 10px 10px 10px 10px;
			}
			
			.page_table{
				width: 80%;
				margin: 0 auto;	
				cellspacing: 1;
				border: 0;
			}
				
		</style>
	</head>

	<body>
		<div style="width:100%">
		
				<!-- navigation bar -->
				<nav class="navbar navbar-inverse navbar-fixed-top navbar-left">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <a class="navbar-brand" href="HelloWorld.jsp">하오차이나 전화 중국어</a>
				    </div>
				    <div>
				      <ul class="nav navbar-nav">
				        <li class="active"><a href="http://haochina.or.kr">Home</a></li>
				        <li><a href="Teacher Introduction.jsp">선생님 소개</a></li>
				        <li><a href="Lecture Philosophy.jsp">하오차이나 수업철학</a></li> 
				        <li><a href="Lecture Program.jsp">수강 프로그램</a></li> 
				        <li><a href="lectureRegComm.jsp">수강 후기</a></li>
				      </ul>
				    </div>
				  </div>
				</nav>	
				<br><br><br><br><br><br>	
				
				<!-- context table -->
				<div class="boardcss_list_table">
					<table class="list_table">
						<colgroup>
							<col width=20%/>
							<col width=20%/>
							<col width=20%/>
							<col width=20%/>
							<col width=20%/>
						</colgroup>
						<thead>
							<tr>
								<th style="text-align:center">번호</th>
								<th style="text-align:center">제목</th>
								<th style="text-align:center">작성자</th>
								<th style="text-align:center">등록일자</th>
								<th style="text-align:center">조회수</th>
							</tr>
						</thead>
						
				   		<tr height="1" bgcolor=rgb(80,80,80)><td colspan="5"></td></tr>
						
						<tbody>
							<%
							for(int i=0;i<v_articleid.size();i++)
							{
							%>
							
							<tr>
								<td width=50><p align=center><%=i+1%></p></td>
								<td width=100><p align=center><a href="board_view.jsp?str_aid=<%=v_articleid.elementAt(i)%>"><%=v_subject.elementAt(i)%></a></p></td>
								<td width=320><p align=center><%=v_name.elementAt(i)%></p></td>
								<td width=100><p align=center><%=v_date.elementAt(i)%></p></td>
								<td width=100><p align=center><%=v_hits.elementAt(i)%></p></td>
							</tr>
							
							<%
							}
							%>
						</tbody>
					</table>
				</div>
				
				<!-- page algorithm -->
				<%
				if((total_cnt%list_num)==0)
					t_page = total_cnt / list_num;
				else
					t_page = (total_cnt / list_num) + 1;
				
				int block_num = 5;
				int t_block = t_page / block_num;
				if(t_page % block_num !=0)
					t_block++;
				
				int c_block = c_page / block_num;
				
				if(c_page % block_num != 0)
					c_block++;
				%>
				
				<!--  page print -->
				<div class = "boardcss_page_table">
					<table class="page_table">
						<tr>
							<td style="text-align:center">
								<%
								for( int i=(c_block-1)*block_num+1; i<=c_block*block_num && i<=t_page; i++ ) 
								{ 
								%>
								
								<a href="lectureRegComm.jsp?str_c_page=<%=i%>">
								<% 
								if( c_page == i ) 
									out.print( "<b>" );
								%>
								[<%=i%>]</a>
								<% 
								if( c_page == i ) 
								out.print( "</b>" );
								}
								%>
							</td>
						</tr>
					</table>				
				</div>
				
				<!-- WRITE BUTTON -->
				<div class = "write_button">
					
				</div>
				
				<!-- search tab -->
				<div id="boardcss_list_search">
					<table style="margin:0 auto; width:500px">
						<tr>
							<td>
		    					<form action="lectureRegComm.jsp" accept-charset="UTF-8">
			    					<p align="center">
				    					<input id="search" type=text name=dbsearch size=50  maxlength=50 value="">
				    					<input type=submit class="btn btn-danger" value="검색">
				    					<input type=button class="btn btn-danger btn pull-right" onclick="window.location='board_write.jsp'" value="글쓰기"> 
		    						</p>
	    						</form>
	    					</td>
						</tr>
					</table>
				</div>
		</div>
	</body>
</html>
