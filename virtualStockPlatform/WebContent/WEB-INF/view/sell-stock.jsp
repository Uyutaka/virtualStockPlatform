<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>List Users</title>
<!-- reference our style sheet -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user-profile.css"/>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h2>User profile platform</h2>
		</div>
		<div id="container">
			<div id="content">
			<table class=table>
				 <thead class="thead-dark">
					<tr>
						<td>Stock Name</td>
						<td>Quantity Hold</td>
						<td>Current Price</td>
						<td>Balance</td>
				   </tr>
				</thead>
					<c:url var="updateLink" value="/property/sellCheck">
						<c:param name="userId" value="${Property.userId}" />
						<c:param name="stockName" value="${StockInfo.name}" />
						<c:param name="currenPrice" value="${currenPrice}" />
					</c:url>
						<thead class="thead-light">
						<tr>
							<td>${StockInfo.Name}</td>
							<td>${Property.numStocks}</td>
							<td>${currenPrice}</td>
							<td>${Property.balance}</td>
						</tr>
						</thead>
				</table>
						<!-- display the balance text use request.geetParameter("SellQuantity")-->	
						Quantity to sell <input type="text" id="SellQuantity" placeholder="type # of stocks" />
						<!-- display the update link -->
						<input type="button" value="Check"
					onclick="window.location.href='${updateLink}'; return false;"
					class="btn btn-dark" />				
			</div>
		</div>
	</div>


</body>
</html>