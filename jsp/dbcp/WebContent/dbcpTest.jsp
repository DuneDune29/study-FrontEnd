<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% // dbcpTest.jsp 
	Connection conn = null;
	try {
		Context init = new InitialContext();
		Context env = (Context) init.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/MariaDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");
	} catch(Exception e) {
		out.println("<h3>연결에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
%>