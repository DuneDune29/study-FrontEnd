<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% // insertPst.jsp
	Connection conn = null;
	String sql="insert into student values (?, '홍길동')";

try {	
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/MariaDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		for (int i = 6; i <= 10; i++) {
			pstmt.setInt(1, i);
			if (pstmt.executeUpdate() != 0) {
				out.println("<h3>" + i + "번 레코드 등록.</h3>");
			}
		}
	} catch(Exception e) {
		out.println("<h3>레코드 등록 실패.</h3>");
		e.printStackTrace();
	}
%>