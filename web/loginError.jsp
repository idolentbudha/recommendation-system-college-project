<%-- 
    Document   : loginError
    Created on : Aug 13, 2017, 12:39:16 PM
    Author     : asim
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.buddha.dao.futsalconnection"%>
<%
    
    if(session.getAttribute("user") == null ) {
    
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width , initial-scale=1.0">
	<title>NepalFutsal</title>

	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="login.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
        <title>JSP Page</title>
        <style>
            .val_error{
                color:red;
            }
        </style>
    </head>
    <body onload="alert'Invalid username and password . Please try with valid data.';">

        <jsp:include page="header.jsp"/>
<div class="login">
	<h1>Let's play Futsal </h1>
        
        <form name="loginform" class="form1" action="futsalservlet" method="post" onsubmit="return validate()">
            <div id="user_error" class="val_error">
                Invalid username and password.Try with valid information.
                <p> 
                    
                </p>
            </div>
           
		<input class="input1" type="text" name="username" placeholder="username" required="">
		<input class="input1" type="password" name="password" placeholder="password" required="enter password">
		<div class="checkbox">
		      <label><input type="checkbox" name="remember"> Remember me</label>
		 </div>
                
		<button  class="button1" type="submit" name="userlogin" id="login_btn" value="userlogin">Login</button>
	</form>
      
        <p style="color:white;"> <strong>Don't have and account.Please <a href="signupform.jsp" style="color:#eb282c;"> register </a>now.</strong></p>
</div>





        <jsp:include page="footer.jsp"/>

</body>
</html>
<script type="text/javascript">
//    var n = document.forms["loginform"]["username"];
//    var p = document.forms["loginform"]["password"];
//    var user_error = document.getElementById("user_error");
//    
//    function validate(){
//   
//        String q = "SELECT * From users where username='"+n+"' AND password='"+p+"'";
//        Connection con = futsalconnection.getConnectionObject(q);
 //
//        
//    }
     
      
    </script>

<%} else{
  response.sendRedirect("user.jsp");
}%>
