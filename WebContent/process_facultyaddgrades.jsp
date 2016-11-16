<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
 
<%@page import="java.util.*" %>
<%

Integer modID = request.getParameter("moduleID");

ArrayList<Object[]> studentList = new ArrayList<Object[]>();
if(student_name != null && student_name.length() > 0) {                  	
	//getModuleListByLectureID
	PreparedStatement pst2 = con.prepareStatement("SELECT sgs.account.username, sgs.particulars.name FROM sgs.module "
		+ "JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod " +
		"JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc " +
		"JOIN sgs.particulars ON sgs.particulars.fk_part_acc = sgs.account.idAcc " +
		" WHERE sgs.account.fk_acc_role = 2 AND sgs.module.idMod = " + modID + " AND sgs.enroll.fk_enroll_mod IN (" + 
		" SELECT sgs.enroll.fk_enroll_mod FROM sgs.account JOIN sgs.enroll ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc "
		+ "WHERE sgs.account.username = '" + lecUname + "' ) ORDER BY idMod");						
	ResultSet rs2 = pst2.executeQuery();  
}
	


%>