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
	<title>Futsal User</title>
	<meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="css/userstyle.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>
        <script src="https://use.fontawesome.com/c4c2d657ad.js"></script>
        
        <title>Nepal Futsal</title>
        
<style type="text/css">
  body, form{
    background-color:#372d2d;
}

    .form-book{
    max-width:400px;
    background:#372d2d;
    border-radius:2px;
    margin:50px auto;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-book ul{
    list-style:none;
    padding:0;
    margin:0;  
}

.form-book li{
    display:block;
    padding: 9px;
    margin-top: 30px;
    margin-left: 30px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-book li:last-child{
    border:none;
   text-align: center;
}
.form-book li > label{
    display: block;
    float: left;
    margin-top: -20px;
    background:#372d2d;
    height: 14px;
    padding: 2px 5px 2px 5px;
    color: white;
    font-size: 16px;
    font-family: Arial, Helvetica, sans-serif;
}
.form-book input[type="text"],
.form-book select
{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    display: block;
    outline: none;
    border: none;
    height: 25px;
    line-height: 25px;
    font-size: 16px;
    padding: 0;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-book input[type="text"]:focus,
.form-book input[type="number"]:focus,
.form-book select:focus
{
}

.form-book li > span{
    background:#06425C;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color:white;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
}
.form-book input[type="submit"],
.form-book input[type="button"]{
    background: #06425C;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: white;
}
.form-book input[type="submit"]:hover,
.form-book input[type="button"]:hover{
    background: grey;
    color:white;
}
.info{
                    width: 90%;
                    margin:30px;
                }  
                
                .goProfile{
                    margin-top: -90px;
                }
  </style>
     
        
    </head>
    <body>
    <jsp:include page="header.jsp" />    
                
<div class="container-fluid">
    
  <div class="row">
      <!-- left column -->

      <jsp:include page="userpic.jsp" />      
        
                            <form class="form-book" action="bookingServlet" method="post" >
                            <ul>
                                   <div class="info">
        <div class="alert alert-warning alert-dismissable">
                  <a class="panel-close close" data-dismiss="alert">×</a> 
                  <i class="fa fa-coffee"></i>
                  Please fill the information carefully.Thank you .
         </div>
  </div>
                            <li>
                                <label for="futsalName">Futsal Name<i class="fa fa-futbol-o fa-1x " aria-hidden="true"></i>
                            </label>
                                <select name="futsalName" id="futalName" required="">
                                    <%@page import="java.util.*" %>   
                                    <% 
                                            Iterator itr;
                                            List fdata = (List) request.getAttribute("flist");

                                            if( fdata == null || fdata.isEmpty()){out.print("empty or null");}else{
                                                for(itr= fdata.iterator();itr.hasNext();){
                                                    
                                    %>
                                    
                                        <% String fName =(String) itr.next();
                                           String femail = (String) itr.next();
                                        %>
                                    <option value="<%= fName %>"><%= fName %></option>
                                
                                    <%}}%>
                                </select>
                               
<!--                                <input id="futsalName" type="text" name="futsalName" maxlength="100">-->
                                <span>Select futsal  name here</span>
                            </li>

                            <li>
                                <label for="time">Time <i class="fa fa-clock-o fa-1x" aria-hidden="true"></i>
                            </label>
                                              <select name="from" id="time" required="">
                                                        <option value="0"> From </option>
                                                        <option value="6">6:00</option>
                                                        <option value="7">7:00</option>
                                                        <option value="8">8:00</option>
                                                        <option value="9">9:00</option>
                                                        <option value="10">10:00</option>
                                                        <option value="11">11:00</option>
                                                        <option value="12">12:00</option>
                                                        <option value="1">1:00</option>
                                                        <option value="2">2:00</option>
                                                        <option value="3">3:00</option>
                                                        <option value="4">4:00</option>
                                                        <option value="5">5:00</option>
                                                        <option value="6">6:00</option>
                                                        <option value="7">7:00</option>
                                                        <option value="8">8:00</option>
                                                        <option value="9">9:00</option>
                                                        <option value="10">10:00</option>
                                              </select>
                                               <select name="fromampm" required="" id="time">
                                                            <option value="am" >am</option>
                                                            <option value="pm" >pm</option>
                                              </select>

                                              <select name="to" id="time" required="">
                                                            <option Value="0">To</option>
                                                              <option value="6">6:00</option>
                                                              <option value="7">7:00</option>
                                                              <option value="8">8:00</option>
                                                              <option value="9">9:00</option>
                                                              <option value="10">10:00</option>
                                                              <option value="11">11:00</option>
                                                              <option value="12">12:00</option>
                                                              <option value="1">1:00</option>
                                                              <option value="2">2:00</option>
                                                              <option value="3">3:00</option>
                                                              <option value="4">4:00</option>
                                                              <option value="5">5:00</option>
                                                              <option value="6">6:00</option>
                                                              <option value="7">7:00</option>
                                                              <option value="8">8:00</option>
                                                              <option value="9">9:00</option>
                                                              <option value="10">10:00</option>
                                              </select>
                                              <select name="toampm" id="time" required="">
                                                                <option value="am" >am</option>
                                                                <option value="pm" >pm</option>

                                              </select>
                                <span>Enter  a time which you want to play</span>
                            </li>
                            <li>
                                <label for="bookerName">Booker Name <i class="fa fa-address-book-o fa-1x" aria-hidden="true"></i>
                            </label>
                                <input id="bookerName" type="text" name="bookerName" maxlength="100" required="">
                                <span>Enter your valid Full Name</span>
                            </li>
                            <li>
                                <label for="ph">Phone No. <i class="fa fa-phone-square fa-1x" aria-hidden="true"></i>

                            </label>
                                <input id="ph" type="text" name="phonenumber" required="">
                                <span>Enter your phone number</span>
                            </li>
                            <li>
                                <input type="submit" value="Book This" >
                            </li>
                            </ul>
                            </form>
        
  </div>
</div>
                                <section class="goProfile">
 <div class="info text-center">
        <div class="alert alert-info ">
                  <a class="panel-close close"></a> 
                  <i class="fa fa-coffee"></i>
                  The information you provide is sent to the futsal owner through mail. Thank you.
         </div>
  </div>
    
    
</section> 
        
        <jsp:include page="footer.jsp" />        
    
  </body>
</html>