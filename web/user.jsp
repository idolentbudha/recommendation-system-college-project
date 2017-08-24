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
                
<div class="container-fluid">
    
  <div class="row">
      <!-- left column -->

      <jsp:include page="userpic.jsp" />   
      
      

<%@page import="java.util.*"  %>
<% 
    Iterator itr;
    List data = (List) session.getAttribute("userinfo");

    if( data == null || data.isEmpty()){out.print("empty or null");}else{
        for(itr= data.iterator();itr.hasNext();){


%>               
                
<div class="col-md-12">
               
              <div class="Info">
                  <div id="demo">
                  <div class="row myPage">
                    <div class="col-md-6 ">
                      <table class="table">
                          <tbody>
                            <tr>
                              <td>userid:</td>
                              <td><% int userID = (int)itr.next(); 
                                     
                                  %>
                                  <%= userID  %>
                              </td>
                            </tr>
                            <tr>
                              <td>Name:</td>
                              <td><%= itr.next() %> <%= itr.next() %> <%= itr.next() %></td>
                            </tr>
                            <tr>
                              <td>email:</td>
                              <td><%= itr.next() %></td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                      <table class="table">
                          <tbody>
                            <tr>
                              <td>Username:</td>
                              <td><% out.print(session.getAttribute("user")); %> </td>
                            </tr>
                            <tr>
                              <td>Join Date:</td>
                              <td>2017/5/6</td>
                            </tr>
                            <tr>
                              <td>Phone No:</td>
                              <td><%= itr.next() %></td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                  </div>
                      
                  </div>
              </div>  
            </div>
  <%}}%> 
  
<br> 
<br>
<br>
  
  
  
  
  
  
  </div>
  

  
  

   
  

<div class="row">
    <div class="col-md-12">
        <div class="gesture">
              Thank You for using our services.  
          </div>
     </div>
</div>
  

   
     
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
<%}%>