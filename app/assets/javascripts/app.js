$(document).ready(function() {
    // page is now ready, initialize the calendar...
    'use strict'
    $('form textarea').editable({inlineMode:false, height: 300});
	$('[data-behaviour~=datepicker]').datetimepicker({
		format: 'YYYY-MM-DD hh:mm',
		maskInput: true,
		pick12HourFormat: false,
		showToday: true,
		language: 'nl'
	});

    $('#calendar').fullCalendar({
    	eventSources:[
    		{
    			url: '/events',
    			type: 'GET',
    			error: function(){
    				alert('couldn\'t find the feed')
    			},
    			color: '#108ac2',
    			textColor: 'white'
       		}
    	]
    
    });
});