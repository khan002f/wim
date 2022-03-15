<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {

var options4 = {
	title: {
		text: "Overall truck volume share"
	},
	subtitles: [{
		text: "As of May, 2021"
	}],
	animationEnabled: true,
	data: [{
		type: "pie",
		startAngle: 40,
		toolTipContent: "<b>{label}</b>: {y}%",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: [
		    { y: 44.50, label: "Class 7" },
			{ y: 30.60, label: "Class 8" },
			{ y: 10.50, label: "Class 9" },
			{ y: 14.40, label: "Class 10" },
			
		]
	}]
};
$("#chartContainer4").CanvasJSChart(options4);

}
</script>
</head>
<body>
<div id="chartContainer4" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>