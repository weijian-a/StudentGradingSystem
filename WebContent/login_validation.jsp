<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Student Grading System</title>
</head>
<body>
 	<%@ page import="java.sql.*"%>
	<%@page import="java.security.*"%>
	<%

	StringBuffer sbToCheck = new StringBuffer();
	String username = request.getParameter("username");   
    String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgs","root","1234"); 
    PreparedStatement pst = con.prepareStatement("Select username,security from account where username=?");
    pst.setString(1, username);
    ResultSet rs = pst.executeQuery();   
	
	if(rs.next()){
		 //check id
		 String salt = rs.getString("security");
		 if(!salt.equals(""))
		 {
			sbToCheck.append(salt);
			sbToCheck.append(password);
		 	Encrypt en = new Encrypt();
		 	String checkPassw = en.EncryptPass(sbToCheck.toString());
		 	
		 	pst.close();
		 	
		    PreparedStatement pst2 = con.prepareStatement("Select username,fk_acc_role from account where username=? AND password=?");
		    pst2.setString(1, username);
		    pst2.setString(2, checkPassw);
		    ResultSet rs2 = pst2.executeQuery();   

			if(rs2.next()){
				 //check uuid
				 int role = rs2.getInt("fk_acc_role");
				

				session= request.getSession();
				session.setAttribute("uname", username);
				 if(role==1)
				 {
				 	//if faculty go faculty home page
				 	
		        	response.sendRedirect("faculty_home.jsp");
				 }
				 else
				 {
					 //if student go student home page
		        	response.sendRedirect("student_home.jsp");
				 }
			}
		 }
	}
	else{
		out.println("Invalid login credentials"); 
	}
	out.println("Invalid login credentials"); 
	%>
	<%!
	class Encrypt {
		StringBuffer sb = new StringBuffer();
	    public String EncryptPass(String str) {
	    	try{
		    	//hashing method
		    	MessageDigest md = MessageDigest.getInstance("SHA-256");
		    	md.update(str.getBytes());
		
		    	byte byteData[] = md.digest();
		
		    	//convert the byte to hex format method 1
		    	for (int i = 0; i < byteData.length; i++) {
		    	 sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		    	}
	    	}catch(Exception e){
	    		
	    	}
	      return sb.toString();
	    }
	  }
	%>
</body>
</html>