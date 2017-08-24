<%
    
    if(session.getAttribute("user") == null ) {
        
    
            response.sendRedirect("login.jsp");
    }else{
    
    
%>


<!DOCTYPE html>
<html>
<head>
	<title>Futsal User</title>
	<meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="css/userstyle.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>
</head>
<body>
    
     <jsp:include page="header.jsp" /> 
     
<div class="container-fluid ">
  
    

  <div class="row">
              
    <jsp:include page="userpic.jsp" />     
              <div class="Info">
                  

                  <div id="demo1">
                    <h1><strong>List of futsal You played:</strong></h1>
                      <ol>
                        <li>hello futsal</li>
                        <li>hello futsal</li>
                        <li>hello futsal</li>
                        <li>hello futsal</li>
                      </ol>
                  </div>
              </div>  
          
      </div>
</div>
              
<div class="row">
    <div class="col-md-12">
        <div class="gesture">
              Thank You for using our services.  
          </div>
     </div>
</div>
<jsp:include page="footer.jsp" />    
</body>
</html>
<%}%>