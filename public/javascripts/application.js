jQuery(document).ready(function() {
  
  if (jQuery(".grey_button").length > 0) {
    jQuery(".grey_button").button();
  }
  
  /* Setup popup login link */
	jQuery("a#login_link").fancybox({
		'width' : 500,
		'height' : 425,
		'padding': 25,
    'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic',
		'autoDimensions': false,
		'overlayOpacity' : 0.4,
		'overlayColor' : 'black',
		'overlayShow' : true,
		'scrolling' : 'no',
		'titleShow' : true,
		'onClosed' : function() {
			//$("#login_error").hide();
		}
  });
  
  /* Setup intro video on sidebar */
  jQuery("#intro_video_link").click(function() {
		jQuery.fancybox({
			'padding'		: 0,
			'autoScale'		: false,
			'transitionIn'	: 'elastic',
			'transitionOut'	: 'elastic',
			'title'			: this.title,
			'width'			: 640,
			'height'		: 385,
			'href'			: this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
			'type'			: 'swf',
			'swf'			: {
			'wmode'				: 'transparent',
			'allowfullscreen'	: 'true'
			}
		});

		return false;
	});
  
  if (jQuery("#recent_activities").length > 0) {
    rotateRecentActivities();
  }
  
  /* Setup share check-in map */
  if (typeof Gmaps != "undefined") {
    Gmaps.map.HandleDragend = function(pos) {
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({
        latLng: pos
      }, function(responses) {
        if (responses && responses.length > 0) {
          jQuery("#check_in_location_latitude").val(pos.lat());
          jQuery("#check_in_location_longitude").val(pos.lng());
        } else {
          alert('Cannot determine address at this location.');
        }
      });
    };
    
    Gmaps.map.callback = function() {
      for (var i = 0; i < this.markers.length; i++) {
        google.maps.event.addListener(
          this.markers[i].serviceObject, 
          'dragend', 
          function() { 
            Gmaps.map.HandleDragend(this.getPosition()) 
          });
        }
      };  
    }
});

function about() {
	info = document.getElementById('about-content');
	if(window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhr.open("GET", "rails/info/properties", false);
	xhr.send("");
	info.innerHTML = xhr.responseText;
	info.style.display = 'block'
}

/* Update recent activities on home page with AJAX polling */
function updateRecentActivities () {
  if (jQuery(".recent_activity").length > 0) {
    var after = jQuery(".recent_activity:first-child").attr("data-time");
  } else {
    var after = "0";
  }
  jQuery.getScript("/activities.js?after=" + after)
  setTimeout(updateRecentActivities, 10000);
}

/* Rotate recent activities on home page */
var delay = 2000; // you can change it
var count = 14; // How much items to animate
var showing = 10; //How much items to show at a time
var i = 0;

function move(i) {
  return function() {
    $('#recent_activity_'+i).remove().css('display', 'none').prependTo('#recent_activities');
  }
}

function shift() {
  var toShow = (i + showing) % count;
  $('#recent_activity_'+toShow).slideDown(1000, move(i));
  $('#recent_activity_'+i).slideUp(1000, move(i));
  i = (i + 1) % count;
  setTimeout('shift()', delay);
}  

function rotateRecentActivities() {
  setTimeout('shift()', delay);
}