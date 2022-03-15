<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
window.onload = function() {

var options3 = {
	animationEnabled: true,
	zoomEnabled: true,
	theme: "light2",
	title: {
		text: "Overweight vehicle analysis"
	},
	subtitles: [{
		text: "Traffic analysis",
		fontSize: 15
	}],
	axisX: {
		title: "Class Type"
	},
	axisY: {
		title: "Volume"
	},
	data: [{
		type: "bubble",
		xValueFormatString: "#,#0.0",
		yValueFormatString: "#,#0.0",
		zValueFormatString: "#,#0.0",
		toolTipContent: "<b>{name}</b><br/>Crude Death Rate: {x} <br/> Crude Birth Rate: {y}<br/> Population: {z}mn",
		dataPoints: [
			
			{ x: 1, y: 11.7, z: 6.75, name: "Class 1" },
			{ x: 2, y: 11.8, z: 65.3, name: "Class 2" },
			{ x: 3, y: 10, z: 48.69, name: "Class 3" },
			{ x: 4, y: 11.8, z: 59.85, name: "Class 4" },
			{ x: 5, y: 10.8, z: 176.70, name: "Class 5" },
			{ x: 6, y: 10.8, z: 66.31, name: "Class 6" },
			{ x: 7, y: 9.6, z: 45.4, name: "Class 7" },
			{ x: 8, y: 10.7, z: 62.5, z: "Class 8" },
			{ x: 9, y: 10.1, z: 54.96, name: "Class 9" },
			{ x: 10, y: 7.8, z: 160.66, name: "Class 10" },
			{ x: 11, y: 8.4, z: 10.34, name: "Class 11" },
			
		]
	}]
};
$("#chartContainer3").CanvasJSChart(options3);

}
</script>
</head>
<body>
<div id="chartContainer3" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html> 