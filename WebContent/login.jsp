<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Grading System</title>
</head>
<body>
        <form method="post" action="login_validation.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                	
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" pattern="[A-Za-z0-9_]{1,15}" title="Please input your username e.g 19SIC001A or A123456" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>
                    <%
          				ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Lc-_gsUAAAAAJsn56sk_M_RoA2QXqpgjR9Aklq_", "6Lc-_gsUAAAAAGI9i3bvbiiESKpp58q683T-Am7T", false);
          				out.print(c.createRecaptchaHtml(null, null));
        			%>             
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>