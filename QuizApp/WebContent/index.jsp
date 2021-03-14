<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz App</title>
</head>
<body>

<form action="quiz.jsp">
<!-- choose type for level of questions and this form call quiz.jsp page for further action -->
Choose Type: <select name='category'>
			<option>Easy</option>
			<option>Medium</option>
			<option>Hard</option>
		</select>
		<button type="submit">Submit</button>
		</form>

</body>
</html>