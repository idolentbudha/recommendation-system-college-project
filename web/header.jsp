<%-- 
    Document   : header
    Created on : May 20, 2017, 5:03:57 PM
    Author     : Lama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>

    function loadName(){

        var sname = document.getElementById('searchid').value;
        log.Console(sname);
        var url = "search?val="+sname;
            if(window.XMLHttpObject){
                var xhttp = new XMLHttpObject();
            }elseif(window.ActiveXObject){
                var xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try{
                xhttp.onreadystatechange = function(){
                    if(readystate == 4 && status == 200){
                        var val = request.responseText;
                        document.getElementById("result").innerHTML = val;
                    }
                }//end of anynomus function

                xhttp.open("get",url,true);
                xhttp.send();
            }catch(e){}

    }//end of functionloadname
</script>





        
        <nav class="navbar navbar-inverse borderRed">
        <div id="container1">
                <div class="navbar-header mini">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#meroNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                </button>
            </div>
            <div class="collapse navbar-collapse" id="meroNavbar">
                <a class="floater" href="index.jsp"> <img class="img-responsive" src="./img/logo.png"> </a>
                        <ul class="nav navbar-nav navCustom navbar">

                          <li class=""><a href="arenaServlet">Arenas</a></li>
<!--                      <li><a href="status.jsp">Status</a></li>-->
                      <li><a href="aboutus.jsp">AboutUs</a></li>
                      
                      <li>
                            <% 
                                
//                                            boolean found = false;
//
//                                        Cookie ck[] = request.getCookies();
//                                        int i=0;
//                                        for( i=0;i<ck.length; i++){
//                                            if(ck[i].getName().equals("username")){
//                                                found =true;
//                                                break;}
//                                        }

                                if(session.getAttribute("user") == null){ %>
                                <li><a href="login.jsp">Login</a></li>

                              <% }else{%>

                              <a href="logoutServlet">Logout</a>
                              <li><a href="bServlet">Profile</a></li>

                              <% } %>
                        
                      </li>
                     <li>
                         
                        <script>  
                        var request=new XMLHttpRequest();  
                        function searchInfo(){  
                        var name=document.vinform.name.value;  
                        var url="connect.jsp?val="+name;  

                        try{  
                        request.onreadystatechange=function(){  
                        if(request.readyState==4){  
                        var val=request.responseText;  
                        document.getElementById('result').innerHTML=val;  
                        }  
                        }//end of function  
                        request.open("GET",url,true);  
                        request.send();  
                        }catch(e){alert("Unable to connect to server");}  
                        }  
                        </script>
                        
                        <form name="vinform" id="search">  
                        <input type="text" name="name" onkeyup="searchInfo()">  
                        </form> 
                        <span id="result" style="color:white"></span>
                         
                         
<!--                         <form name="vinform" id="search">
                                        <input name="name" id="searchid" type="text" size="40" placeholder="Search..." onkeyup="searchInfo()"/>

                                        
                        </form>-->
                         <span id="result"></span>
                        </li>

                        </ul>
                </div>
        </div>
        </nav>
