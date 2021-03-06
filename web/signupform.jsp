<%-- 
    Document   : signupform.jsp
    Created on : May 27, 2017, 9:33:59 AM
    Author     : Ashim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
            <style type=" text/css">
            body{
              background-color:#372d2d;
            }
            legend {
                color: black;
            }
            .form-bg{
                background-color: #eee;
                color: black;
                font-size: 18px;
                box-shadow: 2px 2px 7px #ccc;
           
            }
            .form-bg1{
              background-color:#eee;
              color: black;
              font-size: 18px;
              box-shadow: 2px 2px 7px #ccc;
            }

            #head{
              color:white;
              font-family: sans-serif;
              font-size: 14px;
            }
            #select{
              margin: 20px;
              font-size: 18px;
            }

            #register{
              margin: 100px;
            }
            legend {
                color:white;
            }
            .form-bg{
                background-color: #111f1f;
                color: white;
           
            }
            .val_error{
	color: #FF1F1F;
}
            </style>
            
            
  </head>
<body>
    
    <jsp:include page="header.jsp"/>
    
    
    <!-- start signup form -->
    
<div class="container">

    <div class="row">
        <ul class="nav nav-pills">
            <li class="active"><a data-toggle="pill" href="#register">>> | Sign up</a></li>
            <li><a data-toggle="pill" href="#userSignup">User</a></li>
            <li><a data-toggle="pill" href="#ownerSignup">Owner</a></li>
       </ul>

       <div class="tab-content">

         <div id="register" class="tab-pane fade in active">
              <div class="jumbotron">
            <p id="select" >Please select the one of the register process to sign up in Nepal Futsal.</p>
            </div>
        </div>
        
           
        <div id="userSignup" class="tab-pane fade">
             <h1 id="head">Thank you for using our services.</h1>

                <form name="signup" class="form-horizontal form-bg1" onsubmit="return Validate()" action="futsalservlet" method="post" >
                        <fieldset>


                            <!-- Form Name -->
                            <legend class="text-center"><h3><strong>Register your account</strong></h3></legend>
                            <!-- Name-->
                            <div class="form-group">

                              <label class="col-md-4 control-label" for="fname">FirstName</label> 
                              <div class="col-md-4">
                              <input id="textinput" name="fName" placeholder="Insert your First Name" class="form-control input-md" required="" type="text">
                              <span class="help-block"> </span>  
                              </div>
                            </div>
                            
                            <div class="form-group">

                              <label class="col-md-4 control-label" for="fname">MiddleName</label> 
                              <div class="col-md-4">
                              <input id="textinput" name="mName" placeholder="Insert your Middle Name" class="form-control input-md"  type="text">
                              <span class="help-block"> </span>  
                              </div>
                            </div>
                            
                            <div class="form-group">

                              <label class="col-md-4 control-label" for="fname">LastName</label> 
                              <div class="col-md-4">
                              <input id="textinput" name="lName" placeholder="Insert your Last Name" class="form-control input-md" required="" type="text">
                              <span class="help-block"> </span>  
                              </div>
                            </div>
                            
                            
                            <div class="form-group">

                              <label class="col-md-4 control-label" for="fname">Username</label> 
                              <div class="col-md-4">
                              <input id="textinput" name="uName" placeholder="Insert your Full Name" class="form-control input-md" required="" type="text">
                              <span class="help-block"> </span>  
                              </div>
                            </div>

                            <!-- Phone number-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="pnumber">Telephone.No</label> 
                              <div class="col-md-4"> 
                              <input class="form-control" type='tel' id="textinput" name="pnumber"  title='Phone Number (Format: +9779860****16' required="" class="form-control input-md" required="">
                              <span class="help-block"> </span>  
                              </div>
                            </div>

                            <!--- location -->
                            <div class="form-group">
                                <label for="address" class="col-md-4 control-label">Address</label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                             <span class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                            </span>
                                                  <input type="text" name="address" class="form-control input-md" required="">
                                        </div>
                                    </div>
                            </div>
                            <!-- email-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="email">Email</label>  
                              <div class="col-md-4">
                              <input id="email" name ="email" placeholder="Insert your Email address" class="form-control input-md" required="" type="email">
                              <span class="help-block"> </span>  
                              </div>
                            </div>

                            <!-- password-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="pass0">Password</label>  
                              <div class="col-md-4">
                              <input id="pass0" name="password0" placeholder="Insert your Password" class="form-control input-md" required="" type="password">
                              <span class="help-block"> </span>  
                              </div>
                            </div>

                            <!-- password1-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="pass1">Confirm Password</label>  
                              <div class="col-md-4">
                              <input  id="password1" name="password1" placeholder="Confirm your Password" class="form-control input-md" required="" type="password">
                              <div id="password_error" class="val_error"></div>
                              <span class="help-block"> </span>  
                              </div>
                            </div>

                            <!-- Button -->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="singlebutton"> </label>
                              <div class="col-md-4">
                                <button id="singlebutton" type="submit" name="registerUser" value="registerUser"  class="btn btn-primary">Submit</button>
                              </div>
                            </div>

                            </fieldset>
                   </form>
         </div>
          
         <!-- next signup  -->  
       
           <div id="ownerSignup" class="tab-pane fade">
             <h1 id="head">Thank you for using our services.</h1>
             <form name="signUp" class="form-horizontal form-bg" action="futsalservlet" onsubmit="return validate()" method="post" >
            <fieldset>
            <!-- Form Name -->
            <legend class="text-center"><h3><strong>Register your futsal</strong></h3></legend>
            <!-- Name-->
            <div class="form-group">
                
              <label class="col-md-4 control-label" for="fullname">FutsalName</label> 
              <div class="col-md-4">
              <input id="fullname" name="futsalName" placeholder="Insert your Futsal Name" class="form-control input-md" required="" type="text">
              <span class="help-block"> </span>  
              </div>
            </div>
            
<!--            <div class="form-group">
            <label class="col-md-4 control-label" for="ownername">OwnerName</label> 
              <div class="col-md-4">
              <input id="ownername" name="ownername" placeholder="Insert your Full Name" class="form-control input-md" required="" type="text">
              <span class="help-block"> </span>  
              </div>
            </div>-->
            
            <!-- Phone number-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="number">Telephone.No</label> 
              <div class="col-md-4"> 
              <input class="form-control" type='tel' id="number" name="number"  title='Phone Number (Format: +9779860****16' required="" class="form-control input-md" required="">
              <span class="help-block"> </span>  
              </div>
            </div>

            <!--- location -->
            <div class="form-group">
                <label for="location" class="col-md-4 control-label">Futsal Location</label>
                    <div class="col-md-4">
                        <div class="input-group">
                             <span class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i>
</span>
                            <input type="text" name="location" class="form-control input-md" required="">
                        </div>
                    </div>
            </div>
            
            <!-- price-->
<!--            <div class="form-group">
              <label class="col-md-4 control-label" for="price">Price:</label>  
              <div class="col-md-4">
              <input id="price" name="price" placeholder="Insert your price of futsal arena per hour." class="form-control input-md" required="" type="text">
              <span class="help-block"> </span>  
              </div>
            </div>-->
            <!-- time-->
<!--            <div class="form-group">
              <label class="col-md-4 control-label" for="time">Opening time:</label>  
              <div class="col-md-4">
              <input id="time" name="time" placeholder="Insert your opening time" class="form-control input-md" required="" type="text">
              <span class="help-block"> </span>  
              </div>
            </div>-->
            <!-- email-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="mail">Email</label>  
              <div class="col-md-4">
              <input id="mail" name="mail" placeholder="Insert your Email address" class="form-control input-md" required="" type="email">
              <span class="help-block"> </span>  
              </div>
            </div>
            <!-- email-->
<!--            <div class="form-group">
              <label class="col-md-4 control-label" for="desc">Description about your futsal:</label>  
              <div class="col-md-4">
                  <textarea id="desc" name="describe" placeholder="Describe your Futsal...."  class="form-control input-md" required="" type="text">
              </textarea>
              <span class="help-block"> </span>  
              </div>
            </div>-->

            <!-- password-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="password0">Password</label>  
              <div class="col-md-4">
              <input id="password0" name="password" placeholder="Insert your Password" class="form-control input-md" required="" type="password">
              <span class="help-block"> </span>  
              </div>
            </div>

            <!-- password1-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="password1">Confirm Password</label>  
              <div class="col-md-4">
              <input name="password_confirmation" id="password1"  placeholder="Confirm your Password" class="form-control input-md" required="" type="password">
              <div id="password_error1" class="val_error"></div>
              <span class="help-block"> </span>  
              </div>
            </div>

            <!-- Button -->
            <div class="form-group">
              <label class="col-md-4 control-label" for="singlebutton"> </label>
              <div class="col-md-4">
                <button id="singlebutton" type="submit" name="register" value="register"  class="btn btn-primary">Submit</button>
              </div>
            </div>

            </fieldset>
           </form>
             
  
           </div>
         

       </div>

      
        
            </div>
    
        </div>
    <!-- end signup form -->
    
    
    
    
    
    
    
    
        
<!--<div class="container">
    <div class="row">
        <form name=" signup" class="form-horizontal form-bg" action="futsalservlet" method="post" >
            <fieldset>
             Form Name 
            <legend class="text-center"><h3><strong>Register your futsal</strong></h3></legend>
             Name
            <div class="form-group">
                
              <label class="col-md-4 control-label" for="fullname">FutsalName</label> 
              <div class="col-md-4">
              <input id="textinput" name="futsalName" placeholder="Insert your Full Name" class="form-control input-md" required="" type="text">
              <span class="help-block"> </span>  
              </div>
            </div>
            
             Phone number
            <div class="form-group">
              <label class="col-md-4 control-label" for="fullname">Telephone.No</label> 
              <div class="col-md-4">
              <input type="number" id="textinput" name="number" placeholder="Insert Contact number" class="form-control input-md" required="" >
              <span class="help-block"> </span>  
              </div>
            </div>

            - location 
            <div class="form-group">
                <label for="location" class="col-md-4 control-label">Futsal Location</label>
                    <div class="col-md-4">
                        <div class="input-group">
                             <span class="input-group-addon"><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span>
                                  <select class="form-control" name="country" id="location"  placeholder="Please select your Country">
                                      <option>-select-</option>
                                      <option>Kathmandu</option>
                                      <option>Bhaktapur</option>
                                      <option>Lalitpur</option>
                                  </select>
                        </div>
                    </div>
            </div>
             email
            <div class="form-group">
              <label class="col-md-4 control-label" for="mail">Email</label>  
              <div class="col-md-4">
              <input id="mail" name="mail" placeholder="Insert your Email address" class="form-control input-md" required="" type="email">
              <span class="help-block"> </span>  
              </div>
            </div>

             password
            <div class="form-group">
              <label class="col-md-4 control-label" for="password0">Password</label>  
              <div class="col-md-4">
              <input id="password0" name="password0" placeholder="Insert your Password" class="form-control input-md" required="" type="password">
              <span class="help-block"> </span>  
              </div>
            </div>

             password1
            <div class="form-group">
              <label class="col-md-4 control-label" for="password1">Confirm Password</label>  
              <div class="col-md-4">
              <input name="password1" id="password1" name="textinput" placeholder="Confirm your Password" class="form-control input-md" required="" type="password">
              <span class="help-block"> </span>  
              </div>
            </div>

             Button 
            <div class="form-group">
              <label class="col-md-4 control-label" for="singlebutton"> </label>
              <div class="col-md-4">
                <button id="singlebutton" type="submit" name="register" value="register"  class="btn btn-primary">Submit</button>
              </div>
            </div>

            </fieldset>
           </form>
  
            </div>
        </div>-->
     <jsp:include page="footer.jsp"/>
</body>     
</html>
 <script type="text/javascript">
               var password0 = document.forms["signup"]["password0"];
               var password1 = document.forms["signup"]["password1"];
               var password_error = document.getElementById("password_error");
               	function Validate(){
		// VALIDATE PASSWORD
		if (password0.value != password1.value) {
			password_error.textContent = "*Please try to enter same password*";
			password0.style.border = "1px solid red";
			password1.style.border = "1px solid red";
			password0.focus();
			return false;
		}
		// PASSWORD REQUIRED
		if (password0.value == "" || password1.value == "") {
			password_error.textContent = "*Password required for further process* ";
			password0.style.border = "1px solid red";
			password1.style.border = "1px solid red";
			password0.focus();
			return false;
		}
	}
           </script>
           
           <script type="text/javascript">
               var password = document.forms["signUp"]["password"];
               var password_confirmation = document.forms["signUp"]["password_confirmation"];
               var password_error1 = document.getElementById("password_error1");
               	function validate(){
		// VALIDATE PASSWORD
		if (password.value != password_confirmation.value) {
			password_error1.textContent = "*Please try to enter same password*";
			password.style.border = "1px solid red";
			password_confirmation.style.border = "1px solid red";
			password.focus();
			return false;
		}
		// PASSWORD REQUIRED
		if (password.value == "" || password_confirmation.value == "") {
			password_error1.textContent = "*Password required for further process* ";
			password.style.border = "1px solid red";
			password_confirmation.style.border = "1px solid red";
			password.focus();
			return false;
		}
	}
           </script>