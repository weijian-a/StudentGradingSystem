 <html>
<head>
<title>Student Grading System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<h2 align="center">Change password</h2>
<body>
<%
session = request.getSession();
%>
<script language="javascript">
function fncSubmit()
{

if(document.ChangePasswordForm.OldPassword.value == "")
{
alert('Please input old password');
document.ChangePasswordForm.OldPassword.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input confirm password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('confirm password not match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

//check for password strength

document.ChangePasswordForm.submit();
}
</script>
<form name="ChangePasswordForm" method="post" action="change_password_validation.jsp" OnSubmit="return fncSubmit();">

<table border="1" align="center">
<tr>
<td>User Name</td>
<TD><label for="uname" id="uname" name="uname">${uname}</label></td>
</tr>
<tr>
<td>Previous Password</td>
<TD><input name="OldPassword" type="password" id="OLDpwd" size="20"></td>
</tr>
<tr>
<td>New Password</td>
<td><input name="newpassword" type="password" id="newpassword">
</td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input name="conpassword" type="password" id="conpassword">
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Save"></td>
</tr>
 <input type="hidden" name="hide" value="${uname}">
</table>
</form>
</body>
</html>