<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>Log In</title>
<!-- reference our style sheet -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user-profile.css"/>
	<title>Login</title>
</head>

<body  background="../resources/Login-wallpapers.jpg">
	<div id="wrapper">
		<div id="header">
			<h2>User Login platform</h2>
			<div id="container">
				<div id="content">
					<div class="card">
					      <div class="card-body justify-content-center">
					        <form class="form-login text-center">
					
					          <h3 class="sub-header">Please Login</h3>
					        </br>
					          <div class="form-group">
					            <input class="input-box" id="UsernameInput" type="email" name="email" placeholder="Enter your email">
					          </div>
					          <div class="form-group">
					            <input type="password" id="PasswordInput" name="password" placeholder="Enter your password">
					          </div>
					          <br>
					          <button class="btn btn-success" id="LoginButton">Login</button>
					
					          <br><br>
					
					          <h5 class="sub-header">Don't have an account?</h5>
					          <a href="/user/showFormForUpdate" class="sub-header">Click here</a>
					
					        </form>
					
					
					        
					      </div>
					 </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

	