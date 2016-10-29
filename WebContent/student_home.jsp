<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Grading System</title>
</head>
<body>
<%
session = request.getSession();
String username= (String)session.getAttribute("uname");

if (username==null){
	response.sendRedirect("login.jsp?invaliduser");
}
%> 
	Hi Student: <label for="uname" id="uname" name="uname">${uname}</label>
	<p></p>
	<form name="change_pass" action="change_password.jsp" method="get">
	<input type="submit" value="Change Password" />
    </form>
    </tr>
	<br/>
	<a href="logout_validation.jsp">Logout</a>
</body>
</html>