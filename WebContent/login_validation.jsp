<<<<<<< HEAD
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
	<%@ page import="java.security.*"%>
	<%@ include file="DBConnection.jsp" %>
	<%
	StringBuffer sbToCheck = new StringBuffer();
	String username = request.getParameter("username");   
    String password = request.getParameter("password");
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
		 	
		    PreparedStatement pst2 = con.prepareStatement("Select username,fk_acc_role,fk_part_acc from account where username=? AND password=?");
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
					session.setAttribute("urole", 1);
				 	
				 	int fk_part_acc = rs2.getInt("fk_part_acc");
				 	session.setAttribute("fk_enroll_acc", fk_part_acc);
				 	
		        	response.sendRedirect("faculty_home.jsp");
				 }
				 else if (role==2)
				 {
					 //if student go student home page
					session.setAttribute("urole", 2);
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
=======
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
	<%@ page import="java.security.*"%>
	<%@ page import= "net.tanesha.recaptcha.ReCaptchaImpl"%>
    <%@ page import= "net.tanesha.recaptcha.ReCaptchaResponse"%>
	<%@ include file="DBConnection.jsp" %>
	<%
	
	
	
	
	String remoteAddr = request.getRemoteAddr();
    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
    reCaptcha.setPrivateKey("6Lc-_gsUAAAAAGI9i3bvbiiESKpp58q683T-Am7T");

    String challenge = request.getParameter("recaptcha_challenge_field");
    String uresponse = request.getParameter("recaptcha_response_field");
    ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

    if (reCaptchaResponse.isValid()) {
    	
    	StringBuffer sbToCheck = new StringBuffer();
    	String username = request.getParameter("username");   
        String password = request.getParameter("password");
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
    		 	
    		    PreparedStatement pst2 = con.prepareStatement("Select username,fk_acc_role, fk_part_acc from account where username=? AND password=?");
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
    					session.setAttribute("urole", 1);

    		        	int fk_part_acc = rs2.getInt("fk_part_acc");
    				 	session.setAttribute("fk_enroll_acc", fk_part_acc);
    				 	response.sendRedirect("faculty_home.jsp");
    		        	
    				 }
    				 else if (role==2)
    				 {
    					 //if student go student home page
    					session.setAttribute("urole", 2);
    		        	response.sendRedirect("student_home.jsp");
    				 }
    			}
    		 }
    	}
    	else{
    		out.println("Invalid login credentials"); 
    	}
    	
    	
      //System.out.println("Answer was entered correctly!");
    } else {
      System.out.println("Answer is wrong");
      out.println("Invalid CAPTCHA");
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
>>>>>>> branch 'master' of https://github.com/weijian-a/StudentGradingSystem.git
</html>