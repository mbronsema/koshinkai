$(document).ready(function() {
    // page is now ready, initialize the calendar...
    'use strict'
    // Froala editor initialising
    $('form textarea').editable({inlineMode:false, height: 300,
                                buttons: ['undo', 'redo' , 'sep', 'bold', 'italic', 'underline', 'createLink','color']});
    $("header").fitVids();
    // Initialise the datetimepicker
	$('[data-behaviour~=datepicker]').datetimepicker({
		format: 'YYYY-MM-DD hh:mm',
		maskInput: true,
		pick12HourFormat: false,
		showToday: true,
		language: 'nl'
	});
    // Initialise the fullcalendar
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