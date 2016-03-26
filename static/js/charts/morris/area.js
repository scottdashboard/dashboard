$(function () {

	if (!$('#area-chart').length) { return false; }
	
	area ();	

	$(window).resize (App.debounce (area, 250));

});

function area () {
	$('#area-chart').empty ();

	Morris.Area ({
		element: 'area-chart',
		data: [
			{period: '2014 Q1', Medical: 2666, Rx: 3476, Paid: 2647},
			{period: '2014 Q2', Medical: 2778, Rx: 2294, Paid: 2441},
			{period: '2014 Q3', Medical: 4912, Rx: 1969, Paid: 2501},
			{period: '2014 Q4', Medical: 3767, Rx: 3597, Paid: 5689},
			{period: '2015 Q1', Medical: 6810, Rx: 1914, Paid: 2293},
			{period: '2015 Q2', Medical: 5670, Rx: 4293, Paid: 1881},
			{period: '2015 Q3', Medical: 4820, Rx: 3795, Paid: 1588},
			{period: '2015 Q4', Medical: 15073, Rx: 5967, Paid: 1175},
			{period: '2016 Q1', Medical: 10687, Rx: 4460, Paid: 2028},
			{period: '2016 Q2', Medical: 8432, Rx: 5713, Paid: 1791}
		],
		xkey: 'period',
		ykeys: ['Medical', 'Rx', 'Paid'],
		labels: ['Medical', 'Rx', 'Paid'],
		pointSize: 3,
		hideHover: 'auto',
		lineColors: [App.chartColors[0], App.chartColors[1], App.chartColors[3]]
	});
}


