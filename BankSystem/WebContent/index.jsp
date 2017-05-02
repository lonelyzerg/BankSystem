<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<title>Welcome to Bank</title>
</head>
<body>
	<%
	session.invalidate();
	%>

	<div id="Header">
		<div id="Logo">
			<a href="index.html"><img src="resource/logo.png" width="290"
				height="119" alt="" /></a>
		</div>
		<div id="login">
			<a href="login.jsp" rel="nofollow">Login|Register</a>
		</div>
		<div id="login_after"></div>
	</div>

	<br>
	<br>
	<div class="box4">
		<div class="border4">
			<div>Stock market fell by 2% points</div>
			<div>1 US Dollar = 0.92 Euro.</div>
			<div>Bank business rose by 3% points.</div>
			<div>1 CNY = 0.1449 US Dollar.</div>
			<div>Earn a $200 cash rewards bonus.</div>
			<div>Federal Reserve rate hike.</div>
			<div>.....</div>
		</div>
	</div>


	<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
	<script language="JavaScript">
		$(document).ready(function() {  
		   var chart = {      
		      type: 'pie',     
		      options3d: {
		         enabled: true,
		         alpha: 45,
		         beta: 0
		      }
		   };
		   var title = {
		      text: 'Bank Annual Financial Summary'   
		   };   
		   var tooltip = {
		      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		   };
		
		   var plotOptions = {
		      pie: {
		          allowPointSelect: true,
		          cursor: 'pointer',
		          depth: 35,
		          dataLabels: {
		             enabled: true,
		             format: '{point.name}'
		          }
		      }
		   };   
		   var series= [{
		         type: 'pie',
		            name: 'Browser share',
		            data: [
		            	{
		                    name: 'Checking Account',
		                    y: 45.0,
		                    sliced: true
		                },
		                {
		                    name: 'Credit Card',
		                    y: 26.8,
		                    sliced: true
		                },
		                {
		                    name: 'Debit Card',
		                    y: 12.8,
		                    sliced: true,
		                    selected: true
		                },
		                ['Saving Account',    8.5],
		                ['Check',     6.2],
		                ['Others',   0.7]
		            ]
		   }];     
		      
		   var json = {};   
		   json.chart = chart; 
		   json.title = title;       
		   json.tooltip = tooltip; 
		   json.plotOptions = plotOptions; 
		   json.series = series;   
		   $('#container').highcharts(json);
		});
</script>

	<div id="Summary" style="width: 550px; height: 400px; margin: 0 auto">
		<br>
		<H2>Plan for retirement</H2>
		Wherever you are on your road to retirement, Bank can provide the
		information and resources you need to help you pursue your goals. <br>
		<br>
		<H2>Headed to College?</H2>
		Study hard to earn your bonus Putting your needs at the heart of our
		business <br> <br>
		<H2>Build your own credit card</H2>
		Compare credit cards From cash back to travel rewards, Bank offers a
		wide variety of credit cards <br> <br>

	</div>


	</marquee>
</body>
</html>

