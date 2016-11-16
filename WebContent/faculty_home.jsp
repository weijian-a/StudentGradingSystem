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
		
		<form method="get">
		<center>
		<h1>Welcome, Faculty: <label for="uname" id="uname" name="uname">${uname}</h1></label>
		<p>What would you like to do today?</p>
		
		<button type="submit" formaction="faculty_listmodule.jsp">View Teaching Modules </button>
		&nbsp;&nbsp;
	    <button type="submit" formaction="faculty_liststudent.jsp">View & Grade Students </button>
	    &nbsp;&nbsp;
	    <button type="submit" formaction="change_password.jsp">Change Password </button>
		&nbsp;&nbsp;
		</br></br>
		<hr width="50%">
		</div>
		
	    <h4>Search for students</h4>
	    <form action="process_facultysearchstudents.jsp" method="POST">
  		<input type="text" name="studentName" size="50" placeholder="Search by Student ID, Student Name">
        <input type="submit" value="Search">
		</form>
	    </div>
	    
	    </br></br></br></br>
	   
	   <p> I am done for the day. <button type="submit" formaction="logout_validation.jsp">Logout</button> </p>
	   </center>
	   
	   </form>
	</body>
	</html>
<%
}
%>