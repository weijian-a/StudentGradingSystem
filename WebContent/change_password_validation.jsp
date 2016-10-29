<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.security.*"%>
<%@page import="java.util.UUID"%>
<%@include file="DBConnection.jsp" %>
<%
session = request.getSession();
String uname= (String)session.getAttribute("uname");

if (uname==null) {
	response.sendRedirect("login.jsp?invaliduser");
}
else
{
	String OldPassword = request.getParameter("OldPassword");
	String Newpass = request.getParameter("newpassword");
	String conpass = request.getParameter("conpassword");
	
	Statement st = null;
	String username = request.getParameter("hide");
	String pass = "";
	String security = "";
	String checkPassw = "";
	StringBuffer sbToCheckOldPassw = new StringBuffer();
	
	int id = 0;
	try {
	PreparedStatement pst = con.prepareStatement("Select * from account where username=? and password=?");
	pst.setString(1, username);
	pst.setString(2, OldPassword);
	ResultSet rs = pst.executeQuery(); 
	
	if (rs.next()) { 
	pass = rs.getString("password");
	security = rs.getString("security");
	
	sbToCheckOldPassw.append(security);
	sbToCheckOldPassw.append(OldPassword);
	Encrypt en = new Encrypt();
	checkPassw = en.EncryptPass(sbToCheckOldPassw.toString());
	
	} 
	if(Newpass.equals(conpass))
	{
	if (pass.equals(checkPassw)) {
	
	StringBuffer sbToSave = new StringBuffer();
	String uuid = UUID.randomUUID().toString().replaceAll("-", "");
	sbToSave.append(uuid);
	sbToSave.append(Newpass);
	String saltANDpassw = sbToSave.toString();
	
	out.println(uuid);
	
	Encrypt en2 = new Encrypt();
	String strResult = en2.EncryptPass(saltANDpassw);
	
	st = con.createStatement();
	PreparedStatement updst = con.prepareStatement("update account set security=?,password=? where username=?");
	updst.setString(1, uuid);
	updst.setString(2, strResult);
	updst.setString(3, username);
	int i = updst.executeUpdate();
	out.println("Password changed successfully");
	st.close();
	con.close();
	response.sendRedirect("logout_validation.jsp");
	} 
	else {
	out.println("Old Password doesn't match");
	}
	/*}else{
	out.println("new password and confirm new password is not matching");
	}*/
	}
	} catch (Exception e) {
	out.println(e);
	}
}
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