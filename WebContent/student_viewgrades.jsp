<%@ page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table border="1">
  <tr>
  	<th><font color='#663300'>ID</font></th>
  	<th><font color='#663300'>Module</font></th>
  	<th><font color='#663300'>Grade</font></th>
  </tr>
 
 <%
/* String studentId = request.getAttribute("studentId").toString(); */
String username = request.getParameter("userId"); //param value
System.out.println("student_viewgrades.jsp: " + username);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT sgs.module.idMod, sgs.module.modName, sgs.enroll.grade "
		+ "FROM sgs.module "
		+ "JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod "
		+ "JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc "
		+ "WHERE sgs.account.username = '" + username + "'");
  while(rs.next())
  {
      String Id= rs.getString("idMod");
      String Name=rs.getString("modName");
      String Grade=rs.getString("grade");
  %>
  <tr>
<td><b><font color='Black'><%=Id%></font></b></td>
<td><b><font color='Black'><%=Name%></font></b></td>
<td><b><font color='Black'><%=Grade%></font></b></td>
</tr>
<%
  }
 %>
 </table>
 <br/>
	<a href="student_home.jsp">Back to Student Home Page</a>

<!-- SELECT sgs.module.idMod, sgs.module.modName, sgs.enroll.grade
FROM sgs.module
JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod
JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc
WHERE sgs.account.username = '16SIC001A' -->

</body>
</html>