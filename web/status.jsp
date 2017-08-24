<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width , initial-scale=1.0">
	<title>NepalFutsal</title>

	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href= "style.css">
	<link rel="stylesheet" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
 	<script src="jquery-3.2.1.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="script.js"></script>
  	<script type="text/javascript">
  	function fetch(){
  		var get = document.getElementById("get").value;
  		document.getElementById("price").value = get;
  	}
  	</script>

<style type="text/css">
	
</style>

</head>
<body>

    <jsp:include page="header.jsp" />
    
<div class="container">
        <section class="book-search">
        		<div class="wrapper">
        				<div class="content">
			        			<header class="bookName">
			        				<h2>Happy Searching:</h2>
			        			</header>
			        			<div class="myform">
			        				<form  class="form-inline formSearch" action="" method="post">
			        				<div class="form-group form_item inputName">
			        					<label for="name">Name: </label><input type="text" name="username" id="name" required autofocus placeholder=" Your username" pattern="[a-zA-z]{3,}" title="Please enter a name more than 3 letters. " >
			        				</div>	

			        				<div class="form-group form_item inputEmail">
			        					<label for="mail">Email: </label><input type="email" name="mail" id="mail" required placeholder=" Your email" p title="please enter  yours@your.com">
			        				</div>
			                        
			                        <div class="form-group form_item inputPh">
			                        	<label for="phone">Ph no:</label> <input type="tel" name="phone" size id="phone" required placeholder=" Enter phone number." title="Some numnber are missing.">
			                        </div>
			                       
			                       <div class="form-group clearfix form_item inputLoc">
			                       		<label for="location">Location :</label><select name="location" id="location" required>
			                       		<option value="">  Option...</option>
			                       		<option value="Kathmandu">Kathmandu</option>
			                       		<option value="bhaktapur">Bhaktapur</option>
			                       		<option value="lallitpur">Lalitpur</option>
			                       	</select>
			                       </div>
			                     	
			                     	<div class="form-group form_item inputDateTime ">
				                     	
				                     		<label for="date"> Date :</label><input type="date" id="date" name="date" min="2017-01-01">
				                     	
			                     			<label for="time"> Time :</label><input type="time" id="time" name="time">
			                     		
			                     		
			                     	</div>
			                     	
			                     	<div class="form-group form_item slider">
			                     	<p>
			                     		<label for="price">Price Range:(500-2500)</label> <input type="text" id="price" readonly >
			                     	</p>
						                     			
						                     			<input type="range"  name="price-range" id="get" min="500" max="2500" step="50" value="0" onchange="fetch()">
			                     	</div>
			                     	<div class="form_item bookSubmit">
			                     		<button class="button buttonSearch">Search</button>
			                     	</div>
			                      	
                		</form>
        			</div>
        		</div>
        	</div>
    </section>
</div>

    <jsp:include page="footer.jsp" />
</body>
</html>