<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
session = request.getSession();
String username= (String)session.getAttribute("uname");
Integer urole = (Integer)session.getAttribute("urole");

System.out.println("uname = " + username +". urole = " + urole + ".");

if (username==null || urole!=1) {
	response.sendRedirect("login.jsp?invaliduser");
}
else
{
%> 
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Student Grading System</title>
		</head>
		<body>
		Hi Faculty: <label for="uname" id="uname" name="uname">${uname}</label>
		<p></p>
		<form name="change_pass" action="change_password.jsp" method="get">
		<input type="submit" value="Change Password" />
	    </form>
	    
	    <div>
	    Search for students:
	    <form action="process_facultysearchstudents.jsp" method="POST">
	    <input type="hidden" name="foreignKey" value="<%= session.getAttribute("fk_enroll_acc") %>"  />
  		Student Name: <input type="text" name="studentName" required aria-required="true" pattern="[A-Za-z]"> <br>
        <input type="submit" value="Submit">
		</form>
	    </div>
	    
	    
	    <br/>
		<a href="faculty_listmodule.jsp">List all modules</a>
		<br/>
		<a href="faculty_liststudent.jsp">List all student</a>
		<br/>
		<a href="faculty_addgrades.jsp">Add student grades</a>
		<br/>
		<br/>
		<a href="logout_validation.jsp">Logout</a>
	</body>
	</html>
<%
}
%>