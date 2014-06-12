$(document).ready(function() {
    // page is now ready, initialize the calendar...
    'use strict'

    var mapsLat = 53.200117;
    var mapsLong= 5.809021;
    var url = GMaps.staticMapURL({
        size: [400, 1024],
        lat: mapsLat,
        lng: mapsLong
    });
    $('<img/>').attr('src', url).appendTo('#maps');

    $('.panel').on('mouseenter', function(){
        $('.panel-bar', this).removeClass("flipOutX").addClass("flipInX");
    }).on('mouseleave', function(){
        $('.panel-bar', this).removeClass("flipInX").addClass("flipOutX");
    });

    // Froala editor initialising
    $('form textarea').editable({inlineMode:false, height: 300,
                                buttons: ['undo', 'redo' , 'sep', 'bold', 'italic', 'underline', 'createLink','color'],
                                paragraphy: true});
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

    $("#calendar").fullCalendar({
        eventSources: [

            // your event source
            {
                url: '/events',
                type: 'GET',
                lang: 'nl',
                columnFormat:{
                    month: 'ddd',    // Mon
                    week: 'ddd M/D', // Mon 9/7
                    day: 'dddd'      // Monday
                },
                error: function(e) {
                    console.log(e);
                    alert('there was an error while fetching events!');
                }
            }

            // any other sources...

        ]
    });
    // Initialise the fullcalendar (v 1.6.3)
    // $('#calendar').fullCalendar({
    //     header: {
    //         left: 'prev,next today',
    //         center: 'title',
    //         right: 'month,basicWeek,basicDay'
    //     },
    //     defaultView: 'basicWeek',
    //     eventClick: function(calEvent, jsEvent, view) {
    //         var loc = self.location;
    //         console.log(calEvent);
    //         console.log(jsEvent);
    //         console.log(view);
    //         window.location = "http://localhost:3000/events/" + calEvent.id;
    //     },
    //     events: '/events'
    
    // });
    //$(".current-page-item").parents('li, ul', this).addClass('current-page-item');
});