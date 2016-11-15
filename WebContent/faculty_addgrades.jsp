<%@ page import="java.sql.*" %>
<%@include file="DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session = request.getSession();
String lecUname= (String)session.getAttribute("uname");
//Integer lecId = (Integer)session.getAttribute("lecId");

System.out.println("LEC UN = " + lecUname + "."); // ". LEC ID = " + lecId +

if (lecUname==null ) { // || lecId !=1 || lecUname == null && lecId != 1
	response.sendRedirect("login.jsp?invaliduser");
}
else
{
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add student grades</title>
</head>
<body>

	

	<form method="post" action="addgrades_validation.jsp">
            <center>
            <table border="0" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Add Grades Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    
                     <td>Module</td>                    
                      <%
							//getModuleListByLectureID
							PreparedStatement pst1 = con.prepareStatement("SELECT * from module where idMod IN (SELECT " +
									" fk_enroll_mod from enroll where fk_enroll_acc IN (SELECT idAcc from account where username = '" + lecUname + "'  ))" );						
							ResultSet rs1 = pst1.executeQuery(); 
						%>
							
                        <td> <select name="Module">
                        
                       		<%while(rs1.next()){ %>
        					<option value="<%=rs1.getString("idMod")%>"><%=rs1.getString("modName")%></option>
                       		<%}%>      
                       		
                       		
							
                       		
							</select>
							
							<button type="button" onclick="myFunction()">Select</button>
							</td>
                    </tr>
                    <tr>
                        <td>Select Student: </td>
                        <td>
                         <%
                         String modID = requst.getParameter("mod");
                         	
                       		//getModuleListByLectureID
							PreparedStatement pst2 = con.prepareStatement("SELECT sgs.account.username, sgs.particulars.name FROM sgs.module "
									+ "JOIN sgs.enroll ON sgs.enroll.fk_enroll_mod = sgs.module.idMod " +
									"JOIN sgs.account ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc " +
									"JOIN sgs.particulars ON sgs.particulars.fk_part_acc = sgs.account.idAcc " +
									" WHERE sgs.account.fk_acc_role = 2 AND sgs.module.idMod = " + modID + " AND sgs.enroll.fk_enroll_mod IN (" + 
									  " SELECT sgs.enroll.fk_enroll_mod FROM sgs.account JOIN sgs.enroll ON sgs.enroll.fk_enroll_acc = sgs.account.idAcc "
									  + "WHERE sgs.account.username = '" + lecUname + "' ) ORDER BY idMod");						
							ResultSet rs2 = pst2.executeQuery();  
							%>
							
                        <select name="students">
                        
                       		<%while(rs2.next()){ %>
        					<option value="<%=rs2.getString("username")%>"><%=rs2.getString("name")%></option>
                       		<%}%>       
							    
							</select></td>
                    </tr>
                    
                    <tr>
                    
                    	<!-- users are allowed to input grades up to 1decimal place. pattern in this case is for browser such as
                    	Firefox who does not read "number" in their browser -->
                   		<td>Input Grades: </td>
                   		<td><input type="number" name="grades" min="0" max="100" step="0.1" pattern="\d+"/></td>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Submit Grades" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Cancel" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
        <script>
			function myFunction() {
			var mod = document.getElementByName("Module").value;
					
			}
		</script>
</body>
</html>
<%
}
%>