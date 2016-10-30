<%@ page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Grading System</title>
</head>
<body>
  <table border="1">
  <tr><th>
  <font color='Gray'>ID</font></th><th>
  <font color='Gray'>Module Name</font></th><th>
  <font color='Gray'>Description</font><th></th></tr>
<%

/* String studentId = request.getAttribute("studentId").toString(); */
String username = request.getParameter("userId"); //param value
System.out.println("enrolled_module.jsp: " + username);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM sgs.module WHERE idMod IN ("
		+ "SELECT fk_enroll_mod FROM sgs.enroll WHERE fk_enroll_acc = ("
		+ "SELECT idAcc FROM sgs.account WHERE username = '" + username + "'))");
  while(rs.next())
  {
      String Id= rs.getString("idMod");
      String Name=rs.getString("modName");
      String Desc=rs.getString("modDesc");
  %>
  <tr>
<td><b><font color='#663300'><%=Id%></font></b></td>
<td><b><font color='#663300'><%=Name%></font></b></td>
<td><b><font color='#663300'><%=Desc%></font></b></td>
<%-- <td><a href="faculty_liststudent.jsp?id=<%=Id%>">View</a></td> --%>
</tr>
<%
  }
 %>
 </table>
 <br/>
	<a href="student_home.jsp">Back to Student Home Page</a>
</body>
</html>