<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page session="true" %>
   
<%

int total=0;

if (request.getParameter("food")==null){
	if(session.getAttribute("count")==null){
		session.setAttribute("total", 0);
	}
}
else{
if(request.getParameter("food").equals("500")){
	session.setAttribute("total", (Integer)session.getAttribute("total")+500);
	if(session.getAttribute("count")==null){
		session.setAttribute("count", 1);
	}
}
if (request.getParameter("food").equals("700")){
	session.setAttribute("total", (Integer)session.getAttribute("total")+700);	
	if(session.getAttribute("count")==null){
		session.setAttribute("count", 1);
	}
}
if(request.getParameter("food").equals("0")){
	session.setAttribute("total", 0);
	if(session.getAttribute("count")==null){
		session.setAttribute("count", 1);
	}
}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
caption { text-align: left; font-weight: bold; }
</style>
</head>
<body>
<form action ="/exam/total.jsp" method ="post">
<h1>매출 관리 시스템</h1>
<table>
<caption>총 매출 : <%= session.getAttribute("total") %> 원</caption>
<tr>
<td>짜장면(500)</td><td><input type="radio" name="food" value="500"></td>
</tr><tr>
<td>짬뽕(700)</td><td><input type="radio" name="food" value="700"></td>
</tr><tr>
<td>초기화</td><td><input type="radio" name="food" value="0"></td>
</tr>
</table>
<input type="submit" value="Submit">
</form>
</body>
</html>