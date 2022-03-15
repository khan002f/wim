<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {

var options1 = {
	animationEnabled: true,  
	title:{
		text: "Traffice Pattern"
	},
	axisX: {
		valueFormatString: "MMM"
	},
	axisY: {
		title: "Vehicle Weight",
		prefix: "",
		includeZero: false
	},
	data: [{
		yValueFormatString: "#,###",
		xValueFormatString: "MMMM",
		type: "spline",
		dataPoints: [
			{ x: new Date(2017, 0), y: 125060 },
			{ x: new Date(2017, 1), y: 227980 },
			{ x: new Date(2017, 2), y: 233800 },
			{ x: new Date(2017, 3), y: 249400 },
			{ x: new Date(2017, 4), y: 140260 },
			{ x: new Date(2017, 5), y: 233900 },
			{ x: new Date(2017, 6), y: 348000 },
			{ x: new Date(2017, 7), y: 131500 },
			{ x: new Date(2017, 8), y: 132300 },
			{ x: new Date(2017, 9), y: 242000 },
			{ x: new Date(2017, 10), y: 152160 },
			{ x: new Date(2017, 11), y: 249400 }
		]
	}]
	
};
	$("#chartContainer1").CanvasJSChart(options1);	
	var options2 = {
			animationEnabled: true,  
			title:{
				text: "Vehicle Load Trend "
			},
			axisY: {
				title: "Cumulative Weight",
				valueFormatString: "#0,,.",
				suffix: "mn",
				prefix: ""
			},
			data: [{
				type: "area",
				markerSize: 5,
				xValueFormatString: "YYYY",
				yValueFormatString: "#,##0.##",
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
			toolTipContent: "<b>{name}</b><br/>Vehicle Class: {x} <br/> Volume: {y}<br/> Cumulative Weight: {z}mn",
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

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

	<div id="chartContainer1" style="height: 200px; max-width: 400px; margin: 10px auto; float:left;"></div>
	<!-- div id="chartContainer1" style="height: 200px; max-width: 400px; margin: 10px auto; float:left;"></div-->





<div id="chartContainer2" style="height: 200px; max-width: 400px; margin: 0px auto; "></div>
<br/><br/><br/>

<div id="chartContainer3" style="height: 200px; max-width: 400px; margin: 0px auto;  float:left;"></div>

<div id="chartContainer4" style="height: 200px; max-width: 400px; margin: 0px auto;"></div>


</body>
</html>