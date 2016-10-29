<%
session = request.getSession();
String uname= (String)session.getAttribute("uname");

if (uname==null) {
	response.sendRedirect("login.jsp?invaliduser");
}
else
{
%>
<html>
<head>
<title>Student Grading System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<h2 align="center">Change password</h2>
<body>

<script language="javascript">
function scorePassword(pass) {
    var score = 0;
    if (!pass)
        return score;

    // award every unique letter until 5 repetitions
    var letters = new Object();
    for (var i=0; i<pass.length; i++) {
        letters[pass[i]] = (letters[pass[i]] || 0) + 1;
        score += 5.0 / letters[pass[i]];
    }

    // bonus points for mixing it up
    var variations = {
        digits: /\d/.test(pass),
        lower: /[a-z]/.test(pass),
        upper: /[A-Z]/.test(pass),
        nonWords: /\W/.test(pass),
    }

    variationCount = 0;
    for (var check in variations) {
        variationCount += (variations[check] == true) ? 1 : 0;
    }
    score += (variationCount - 1) * 10;

    return parseInt(score);
}

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
//set password with at least 1 char, lenght of 8
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
var score = scorePassword(document.ChangePasswordForm.newpassword.value);
	    
if (score > 80)
{
alert('password is strong');
document.ChangePasswordForm.Submit();
}
 else if (score > 60)
{
alert('password is good, please enter a strong password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
}
else if (score >= 30)
{
alert('password is weak, please enter a strong password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
}
else
{
alert('password is super weak');
document.ChangePasswordForm.newpassword.focus(); 
return false;
}
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
<td><input name="newpassword" type="password" id="newpassword"">
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
<%
}%>