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
  <font color='Gray'>Student ID </font></th><th>
  <font color='Gray'>Name </font></th><th>
  <font color='Gray'>Module </font></th><th>
  <font color='Gray'>Module Name </font></th><tr>
<%
session = request.getSession();
String username= (String)session.getAttribute("uname");
System.out.println("Urole: " + username);
Statement stmt=con.createStatement();
/** PreparedStatement pst = con.prepareStatement("SELECT * FROM sgs.particulars p inner join sgs.account a"+
									" on p.fk_part_acc = a.fk_part_acc"+
									" inner join sgs.enroll e"+
									" on p.fk_part_acc=e.fk_enroll_acc"+
									" inner join sgs.module m"+
									" on m.idMod = fk_enroll_mod"+
									" where fk_enroll_mod = ? AND fk_acc_role!=1");
									
									SELECT sgs.account.username, sgs.particulars.name, sgs.module.idMod, sgs.module.modName 
									FROM sgs.module
									JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod
									JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc
									JOIN sgs.particulars ON sgs.particulars.fk_part_acc = sgs.account.idAcc
									WHERE sgs.account.fk_acc_role = 2 AND sgs.enroll.fk_enroll_mod IN (
									  SELECT fk_enroll_mod
									  FROM sgs.enroll
									  WHERE fk_enroll_acc = 7 )
									ORDER BY idMod **/
									
PreparedStatement pst = con.prepareStatement("SELECT sgs.account.username, sgs.particulars.name, sgs.module.idMod, sgs.module.modName FROM sgs.module "
		+ "JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod " +
		"JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc " +
		"JOIN sgs.particulars ON sgs.particulars.fk_part_acc = sgs.account.idAcc " +
		" WHERE sgs.account.fk_acc_role = 2 AND sgs.enroll.fk_enroll_mod IN (" + 
		  " SELECT sgs.enroll.fk_enroll_mod FROM sgs.account JOIN sgs.enroll ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc "
		  + "WHERE sgs.account.username = '" + username + "' ) ORDER BY idMod"); 
//pst.setString(1, lecId);

ResultSet rs = pst.executeQuery(); 
  while(rs.next())
  {
      String Username= rs.getString("username");
      String Name=rs.getString("name");
      String Module=rs.getString("idMod");
      String ModName=rs.getString("modName");
      //Integer Grade=rs.getInt("grade");
  %>
<tr>
<td><b><font color='#663300'><%=Username%></font></b></td>
<td><b><font color='#663300'><%=Name%></font></b></td>
<td><b><font color='#663300'><%=Module%></font></b></td>
<td><b><font color='#663300'><%=ModName%></font></b></td>
</tr>
<%
  }
 %>
 </table>
</body>
</html>