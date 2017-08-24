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

            <!-- edit form column -->
              <div class="personal-info">
                <div class="alert alert-info alert-dismissable">
                  <a class="panel-close close" data-dismiss="alert">×</a> 
                  <i class="fa fa-coffee"></i>
                  Please provide the valid info. It helps us to know you better.
                </div>
                <h3>You Info</h3>
              </div>
            
            <%@page  import="java.util.*" %>        
            
       <div class="col-md-6" >
      	<table>
            
            
            <form class="form-horizontal" role="form">
            
<% Iterator itr;
    List data = (List) request.getAttribute("userInformation");
    if(data == null || data.isEmpty()){
    }else{
        for(itr = data.iterator(); itr.hasNext();){
    
%>                
                
                            <div class="form-group">
                              <label class="col-lg-3 control-label">Full name:</label>
                              <div class="col-lg-8">
                                  <input name="fname" class="form-control" placeholder="<%= itr.next()%>" type="text">
                              </div>
                            </div>
                            <div class="form-group">
                              <label name="mname" class="col-lg-3 control-label">Middle name:</label>
                              <div class="col-lg-8">
                                  <input class="form-control" placeholder="<%= itr.next()%>" type="text">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-lg-3 control-label">Last name:</label>
                              <div class="col-lg-8">
                                  <input name="lname" class="form-control" placeholder="<%= itr.next()%>" type="text">
                              </div>
                            </div>
                              
                            <div class="form-group">
                              <label class="col-lg-3 control-label">Email:</label>
                              <div class="col-lg-8">
                                  <input name="email" class="form-control" placeholder="<%= itr.next() %>" type="text">
                              </div>
                            </div>

                            <div class="form-group">
                              <label class="col-md-3 control-label">Username:</label>
                              <div class="col-md-8">
                                  <input name="uname" class="form-control" placeholder="<%= itr.next() %>" type="text">
                              </div>
                            </div>
                            <div class="form-group">
                            <label class="col-lg-3 control-label">Phone No:</label>
                            <div class="col-lg-8">
                                <input name="phone" class="form-control" type='tel' pattern='[\+]\d{3}[\d{4}]\d{3}\d{3}' title='Phone Number (Format: +9779860****16' placeholder="<%= itr.next() %>"> 
                            </div>
                          </div>

<!--                          <div class="form-group">
                            <label class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                              <input class="form-control"  type="password">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-3 control-label">Confirm password:</label>
                            <div class="col-md-8">
                              <input class="form-control"  type="password">
                            </div>
                          </div>-->
    <%}
        }
    %>
                <input class="btn btn-primary" value="Save Changes" type="submit"><br>
                
         
        </form>
      	</table>
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