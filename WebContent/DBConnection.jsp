<%@ page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgs","root","1234"); 

%>