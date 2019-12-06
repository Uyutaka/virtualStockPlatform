<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<title>Warning Page</title>
<!-- reference our style sheet -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Warning.css"/>
</head>
<body >

	<div id="wrapper">
		<div id="header">
			<h2>Symbol Check</h2>
		</div>

		<div id="container">
			<div id="content">
				<div align="center" id="container">
					<div id="content">
						<div class="card bg-secondary mb-3" style="max-width: 50rem;">
					      	<div class="card-body justify-content-center">
					        <img src="${pageContext.request.contextPath}/resources/Warning.png" 
					        		class="img-rounded" height="200" width="200">
								<h1 class="display-4" color="red">Invalid Operation Warning</h1>
								<p style="font-family:courier;"><u>Your operation is invalid due 
									since your operation already access the balance you have! </u></p>
					        	<button type="button" class="btn btn-danger" onclick="">Back to profile</button>
					      </div>
					 </div>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>