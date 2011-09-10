jQuery(document).ready(function() {
	
	jQuery("a#login_link").fancybox({
		'width' : 500,
		'height' : 360,
		'padding': 25,
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
  
  jQuery("#intro_video_link").click(function() {
		jQuery.fancybox({
			'padding'		: 0,
			'autoScale'		: false,
			'transitionIn'	: 'none',
			'transitionOut'	: 'none',
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