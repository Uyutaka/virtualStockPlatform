<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<title>Log In</title>
<!-- reference our style sheet -->
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link type="text/css" type="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user-profile.css" />
<TITLE>Login</TITLE>
<style>
.failed {
	color: red;
}
</style>
</head>

<body>
	<!--  background="${pageContext.request.contextPath}/resources/Login-Wallpaper.jpg">-->



	<nav class="navigation-header"></nav>
	<nav class="navbar navbar-light bg-dark">
		<h2>
			<font color="white">User Login platform</font>
		</h2>
	</nav>

	<br>
	<br>
	<br>
	<div id="wrapper">
		<div id="header">
			<div align="center" id="container">
				<div id="content">
					<div class="card text-white bg-secondary mb-3"
						style="max-width: 30rem;">
						<div class="card-body justify-content-center">

							<form:form
								action="${pageContext.request.contextPath}/authenticateTheUser"
								method="POST" class="form-login text-center">

								<!-- Check for login error -->
								<c:if test="${param.error != null}">
									<div class="alert alert-danger color-xc-o">invalid
										username/password</div>
								</c:if>

								<!-- Check for logout -->
								<c:if test="${param.logout != null}">
									<div class="alert alert-success color-xc-o">You have been
										logged out.</div>
								</c:if>

								<h3 class="sub-header">Please Login</h3>

								<div class="form-group">
									<input class="input-box" id="UsernameInput" type="text"
										name="username" placeholder="Enter your username">
								</div>
								<div class="form-group">
									<input type="password" id="PasswordInput" name="password"
										placeholder="Enter your password">
								</div>
								<br>




								<button class="btn btn-success" id="LoginButton" type="submit">Login</button>

							</form:form>
							<form class="form-login text-center">

								<h3 class="sub-header">Please Login</h3>
								</br>
								<div class="form-group">
									<input class="input-box" id="UsernameInput" type="email"
										name="email" placeholder="Enter your email">
								</div>
								<div class="form-group">
									<input type="password" id="PasswordInput" name="password"
										placeholder="Enter your password">
								</div>
								<br>
								<button class="btn btn-success" id="LoginButton">Login</button>

								<br> <br>

								<h5 class="sub-header">Don't have an account?</h5>
								<input type="button" value="Click here"
									onclick="window.location.href='showFormForAdd'; return false;"
									class="add-button btn btn-primary" />

							</form>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>