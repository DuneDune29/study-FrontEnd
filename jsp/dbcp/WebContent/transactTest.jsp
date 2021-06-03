<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% // transactTest.jsp 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="insert into student (num, name) values (11, '홍길동')";
	String sql2="select * from student where num = 10";
	
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/MariaDB");
		conn = ds.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		if(!rs.next()) {
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백~</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입 완료.</h3>");
		}
		pstmt.close();
		conn.setAutoCommit(true);
	} catch (Exception e) {
		out.println("<h3>데이터 삽입 실패.</h3>");
		e.printStackTrace();
	}
%>