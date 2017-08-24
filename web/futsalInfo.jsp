<%-- 
    Document   : futsalDesc
    Created on : Aug 13, 2017, 11:24:39 AM
    Author     : asim
--%>
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
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <style type="text/css">
      .background{
    background-image: url(img/ground1.jpg);
    background-size: cover;
    background-position: 50% 25%;
    position: relative;
    margin-top: 0px auto;
    top: 0;
    left: 0;
    height:700px;
    overflow-x: hidden;
}
  .futsalName h3{
    display: block;
    font-size:4em;
    color: white;
}
.desc-info, form, .futsalName h3, .futsalDesc{
    margin-left: 50px;
    margin-top: 20px
}
/*rating star*/
  form{
    width: 70%;
  }
  label, input {
    display: block;
    width: 100%;
  }

  .rateList {
    padding: 0;
    margin: 10px;
  }
  .rateList li{
    list-style-type: none;
    display: inline-block;
    font-size: 24px !important;
    color: white;
    text-shadow: 2px 2px 7px grey;
  }

  .rateList li:hover {
    color: yellow;
  }     

  .rateList li.active,.rateList li.secondary-active{
    color: yellow;
  }

  input[type=radio]{
    display: none;
  }
/*description*/
.futsalDesc{
    color: darkgrey;
    font-family: sans-serif;
}

/*yes*/
.desc-info {
    width: 100%;
    display: block;
    color: white;
    font-size: 18px;
}
.desc-left {
    float: left;
    width: 48%;
    margin-right: 2%;
}
 .desc-right {
    float: left;
    width: 50%;
}
/*rate*/
#rate{
    width:10%;
    height: 35px;
    border-radius:10px;
}
  </style>
    </head>
    <body>
    <jsp:include page="header.jsp" />
    
    
        <div class="container-fluid">
    <div class="row">
        <div class="background" >
 <%@page import="java.util.*" %>
   
    
    
<!--futsal-->

<% 
    Iterator itr;
    List data = (List) request.getAttribute("individual");
    if(data == null || data.isEmpty()){
        
        out.print("<center><h2>"+"No futsal "+"</h2></center>");
    
    
    }else{
    for(itr= data.iterator();itr.hasNext();){


%>            
            
            
            
            
            
    <div class="col-md-8 col-xs-8">
            <div class="futsalName">
                <h3>
                    <%String futsalName = (String) itr.next(); 
                                           
                                        %>
                                         <%= futsalName %>
                    
                </h3>
                <form method="post" action="rateServlet" >
                <input type="hidden" name="futsalname" value="<%= futsalName %>">    
                <ul class="rateList">
                    <li><label for="rateOne"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateOne" value="1"></li>
                    <li><label for="rateTwo"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateTwo" value="2"></li>
                    <li><label for="rateThree"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateThree" value="3"></li>
                    <li><label for="rateFour"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateFour" value="4"></li>
                    <li><label for="rateFive"><i class="fa fa-star" aria-hidden="true"></i></label><input type="radio" name="rate" id="rateFive" value="5"></li>
                </ul>
                    <input id="rate" type="submit" value="rateUs" >
            </form>
            </div>
            
            <div class="futsalDesc">
                    <p><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></p>
            </div>
            <div class="desc-info">
                     <div class="desc-left clearfix">
                          
                          <p><strong>Phone No.:</strong><%= itr.next() %></p>
                          <p><strong>Location:</strong><%= itr.next() %></p>
                          <p><strong>Email:</strong><%= itr.next() %></p>
                     </div>
                     <div class="desc-right clearfix">
                          
                          <p><strong>Price:</strong> Sun-fri Rs.1000 & Holiday :Rs.1500</p>
                          <p><strong>Opening TIme:</strong> 6:00 AM to 10:00 PM</p>
                         
                      </div>
                  <div class="clearfix"></div>
                            </div>
    </div>
    <div class="col-md-4"></div>
<%}}%>    
    </div>
</div>
    
</div>


<script type="text/javascript">
    $('li').on('click',function(){
        $('li').removeClass('active');
        $('li').removeClass('secondary-active');
        $(this).addClass('active');
        $(this).prevAll().addClass('secondary-active');
    })
</script>
    </body>
</html>
