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