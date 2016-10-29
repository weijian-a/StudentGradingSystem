<%@ page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Grading System</title>
</head>
<body>
  <table border="1">
  <tr><th>
  <font color='Gray'>ID</font></th><th>
  <font color='Gray'>NAME</font></th><th>
  <font color='Gray'>DESCRIPTION</font><th></th></tr>
<%
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from module");
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
<td><a href="faculty_liststudent.jsp?id=<%=Id%>">View</a></td>
</tr>
<%
  }
 %>
 </table>
     </body>
</html>