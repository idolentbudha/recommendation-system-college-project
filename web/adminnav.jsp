<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="display.jsp">Futsal Nepal</a>
    </div>
    <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span> 
                    
                    <% out.print(session.getAttribute("admin"));  %>
                    
                    <i class="fa fa-caret-down"></i>
                </a>

              <ul class="dropdown-menu">
<!--                <li><a href="./">My Account</a></li>-->
                <li class="divider"></li>
<!--                <li class="dropdown-header">Admin Panel</li>
                <li><a href="#">Users</a></li>-->
<!--                <li><a href="#">Security</a></li>-->
<!--                <li><a tabindex="-1" href="./">Payments</a></li>-->
                <li class="divider"></li>
                <li><a tabindex="-1" href="logoutServlet">Logout</a></li>
              </ul>
            </li>
          </ul>
       
  </div>
</nav>