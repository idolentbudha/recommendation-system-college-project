
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width , initial-scale=1.0">
	<title>NepalFutsal</title>

	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href= "style.css">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
	<link rel="stylesheet" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>


        <style type="text/css">
#formRate{
  	width: 70%;
  	margin:0 auto;
  }
  label, input {
  	display: block;
  	width: 100%;
  }

  #ulRate {
  	padding: 0;
  	margin: 0;
  }
  #ulRate li{
  	list-style-type: none;
  	display: inline-block;
  	font-size: 18px !important;
  	margin: 8px;
  	color: white;
  	text-shadow: 2px 2px 7px grey;
  }

  #ulRate li:hover {
  	color: yellow;
  }  	

  #ulRate li.active, #ulRate li.secondary-active{
  	color: yellow;
  }

  input[type=radio]{
  	display: none;
  }
 h6{
      font-size:14px;
      font-family: sans-serif;
      color:whitesmoke;
  }
  p{
      font-family: sans-serif;
      font-size: 12px;
      color: whitesmoke;
  }
</style>
<script>
                             function ps(){
                                window.alert("login to rate");
                             }    
                            </script>
</head>
<body>
    <!-- Modal -->
                                            <div id="myModal" class="modal fade" role="dialog">
                                              <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Login to Rate</h4>
                                                  </div>
                                                  <div class="modal-body">
                                                      <p><a href="login.jsp" style="color:black">login</a></p>
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                  </div>
                                                </div>

                                              </div>
                                            </div>
    
    <jsp:include page="header.jsp" />
    
    <%@page import="java.util.*" %>
   
    
    
<!--futsal-->
<div class="container">
    <div class="row item text-center">

<% 
    Iterator itr;
    List data = (List) request.getAttribute("info");
    if(data == null || data.isEmpty()){
        
        out.print("<center><h2>"+"No futsal registered"+"</h2></center>");
    
    
    }else{
    for(itr= data.iterator();itr.hasNext();){


%>

				     
                                
        
            
            <div class=" clearfix col-sm-3">
                
                <%if(session.getAttribute("user") == null ){%>
                <!-- cannot rate-->
                
                                
                        <div class="thumbnail">
                        <img src="futsal-logo.png" alt="logo">

                            <h3><strong><%= itr.next() %></strong></h3>
                            <p>Phone.no: <%= itr.next() %></p>
                            <p>location : <%= itr.next() %></p>
                            <p> email: <%= itr.next() %> </p>
                            
                            <button type="button" class="btn" data-toggle="modal" data-target="#myModal">Rate Us</button>
                                        


                        </div>
                    
                <%}else{%>
                <!--can rate-->
                            
                    <div class="thumbnail">
                        <img src="futsal-logo.png" alt="logo">

                            <h6><strong><% 
                                           String futsalName = (String) itr.next(); 
                                           
                                        %>
                                         <%= futsalName %>   
                                </strong></h6>
                            <p>Phone.no: <%= itr.next() %></p>
                            <p>location : <%= itr.next() %></p>
                            <p> email: <%= itr.next() %> </p>
                            <form class="formRate" method="post" action="individualServlet">
                                <ul id="ulRate">
                                    <input type="hidden" name="futsalname" value="<%= futsalName %>">
<!--                                        <li><label for="rateOne"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateOne" value="1"></li>
                                        <li><label for="rateTwo"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateTwo" value="2"></li>
                                        <li><label for="rateThree"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateThree" value="3"></li>
                                        <li><label for="rateFour"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateFour" value="4"></li>
                                        <li><label for="rateFive"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateFive" value="5"></li>
                            -->
                                </ul>
                            <button class="btn">Click to Rate</button>
                            </form>                    
                    </div>
                
                <%}%>
</div>
                        
 
                                                                
<%}}%>			 
</div>                                
</div>                                
	



<!--

<div class="text-center">
    <div class="pagination">
      <a href="#">&laquo;</a>
      <a href="arena.jsp" class="active">1</a>
      <a href="#" class="disabled">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">&raquo;</a>
    </div>
</div>		
 
-->







<jsp:include page="footer.jsp" />
</body>
</html>