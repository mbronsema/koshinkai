$(document).ready(function() {
    // page is now ready, initialize the calendar...
    'use strict'
    // Froala editor initialising
    $('form textarea').editable({inlineMode:false, height: 300,
                                buttons: ['undo', 'redo' , 'sep', 'bold', 'italic', 'underline', 'createLink','color']});
    $("header").fitVids();
    $('.nav li.dropdown a').hover( function(e){
        console.log($(this, 'ul.dropdown-menu'));
    });
    // Initialise the datetimepicker
	$('[data-behaviour~=datepicker]').datetimepicker({
		format: 'YYYY-MM-DD HH:mm',
		maskInput: true,
		pick12HourFormat: false,
		showToday: true,
		language: 'nl'
	});
    // Initialise the fullcalendar
    $('#calendar').fullCalendar({
        eventClick: function(calEvent, jsEvent, view) {
            console.log(calEvent);
            console.log(jsEvent);
            console.log(view);
            window.location = "http://localhost:3000/events/" + calEvent.id;
        },
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