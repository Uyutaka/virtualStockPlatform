<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>List Users</title>
<!-- reference our style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/add-user-style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>URM - User Relationship Manager</h2>
		</div>

		<div id="container">
			<div id="content">
				<select id = 'stockName' name='stock'>
					<option value="AMZN">AMAZON</option>
					<option value="GOOG">GOOGLE</option>
				</select>
				
				<c:url var="selectLink" value="/user/sell">
							<c:param name="userId" value="${user.id}" />
				</c:url>
				<td><a href="${selectLink}">Check</a></td>
			</div>
		</div>
	</div>
</body>
</html>