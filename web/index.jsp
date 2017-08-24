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
        
        <% //this is calss example
            
                boolean found = false;
                Cookie ck[] = request.getCookies();
                if(ck!=null){
                    for(int i=0; i<ck.length;i++){
                        if(ck[i].getName().equals("username")){
                            found = true;
                            break;
                        }
                    }
                
                }
                if(found == true)
                        response.sendRedirect("loginOwner.jsp");
                else{ 
        %>
        
        
        
    <div class="container">

    <!--carousel-->
            <div id ="myCarousel" class= "carousel">
                    <ol class="carousel-indicators">
                            <li data-target = "#myCarousel" data-slide-to ="0" class="active" ></li>
                            <li data-target = "#myCarousel" data-slide-to ="1" ></li>
                            <li data-target = "#myCarousel" data-slide-to ="2" ></li>
                    </ol>

                    <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                    <img src="img/2.jpg" alt= "" class="img-responsive"><!--1920*741*-->
                                    <div class="carousel-caption">
                                                    <h3> Now the futsal is on your hand.</h3>
                                    </div>
                            </div>

                            <div class="item" >
                                    <img src="img/0.jpg" alt= "" class="img-responsive"><!--1920*741*-->
                                            <div class="carousel-caption">
                                                    <h3> Now the futsal is on your hand.</h3>	
                                            </div>
                            </div>
                            <div class="item" >
                                    <img src="img/01.jpg" alt= "" class="img-responsive"><!--1920*741*-->
                                            <div class="carousel-caption">
                                                    <h3> Now the futsal is on your hand.</h3>	
                                            </div>
                            </div>
                            <div class="item" >
                                    <img src="img/3.jpg" alt= "" class="img-responsive"><!--1920*741*-->
                                            <div class="carousel-caption">
                                                    <h3> Now the futsal is on your hand.</h3>
                                       </div>
                            </div>
                </div>

                <a class="carousel-control left" href = "#myCarousel" data-slide ="prev">
                    <span class = "icon-prev"></span>
                </a>
                <a class="carousel-control right" href = "#myCarousel" data-slide ="next">
                    <span class = "icon-next"></span>
                </a>
            </div>
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
								<div class="col-xs-3">
									<img src="img/Arena/arena1.jpg" class="img-responsive">
									<div class="thumbnail text-center thuumbind">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>012315135113</p>
										<button >Book</button>
									</div>
								</div>	
								<div class="col-xs-3 ">
										<img src="img/Arena/arena2.jpg" class="img-responsive">
										<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>

								<div class="col-xs-3 ">
									<img src="img/Arena/arena3.jpg" class="img-responsive">
									<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>

								<div class="col-xs-3 ">
									<img src="img/Arena/arena4.jpg" class="img-responsive">
									<div class="thumbnail text-center ">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>
							</div>
						</div>

						<div class="item imageCarousel">
							<div class="row">
								<div class="col-xs-3">
									<img src="img/Arena/arena1.jpg" class="img-responsive">
									<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>chabhil</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>	
								<div class="col-xs-3">
										<img src="img/Arena/arena2.jpg" class="img-responsive">
										<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>Banasthali</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>

								<div class="col-xs-3">
									<img src="img/Arena/arena3.jpg" class="img-responsive">
									<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>banasthali</p>
										<button>Book</button>
									</div>
								</div>

								<div class="col-xs-3">
									<img src="img/Arena/arena5.jpg" class="img-responsive">
									<div class="thumbnail text-center">
										<h3>Hello futsal</h3>
										<p>chuchepati</p>
										<p>012315135113</p>
										<button>Book</button>
									</div>
								</div>
							</div>
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
    
   
<!--    <h3 class="text-left fut" >Status</h3>
                            <div class="backcolor">
                                    <h3 class="text-left fut" ></h3>
                                            <div  id="container2">
                                                    <div class="row status">
                                                            <div class="clearfix col-sm-3"></div>
                                                                            <div class="clearfix col-sm-3 ">
                                                                                    <div class="panel panel-default text-center">
                                                                                    <div class="panel-heading ">
                                                                                        
                                                                                            <h3>Available Spots</h3>
                                                                                    </div>
                                                                                    <div class="panel-body" id="p-h1">
                                                                                            
                                                                                        
                                                                                        <h4></h4>	
                                                                                    </div>
                                                                            </div>
                                                                            </div>
                                                                            <div class="clearfix col-sm-3">
                                                                                    <div class="panel panel-default text-center">
                                                                                    <div class="panel-heading " >
                                                                                            <h3>Occuied Spots</h3>
                                                                                    </div>
                                                                            <div class="panel-body" id="p-h2">
                                                                                    <h4></h4>
                                                                            </div>
                                                                            </div>
                                                            </div>
                                                            <div class="clearfix col-sm-3">
                                                            </div>
                                                    </div>
                                            </div>	
                            </div>-->

       <!--about us-->
       <h3 class="text-left fut">About Us</h3>
                            <div class="backcolor bottom">
                                    
                                            <div  id="container2">
                                                    <div class="row">
<!--                                                                    <div class="clearfix col-sm-6 col-lg-6 ">
                                                                            <img class="img-responsive" src="img/futsallogo.png" alt="futsal-logo">	
                                                                    </div>-->

                                                                    <div class="clearfix col-sm-6 col-lg-6">
                                                                            <h3 style="color: white;">
                                                                                <CENTER><P>
                                                                                    Hey! How are you? we are going to deliver you one of the intresting site to you so keep 
                                                                                    in touch with us  every bit of time.
                                                                                    </P>
                                                                                </CENTER>    
                                                                                </h3>
                                                                            <p id="author" style="font-style: italic; color: white;"> - Anyonomous</p>
                                                                    </div>
                                                    </div>
                                            </div>
                            </div>
    </div>
        
<% }%>        
        
        
        <jsp:include page="footer.jsp"/>
        
     
</body>
</html>
