$(function () {
	
    if (!$('#donut-chart').length) { return false; }

	donut ();

	$(window).resize (App.debounce (donut, 325));

});

function donut () {
	$('#donut-chart').empty ();

	Morris.Donut({
        element: 'donut-chart',
        data: [
            {label: 'Urgent Care', value: 25 },
            {label: 'Office Visit', value: 40 },
            {label: 'Emergency', value: 25 },
            {label: 'Specialty', value: 10 }
        ],
        colors: App.chartColors,
        hideHover: true,
        formatter: function (y) { return y + "%" }
    });
}








