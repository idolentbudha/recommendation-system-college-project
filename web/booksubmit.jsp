<%-- 
    Document   : booksubmit
    Created on : Aug 20, 2017, 2:59:42 PM
    Author     : Lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <title>Nepal Futsal</title>
        
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>
        <script src="https://use.fontawesome.com/c4c2d657ad.js"></script>
                    <style type=" text/css">
            body{
              background-color:#372d2d;
            }
            .footer{
                margin-top:300px;
            }
            
            .submitHead .panel-heading{
                background-color: #558C89 !important;
               height: 100px !important;   
            }
            .submitHead{
                font-size: 24px;
                font-family: cocon;
            }
            .submitHead p{
                margin: 30px auto;
            }
            .goProfile{
                color:whitesmoke;
            }
            
            .notice{
                font-family: fantasy;
            }
            .click a{
                font-weight:20%;
                color:cornflowerblue;
            }
       </style>

    <body>
        
        <jsp:include page="header.jsp"/> 
        <section class="submitHead">
            
                 <div class="container">
                     <div class=" panel panel-default">
                             <div class="panel-heading">
                                    <p>Your book is submitted. Please be on time. Thank you.</p>
                            </div>
                </div>
            </div>
        </section>
                 
        <section class="goProfile">
    <div class="container">
        <div class="notice">
            <p>If you want to book other futsal ground. Please <span class="click"><a href="bServlet"><b>Click here</b></a></span></p>
    </div>
    </div>
    
    
</section>
        <section class="footer">
        <jsp:include page="footer.jsp"/>
        </section>
    </body>
</html>
