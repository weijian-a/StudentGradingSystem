<%@ page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

//Retrieve lecturer username and role
session = request.getSession();
String username= (String)session.getAttribute("uname");
Integer urole = (Integer)session.getAttribute("urole");

	
//Retrieve values from from data
String[] stID = request.getParameterValues("stID");
String[] stName = request.getParameterValues("stName");
String[] stModID = request.getParameterValues("stModID");
String[] stModName = request.getParameterValues("stModName");


if (username==null || urole !=1 || username == null && urole != 1) {
	response.sendRedirect("login.jsp?invaliduser");
}
else
{
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add marks</title>
</head>
<body>
<h1>ADD STUDENT MARKS</h1>
	<form method="post" action="addgrades_validation.jsp">
            <center>
            <table border="0" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Add Grades Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                     <td>Module ID </td>
                     <td><input type="text" name="modID" value="<%=stModID[0] %>" disabled></td>
                    </tr>
                    <tr>
                     <td>Module Name </td>
                     <td><input type="text" name="moduleName" value="<%=stModName[0] %>" disabled></td>
                    </tr>
                    <tr>
                        <td>Student ID </td>
                        <td><input type="text" name="stID" value="<%=stID[0] %>" disabled></td>
                    </tr>
                    <tr>
                        <td>Student Name: </td>
                        <td><input type="text" name="stName" value="<%=stName[0] %>" disabled></td>
                    </tr>
                    
                    <tr>
                    
                    	<!-- users are allowed to input grades up to 1decimal place. pattern in this case is for browser such as
                    	Firefox who does not read "number" in their browser -->
                   		<td>Input Grades: </td>
                   		<td><input type="number" name="grades" min="0" max="100" step="0.1" pattern="\d+"/></td>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Submit Grades" />
                            &nbsp;&nbsp;
                            
                            <button type="submit" formaction="faculty_liststudent.jsp">Cancel</button>
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>

</body>
</html>
<%
}%>