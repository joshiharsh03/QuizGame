<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
<%
//created DAO object for executing query
	DAO dao=new DAO();
	int result=0;
	int a=1;
	//get value of type
	String type=request.getParameter("type");
	ArrayList<HashMap> questions=dao.getQuestion(type);
	int c=Integer.parseInt(request.getParameter("count"));
	for(int i=1;i<c;i++){
		//it get value of question id
		String qno=request.getParameter("qno"+i);
		
		//converting the string into int type
		int ques=Integer.parseInt(qno);
		
		//get the value of answer chosen by user for result
		String ans=request.getParameter("q"+i);
		
		//get the corect answer from database
		String correctAnswer=dao.getAnswer(type, ques);
				
		//checking answer is correct or not
		if(ans.equalsIgnoreCase(correctAnswer)){
			result++;
		}
		
	}
	//displaying result according to correct answers
	if(result<=1){
	%>
	Performance: Poor (<%=result %>)
	<%
	}
	if(result==2){
	%>
	Performance: Bad( <%=result %>)
	<%}
	if(result==3){
	%>
	Performance: Good( <%=result %>)
	<%}
	if(result==4){
	%>
	Performance: Strong( <%=result %>)
	<%}
	if(result==5){
	%>
	<b>Performance: Very Strong( <%=result %>)</b>
	<%} 
	%><br><br><hr>
	All Questions & Answers:<br><br>
	<%
	//Display all questions and their answers
	for(HashMap question:questions){
		%>
		Q.<%=a %> <%=question.get("question") %><br>
		Option 1: <%=question.get("option1") %><br>
		Option 2: <%=question.get("option2") %> <br>
		Option 3: <%=question.get("option3") %><br>
		Option 4: <%=question.get("option4") %> <br>
		<b>Answer: <%=question.get("ans") %></b> <br>
		<br>
		<%a++; %>
		<%
	}
	%>

</body>
</html>