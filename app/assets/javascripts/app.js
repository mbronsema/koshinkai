$(document).ready(function() {
    // page is now ready, initialize the calendar...
    'use strict'
    var mapsLat = 53.200117;
    var mapsLong= 5.809021;
    var maps = new GMaps({
      div: '#maps',
      lat: mapsLat,
      lng: mapsLong
    });
    maps.addMarker({
      lat: mapsLat,
      lng: mapsLong,
      title: 'Koshinkai',
        infoWindow: {
          content: '<h2>Aikidovereniging Koshinkai</h2><p>Emmakade 59, Leeuwarden</p>'
        }

    });
    maps.drawOverlay({
        content: "<div class='arrow-'></div>"
    });

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
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        defaultView: 'basicWeek',
        eventClick: function(calEvent, jsEvent, view) {
            var loc = self.location;
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