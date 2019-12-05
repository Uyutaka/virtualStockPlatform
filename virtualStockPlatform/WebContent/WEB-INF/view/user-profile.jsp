<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>User Profile</title>
<!-- reference our style sheet -->z
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
							<c:param name="userId" value="${user.id}" />
						</c:url>
						<tr>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>
							<td>${user.balance}</td>
						</tr>
				</table>	
						<!-- display the update link -->
						<input type="button" value="Edit User"
					onclick="window.location.href='showFormForAdd'; return false;"
					class="edit-button" />				
			</div>
		</div>
	</div>
</body>
</html>tion.href='${checkLink}'"
<<<<<<< HEAD
					class="btn btn-dark" />				
=======
					class="btn btn-dark" />	
							
			</div>
		</div>
	</div>
</body>
</html>