$(function () {

	if (!$('#bar-chart').length) { return false; }
	
	bar ();

	$(window).resize (App.debounce (bar, 325));

});

function bar () {
	$('#bar-chart').empty ();

	Morris.Bar({
		element: 'bar-chart',
		data: [
			{ y: '2013', a: 50,  b: 40, c: 60 },
			{ y: '2014', a: 75,  b: 65, c: 75 },
			{ y: '2015', a: 50,  b: 40, c: 65 },
			{ y: '2016', a: 75,  b: 65, c: 40 }
		],
		xkey: 'y',
		ykeys: ['a', 'b', 'c'],
		labels: ['Series A', 'Series B', 'Series C'],
		barColors: App.chartColors
	});
}


$(function () {

	if (!$('#bar-chart2').length) { return false; }

	bar2 ();

	$(window).resize (App.debounce (bar2, 325));

});

function bar2 () {
	$('#bar-chart2').empty ();

	Morris.Bar({
		element: 'bar-chart2',
		data: [
			{ y: '2013', a: 50,  b: 40},
			{ y: '2014', a: 75,  b: 65},
			{ y: '2015', a: 50,  b: 40},
			{ y: '2016', a: 75,  b: 65}
		],
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['Emergency Room', 'Urgent Care'],
		barColors: App.chartColors
	});
}




$(function () {

	if (!$('#bar-chart3').length) { return false; }

	bar3 ();

	$(window).resize (App.debounce (bar3, 325));

});


function bar3 () {
	$('#bar-chart3').empty ();

	Morris.Bar({
		element: 'bar-chart3',
		data: [
			{ y: '2013', a: 50,  b: 40},
			{ y: '2014', a: 75,  b: 65},
			{ y: '2015', a: 50,  b: 40},
			{ y: '2016', a: 75,  b: 65}
		],
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['Generic', 'Maintenance'],
		barColors: App.chartColors
	});
}




$(function () {

	if (!$('#bar-chart4').length) { return false; }

	bar4 ();

	$(window).resize (App.debounce (bar4, 325));

});

function bar4 () {
	$('#bar-chart4').empty ();

	Morris.Bar({
		element: 'bar-chart4',
		data: [
			{ y: 'TClass 1', a: 50,  b: 40},
			{ y: 'TClass 2', a: 75,  b: 65},
			{ y: 'TClass 3', a: 50,  b: 40},
			{ y: 'TClass 4', a: 75,  b: 65},
			{ y: 'TClass 5', a: 65,  b: 60},
			{ y: 'TClass 6', a: 72,  b: 68}
		],
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['Therapeutic Class'],
		barColors: App.chartColors
	});
}
