<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% // selectPst.jsp 
	Connection conn = null;
	String sql="select * from student order by num";
	
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/MariaDB");
		conn = ds.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			out.println("<h3>" + rs.getInt(1) + ", "
					+ rs.getString(2) + "</h3>");
		}
		rs.close();		
	} catch(Exception e) {
		out.println("<h3>데이터 가져오기 실패.</h3>");
		e.printStackTrace();
	}
%>