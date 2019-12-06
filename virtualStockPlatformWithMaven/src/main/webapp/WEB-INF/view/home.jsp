<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<html>
<body>
	<h1>Hello world haha</h1>

	<!-- display user name and role -->
	<p>
		<security:authorize access="isAuthenticated()">
    authenticated as <security:authentication
				property="principal.username" />
		</security:authorize>
		
	
	</p>

	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>