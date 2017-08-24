<%-- 
    Document   : index
    Created on : May 17, 2017, 7:19:20 AM
    Author     : Lama
--%>
<%-- this is nepalfutsal index page--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.buddha.bean.info"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width , initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>
        
        <title>Nepal Futsal</title>
    </head>
    <body>
        
        <jsp:include page="header.jsp"/> 
         <%@page import="java.util.*" %>
   
    
    
<!--futsal-->


      
     
   
<section class="arena">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
			    <a href="arena.jsp"><h1 class="h2" style="margin-left: 47px; font-family: monospace; text-decoration:none; color:black;">Futsal</h1></a>

				<div id="futsalCarousel" class="carousel slide" data-interval="5000" data-ride="carousel" data-wrap="true">
					<div class="carousel-inner " role="listbox">
						<div class="item active imageCarousel">
							<div class="row">
                                                            
<% 
        Iterator itr1,itr2;
        int i=0;
        int j=0;
        List<List> data = (List<List>) request.getAttribute("rfutsal");
        List pieces;
        if(data == null || data.isEmpty()){

            out.print("<center><h2>"+"No futsal registered"+"</h2></center>");
            

        }else{
            
            
            
for(itr1= data.iterator();itr1.hasNext();){
            
                
            pieces = ( List) itr1.next();
                
                
//                out.print(itr1.next()+"<br>");
//                
                for(itr2=pieces.iterator();itr2.hasNext();){ %> 
                
                    
<!--//                    out.print("<br>### 2nd loop ###<br>");        
//                    
//                    out.print(++j+"<br>");
//                    
//                    out.print("<br> 1st futsal<> ");-->

                            <div class="col-xs-3">
                                    <img src="img/Arena/arena1.jpg" class="img-responsive">
                                    <div class="thumbnail text-center thuumbind">
                                            <h3><%= itr2.next()%></h3>
                                            <p><%= itr2.next()%></p>
                                            <p><%= itr2.next()%></p>
                                            <p><%= itr2.next()%></p>
                                            <button >Book</button>
                                    </div>
                            </div>	
                    
<!--                            out.print(itr2.next()+"<br>");
                            out.print(itr2.next()+"<br>");
                            out.print(itr2.next()+"<br>");
                            out.print(itr2.next()+"<br>");
                            
//                    out.print("<br> 2nd futsal ");        
//                            
//                            out.print(itr2.next()+"<br>");
//                            out.print(itr2.next()+"<br>");
//                            out.print(itr2.next()+"<br>");
//                            out.print(itr2.next()+"<br>");-->
      <%          }
            
        }}

%>                                                            
								
                                                                
								

								

								
						</div>

						
					</div>
					<!-- Left and right controls -->
  <a id="futsalleft" class="left carousel-control " href="#futsalCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left " aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a id="futsalright" class="right carousel-control" href="#futsalCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right " aria-hidden="true"></span>
    </a>
				</div>

			</div>	

		</div>

	</div>
</section>
      

      
      
      
<jsp:include page="footer.jsp"/>       
    </body>
</html>
        
        
    

