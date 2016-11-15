<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="DBConnection.jsp" %>  
  <%@page import="java.sql.*" %>
  <%@page import = "javax.servlet.*" %>
 
<%@page import="java.util.*" %>
  <%
  String student_name = request.getParameter("studentName"); 
  int foreign_key = Integer.parseInt(request.getParameter("foreignKey"));
  //int fkkk = Integer.parseInt(foreign_key);
  ArrayList<Object[]> studentList = new ArrayList<Object[]>();
  if(student_name != null && student_name.length() > 0) {
	  //PreparedStatement preparedStatement = con.prepareStatement("Select * from users where firstname LIKE ? ");
	  PreparedStatement preparedStatement = con.prepareStatement("SELECT sgs.account.username, sgs.particulars.name, sgs.module.idMod, sgs.module.modName FROM sgs.module "
				+ "JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod " +
				"JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc " +
				"JOIN sgs.particulars ON sgs.particulars.fk_part_acc = sgs.account.idAcc " +
				" WHERE sgs.account.fk_acc_role = 2 AND sgs.enroll.fk_enroll_mod IN (" + 
				  " SELECT sgs.enroll.fk_enroll_mod FROM sgs.account JOIN sgs.enroll ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc "
				  + "WHERE sgs.particulars.name LIKE ? and sgs.enroll.fk_enroll_acc = ?) ORDER BY idMod");

	  preparedStatement.setString(1, "%" +student_name+ "%");
	  preparedStatement.setInt(2, foreign_key);
	  ResultSet resultSet = preparedStatement.executeQuery();
	  
	  while (resultSet.next()) {
		  String username = resultSet.getString("username");
		  String name = resultSet.getString("name");
		  String modname = resultSet.getString("modname");
		  
		  Object[] student = {username,name,modname};
		  studentList.add(student);
	  }
	  session.setAttribute("studentObject",studentList);
	  //request.getRequestDispatcher("faculty_searchstudents.jsp").forward(request,response);
	  //dispatcher.forward(request,response); 

	  response.sendRedirect("faculty_searchstudents.jsp");
  }
  
  else {
	  response.sendRedirect("login.jsp");
  }
  
  %>