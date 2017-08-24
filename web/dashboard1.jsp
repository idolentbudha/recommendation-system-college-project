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
            
            
            if(session.getAttribute("user") == null ) {
            response.sendRedirect("login.jsp");
        %>
        
        <% }else{%>
    <!-- Demo page code -->

   <!--  <script type="text/javascript">
        $(function() {
            var match = document.cookie.match(new RegExp('color=([^;]+)'));
            if(match) var color = match[1];
            if(color) {
                $('body').removeClass(function (index, css) {
                    return (css.match (/\btheme-\S+/g) || []).join(' ')
                })
                $('body').addClass('theme-' + color);
            }

            $('[data-popover="true"]').popover({html: true});
            
        });
    </script> -->
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
  

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
   
  <!--<![endif]-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html">Futsal Nepal</a>
    </div>
    <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span> 
                        
                    <% out.print(session.getAttribute("user"));  %>
                    
                    <i class="fa fa-caret-down"></i>
                </a>

              <ul class="dropdown-menu">
                <li><a href="./">My Account</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Admin Panel</li>
                <li><a href="./">Users</a></li>
                <li><a href="./">Security</a></li>
                <li><a tabindex="-1" href="./">Payments</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#">Logout</a></li>
              </ul>
            </li>
          </ul>
       
  </div>
</nav>
   
    <div class="sidebar-nav">
    <ul>
    <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> Dashboard<i class="fa fa-collapse"></i></a></li>
    <li><ul class="dashboard-menu nav nav-list collapse in">
            <li><a href="dashboard.jsp"><span class="fa fa-caret-right"></span> Main</a></li>
            <li ><a href="users.jsp"><span class="fa fa-caret-right"></span> User List</a></li>
            <li ><a href="user.jsp"><span class="fa fa-caret-right"></span> User Profile</a></li>
            <li ><a href="#"><span class="fa fa-caret-right"></span> Reset Password</a></li>
    </ul></li>


        <li><a href="#" data-target=".legal-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-legal"></i> Legal<i class="fa fa-collapse"></i></a></li>
        <li><ul class="legal-menu nav nav-list collapse">
            <li ><a href="privacy-policy.html"><span class="fa fa-caret-right"></span> Privacy Policy</a></li>
            <li ><a href="terms-and-conditions.html"><span class="fa fa-caret-right"></span> Terms and Conditions</a></li>
    </ul></li>

        <li><a href="help.html" class="nav-header"><i class="fa fa-fw fa-question-circle"></i> Help</a></li>
            <li><a href="faq.html" class="nav-header"><i class="fa fa-fw fa-comment"></i> Faq</a></li>
                
            </ul>
    </div>

    <div class="content">
        <div class="header">
          
            <h1 class="page-title">Dashboard</h1>
                    <ul class="breadcrumb">
            <li><a href="dashboard.jsp">Home</a> </li>
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
      <td><label for="from">From*:</label><select name="from" id="from">
<option Value="0"selected="selected">--SELECT--</option>
  <option value="1">6:00</option>
  <option value="2">7:00</option>
  <option value="3">8:00</option>
  <option value="4">9:00</option>
  <option value="5">10:00</option>
  <option value="6">11:00</option>
  <option value="7">12:00</option>
  <option value="8">1:00</option>
  <option value="9">2:00</option>
  <option value="10">3:00</option>
  <option value="11">4:00</option>
  <option value="12">5:00</option>
  <option value="13">6:00</option>
  <option value="14">7:00</option>
  <option value="15">8:00</option>
  <option value="16">9:00</option>
  <option value="17">10:00</option>
</select>
<label for="to">To*:</label>  <select name="from" id="to">
<option Value="0"selected="selected">--SELECT--</option>
  <option value="1">6:00</option>
  <option value="2">7:00</option>
  <option value="3">8:00</option>
  <option value="4">9:00</option>
  <option value="5">10:00</option>
  <option value="6">11:00</option>
  <option value="7">12:00</option>
  <option value="8">1:00</option>
  <option value="9">2:00</option>
  <option value="10">3:00</option>
  <option value="11">4:00</option>
  <option value="12">5:00</option>
  <option value="13">6:00</option>
  <option value="14">7:00</option>
  <option value="15">8:00</option>
  <option value="16">9:00</option>
  <option value="17">10:00</option>
</select>
</td>
      <td><input type="text" name="booker"></td>
      <td><input type="tel" name="phone"></td>
      <td>
         <input type="submit" name="submit" value="Add Booker">
      </td>
    </tr>
 </tbody>
</table>
            

            
<div class="panel panel-default">
  <div class="panel-heading">Booker List:</div>
  <div class="panel-body">
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
      <td>1</td>
      <td>6:00-7:00</td>
      <td>Jacobs</td>
      <td>ash11927</td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
    <tr>
      <td>2</td>
      <td>6:00-7:00</td>
      <td>Ann</td>
      <td>audann84</td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
    <tr>
      <td>3</td>
      <td>6:00-7:00</td>
      <td>Robinson</td>
      <td>jr5527</td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
    <tr>
      <td>4</td>
      <td>6:00-7:00</td>
      <td>Butler</td>
      <td>aaron_butler</td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
    <tr>
      <td>6</td>
      <td>6:00-7:00</td>
      <td>Albert</td>
      <td>cab79</td>
      <td>
          <a href="user.html"><i class="fa fa-pencil"></i></a>
          <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
      </td>
    </tr>
    </tbody>
    </table>
  </div>
</div>
    
 

<ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>

            <footer>
                <hr>

                <p>© 2017 <a href="http://www.futsalnepal.com.np" target="_blank">Futsal Nepal</a></p>
            </footer>
        </div>
    </div>


                    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
<% } %>  
</body></html>


