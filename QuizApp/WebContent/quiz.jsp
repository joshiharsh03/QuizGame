<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz</title>
</head>
<body>
<%
int c=1;
//this category variable holds the level of questions i.e. come from previous
	String category=request.getParameter("category");

//created object of DAO class
		DAO dao=new DAO();
		ArrayList<HashMap> questions=dao.getQuestion(category);
		%>
		<form action="result.jsp" method="post">
		<input type="hidden" name="type" value="<%=category%>"/>
		<%
		for(HashMap question:questions){
			%>
			Q.<%=c %><%=question.get("question") %><br>
			<input type="hidden" name="qno<%=c %>" value="<%=question.get("qno") %>"/>
			<input type="radio" name="q<%=c %>" value="option1" required/><%=question.get("option1") %><br>
			<input type="radio" name="q<%=c %>" value="option2" required/><%=question.get("option2") %> <br>
			<input type="radio" name="q<%=c %>" value="option3" required/><%=question.get("option3") %><br>
			<input type="radio" name="q<%=c %>" value="option4" required/><%=question.get("option4") %> <br><br>
			<%c++; %>
			<%
		}
	%>
	<input type="hidden" name="count" value="<%=c %>"/>
	<button type="submit">Submit</button>
	</form>
</body>
</html>