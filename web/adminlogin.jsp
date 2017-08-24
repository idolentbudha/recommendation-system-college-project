<%-- 
    Document   : login
    Created on : May 20, 2017, 4:59:43 PM
    Author     : Lama
--%>

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
    </head>
    <body>

        <jsp:include page="header.jsp"/>
<div class="login">
	<h1>Admin login </h1>
        <form class="form1" action="futsalservlet" method="post">
		<input class="input1" type="text" name="username" placeholder="username">
		
                <input class="input1" type="password" name="password" placeholder="password">
		
                <div class="checkbox">
		      <label><input type="checkbox" name="remember"> Remember me</label>
		</div>
                
		<button  class="button1" type="submit" name="adminlogin" id="login_btn" value="adminlogin">Login</button>
	</form>
        <p style="color:white;"> <strong>Don't have and account.Please <a href="signupform.jsp" style="color:#eb282c;"> register </a>now.</strong></p>
</div>





        <jsp:include page="footer.jsp"/>

</body>
</html>
    