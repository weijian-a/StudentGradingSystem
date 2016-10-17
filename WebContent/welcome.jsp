<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hello - JSP Tutorial</title>
	<%@ taglib uri="http://bootstrapjsp.org/" prefix="b" %>
</head>
<body>
 	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgs","root","ict3104team3"); 
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * FROM account");
	
	while(rs.next()){
		System.out.print(rs.getObject(2));
	}
	%>

</body>
</html>