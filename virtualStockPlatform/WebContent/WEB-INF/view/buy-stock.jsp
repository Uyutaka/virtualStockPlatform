<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<title>User Buying</title>
<!-- reference our style sheet -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buy-stock.css"/>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h2>Buying Stock platform</h2>
		</div>
		<div id="container">
			<div id="content">
			<form:form action="sell" modelAttribute="transaction" method="POST">
				<form:hidden path="userId" />
				<form:hidden path="price"/>
				<form:hidden path="stockName" />
				<table class=table>
					 <thead class="thead-dark">
						<tr>
							<td>Stock Name</td>
							<td>Quantity Hold</td>
							<td>Current Price</td>
							<td>Balance</td>
					   </tr>
					</thead>
							<c:set var = "balance" value="${user.balance}" />
							<c:set var = "price" value="${price.close}" />
							<thead class="thead-light">
							<tr>
								<td>${property.stockName}</td>
								<td>${property.numStocks}</td>
								<td><fmt:formatNumber value = "${price}" 
         							type = "currency"/></td>
								<td><fmt:formatNumber value = "${balance}" 
         							type = "currency"/></td>
							</tr>
							</thead>
					</table>
							<!-- display the balance text use request.getParameter("BuyQuantity")-->	
							Quantity to buy(maximum # to buy <fmt:formatNumber type = "number" 
         						maxFractionDigits="0" value = "${balance/price}" />):  <form:input path="numToBuyOrSell" />
							<!-- display the update link -->
							<input type="submit" value="Check" class="btn btn-dark" />
				</form:form>			
			</div>
		</div>
	</div>
</body>
</html>