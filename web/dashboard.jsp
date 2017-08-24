<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>Futsal Nepal Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    
     <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

        <script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $(".knob").knob();
        });
    </script>


    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/premium.css">

</head>
<body class=" theme-blue">
    
    





    
    <% 
//            boolean found = false;
//            int i = 0;
//            Cookie ck[] = request.getCookies();
//            if(ck!=null){
//                for(i=0; i<ck.length;i++){
//                    if(ck[i].getName().equals("username")){
//                        found = true;
//                                break;
//                    }
//                }
//            }
            
            
            if(session.getAttribute("admin") == null ) {
            response.sendRedirect("adminlogin.jsp");
        %>
        
        <% }else{%>

    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover { 
            color: #fff;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            var uls = $('.sidebar-nav > ul > *').clone();
            uls.addClass('visible-xs');
            $('#main-menu').append(uls.clone());
        });
    </script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  

  
  <jsp:include page="adminnav.jsp" />
   
                    <jsp:include page="sidepanel.jsp"/>

    <div class="content">
        <div class="header">
          
            <h1 class="page-title">Dashboard</h1>
                    <ul class="breadcrumb">
            <li><a href="index.html">Home</a> </li>
            <li class="active">Dashboard</li>
        </ul>

        </div>
        <div class="main-content">
            




    <div class="btn-toolbar list-toolbar">
    <button class="btn btn-primary"><i class="fa fa-plus"></i> New User</button>
    <button class="btn btn-default">Import</button>
    <button class="btn btn-default">Export</button>
  <div class="btn-group">
  </div>
</div>
            
            
            
<!-- enter records-->
<form  method="get" action="dashboard">
<table class="table">
  <thead>
    <tr>
      <th>#</th>
      <th>Duration :</th>
      <th>Booked By :</th>
      <th>Phone No.:</th>
      
      <th style="width: 3.5em;"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td>
<select name="from" id="from">
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
<select name="fromampm">
    <option value="am" >am</option>
    <option value="pm" >pm</option>
</select>

<select name="to" id="to">
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
<select name="toampm">
    <option value="am" >am</option>
    <option value="pm" >pm</option>
    
</select>
</td>
      <td><input type="text" name="booker"></td>
      <td><input type="tel" name="phone"></td>
      <td>
         <input type="submit" name="submit" value="Add_Booker">
      </td>
    </tr>
 </tbody>
</table>
</form>


<!-- booking records displayed-->




<div class="panel panel-default">
  <div class="panel-heading">Booker List: </div>
  <div class="panel-body">
  <table class="table">
  <thead>
    <tr>
      <th>Booked By</th>
      <th>Phone No:</th>
      <th>From</th>
      <th>To</th>
      <th style="width: 3.5em;"></th>
    </tr>
  </thead>
  <tbody>


    <%@page import="java.util.*"  %>  

        <% 
    Iterator itr;
    List data = (List) request.getAttribute("info1");

    for(itr= data.iterator();itr.hasNext();){%>
 
    <tr>
      <td><%=  itr.next() %></td><!-- //booked by   -->
      
      <td><%=  itr.next()%> <!-- phonenumber -->
          </td>
      <td> <%=  itr.next()  + " "+itr.next()   %> </td>
      <td> <%=  itr.next()  + " "+itr.next()   %>    </td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
  <%}
%>   
      
    
    
    </tbody>
    </table>
  </div>
</div>
    
 

<!--<ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>-->

            <footer>
                <hr>

                <p>© 2017 <a href="http://www.futsalnepal.com.np" target="_blank">Futsal Nepal</a></p>
            </footer>
        </div>
    </div>


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>

    
  
</body></html>
<% } %>
