<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<<<<<<< HEAD
				<select id = 'stockName' name='stock'>
					<option value="AMZN">AMAZON</option>
					<option value="GOOG">GOOGLE</option>
				</select>
				
				<c:url var="selectLink" value="/user/sell">
							<c:param name="userId" value="${user.id}" />
							<c:param name="stockName" value="${StockInfo.name}" />
				</c:url>
				<td><a href="${selectLink}">Check</a></td>
=======
				<form:form action="sellStock" modelAttribute="userSymbolCheck" method="POST">
					<form:hidden path="userId" />
					<form:select path="stockName" items="${stocks}"/>
					<input type="submit" value="Check" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>