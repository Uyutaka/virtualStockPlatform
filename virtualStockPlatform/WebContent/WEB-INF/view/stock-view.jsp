<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>User Profile</title>
<!-- reference our style sheet -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user-profile.css"/>
	<title>Profile</title>
</head>

<body>
		<div id="header">
			<h2>Stock Detail platform</h2>
		</div>

		<div id="container">
			<div id="content">
				<div class="card">
					<div class="card-body justify-content-center">
            <div id="leftPart">
              			<p><font face="verdana" size="4">1. Stock Name</font></p>
              				<p>${property.stockName}</p>
							<hr><br>
					    <p><font face="verdana" size="4">2. Current Price</font></p>
              				 <p>${price.close}</p>
							 <hr><br>
					    <p><font face="verdana" size="4">3. Stock Volume</font></p>
              				<p>${price.volume}</p>
              				<hr><br>
              
						  <input type="button" style="margin-right:50px;" id="submit" value="Buy"
								onclick="window.location.href='${buyLink}'" class="btn btn-dark"/>
			              <input type="button" id="submit" value="Sell"
								onclick="window.location.href='${sellLink}'" class="btn btn-dark"/>
            </div>
					</div>
				</div>
    	</div>
    
    
    <div id="rightPart">
        
      <!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_12e94"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/symbols/NASDAQ-AAPL/" rel="noopener" target="_blank"><span class="blue-text">AAPL Chart</span></a> by TradingView</div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "width": 700,
  "height": 490,
  "symbol": "NASDAQ:AAPL",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "Light",
  "style": "0",
  "locale": "en",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_12e94"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->
    </div>
</body>

</html>