<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!--Load the AJAX API-->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		//let chartData; //동기식일때 필요함.    변수 선언하고
		
		//ajax로 데이터 받기
		$.ajax({
			url : " resources/chart.json",
			dataType : "json",
			//async : false  동기식으로 호출시 async 써줌 이거 없음 chartData = result 하기도 전에 addRows에 들어감
		//동기식 호출
		}).done(function(result) { //결과 담기
			chartDraw(result);
		})
		
		function chartDraw(chartData){  //chartData인수로 받기
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows(chartData); 

		// Set chart options
		var options = {
			'title' : 'How Much Pizza I Ate Last Night',
			'width' : 400,
			'height' : 300
			};
		
	

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
		}

	}
</script>
</head>

<body>
	<!--Div that will hold the pie chart-->
	<div id="chart_div"></div>
</body>
</html>