      <div class="col-md-12 bgUser">
        <div class="userName">
            <h2 style="color: white; text-align: center;">
                
                <% out.print(session.getAttribute("user"));  %>
            
            </h2>
        </div>
        <div class="text-center userImage">
          <img id ="profilePhoto" src="img/profile.jpg" class="img-responsive" alt="avatar">
        </div>
      </div>
                
     <div class="userBar">
              <ul class="list-inline uBar">
                    <li><a  class="active" href="booking.jsp">Book futsal</a></li>
                    <li><a   href="user.jsp">My Page</a></li>
<!--                    <li><a  href="futsalList.jsp">Played Futsal</a></li>-->
                    <li><a href="preUpdate">Edit Info</a></li>
             </ul>
    </div>