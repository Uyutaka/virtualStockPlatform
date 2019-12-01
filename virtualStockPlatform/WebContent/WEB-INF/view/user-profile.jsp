<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>User Profile</title>
<!-- reference our style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user-profile.css"/>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>User profile platform</h2>
		</div>

		<div id="container">
			<div id="content">

				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Balance</th>
					</tr>
					<c:url var="updateLink" value="/user/showFormForUpdate">
							<c:param name="userId" value="${tempUser.id}" />
						</c:url>
						<tr>
							<td>${User.firstName}</td>
							<td>${User.lastName}</td>
							<td>${User.email}</td>
							<td>${User.balance}</td>
						</tr>
						<!-- display the update link -->
						<input type="button" value="Edit User"
					onclick="window.location.href='showFormForAdd'; return false;"
					class="edit-button" />
				</table>	
			</div>
		</div>
	</div>
</body>
</html>