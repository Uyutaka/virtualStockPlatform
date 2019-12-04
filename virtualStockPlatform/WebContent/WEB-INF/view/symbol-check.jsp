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
				<select name='stock'>
					<option value="${selected}" selected>${selected}</option>
					<!-- loop over and load stocks -->
					<c:forEach var="tempStock" items="${stock}">
						<c:if test="${stock != selected}">
							<td>${tempStock.name}</td>
						</c:if>
					</c:forEach>
				</select>
				<td><a href="${selectLink}">Check</a></td>
			</div>
		</div>
	</div>
</body>
</html>