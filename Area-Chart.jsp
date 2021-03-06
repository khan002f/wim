<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,MyConnection.DB_con,java.io.*,java.util.*,consumer.kafkaFetch" errorPage="admin/erro.jsp" %>
<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {

var options2 = {
	animationEnabled: true,  
	title:{
		text: "Company Revenue by Year"
	},
	axisY: {
		title: "Revenue in USD",
		valueFormatString: "#0,,.",
		suffix: "mn",
		prefix: "$"
	},
	data: [{
		type: "area",
		markerSize: 5,
		xValueFormatString: "YYYY",
		yValueFormatString: "$#,##0.##",
		dataPoints: [
			{ x: new Date(2000, 0), y: 2289000 },
			{ x: new Date(2001, 0), y: 2830000 },
			{ x: new Date(2002, 0), y: 1009000 },
			{ x: new Date(2003, 0), y: 1840000 },
			{ x: new Date(2004, 0), y: 1396000 },
			{ x: new Date(2005, 0), y: 2613000 },
			{ x: new Date(2006, 0), y: 1821000 },
			{ x: new Date(2007, 0), y: 1000000 },
			{ x: new Date(2008, 0), y: 1397000 },
			{ x: new Date(2009, 0), y: 1506000 },
			{ x: new Date(2010, 0), y: 1798000 },
			{ x: new Date(2011, 0), y: 2386000 },
			{ x: new Date(2012, 0), y: 4704000},
			{ x: new Date(2013, 0), y: 4926000 },
			{ x: new Date(2014, 0), y: 1394000 },
			{ x: new Date(2015, 0), y: 972000 },
			{ x: new Date(2016, 0), y: 1140000 }
		]
	}]
};
$("#chartContainer2").CanvasJSChart(options2);

}
</script>
</head>
<body>
<div id="chartContainer2" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>