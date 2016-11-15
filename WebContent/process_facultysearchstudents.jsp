<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
 
<%@page import="java.util.*" %>
  <%
  String student_name = request.getParameter("studentName"); 
  ArrayList<Object[]> studentList = new ArrayList<Object[]>();
  if(student_name != null && student_name.length() > 0) {
	  PreparedStatement preparedStatement = con.prepareStatement("Select * from users where firstname LIKE ? ");
	  preparedStatement.setString(1, "%" +student_name+ "%");
	  ResultSet resultSet = preparedStatement.executeQuery();
	  
	  while (resultSet.next()) {
		  String first_name = resultSet.getString("firstname");
		  String last_name = resultSet.getString("lastname");
		  String email = resultSet.getString("email");
		  
		  Object[] student = {first_name,last_name,email};
		  studentList.add(student);
		  //System.out.println("First Name: " + first_name + "," + "Last Name: " + last_name);
	  }
	  session.setAttribute("studentObject",studentList);
	  //System.out.println(Arrays.toString(studentList.get(0)));

	  response.sendRedirect("faculty_searchstudents.jsp");
  }
  
  else {
	  response.sendRedirect("login.jsp");
  }
  
  %>