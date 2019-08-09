<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<%

LocalDate ld = LocalDate.now();

String Today = DateTimeFormatter.ofPattern("yyy-MM-dd").format(ld);



%>
<form action="SelectionSrv" method="post">

Choose Application :<select name="appchosen">

<option>Application 1</option>
<option>Application 2</option>

</select><br><br>

Choose time: <input type="date" max="<%=Today%>" name="day">

<input type="submit" value="Done">

</form>
</body>
</html>