$(function () {

	if (!$('#line-chart').length) { return false; }
	
	line ();

	$(window).resize (App.debounce (line, 325));

});

function line () {
	$('#line-chart').empty ();

	Morris.Line({
		element: 'line-chart',
		data: [
			{ y: '2011', a: 50,  b: 55 , c:65},
			{ y: '2012', a: 50,  b: 45 , c:70},
			{ y: '2013', a: 75,  b: 60 , c:85},
			{ y: '2014', a: 65,  b: 40 , c:80},
			{ y: '2015', a: 75,  b: 65 , c:70},
			{ y: '2016', a: 80,  b: 90 , c:75}
		],
		xkey: 'y',
		ykeys: ['a', 'b', 'c'],
		labels: ['Company A', 'Company B', 'Company C'],
		lineColors: App.chartColors
	});
}