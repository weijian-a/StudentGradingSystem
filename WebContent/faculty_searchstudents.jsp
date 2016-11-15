<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Grading System</title>

</head>
<body>



<% ArrayList<Object[]> name = (ArrayList<Object[]>) session.getAttribute("studentObject"); %>

<% for(Object[] tempStudentList: name) {
    for(Object tempStudent : tempStudentList) {
         String student = (String) tempStudent;
         
         
         %> <h1><%= student %>  </h1>
        <% 
    }
} %>


</body>
</html>