function initialize() {
  var map_canvas = document.getElementById('map_canvas');
  var myLatlng = new google.maps.LatLng(39.9522, -75.1642);
  var map_options = {
    center: myLatlng,
    zoom: 11,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    mapTypeControl: false,
    draggable: true,
    zoomControl: false,
    panControl: false,
    streetViewControl: false,
    scrollwheel: true
  }
  var map = new google.maps.Map(map_canvas, map_options)
  map.set('styles', [
		{
			"featureType": "landscape",
			"elementType": "geometry.fill",
			"stylers": [
			  { "hue": "#ffbb00" },
			  { "saturation": 83 },
			  { "lightness": 19 },
			  { "gamma": 0.37 }
			]
		},

		{
			"featureType": "road",
			"elementType": "geometry.fill",
			"stylers": [
				{ "hue": "#ffbb00" },
				{ "saturation": 83 },
				{ "lightness": 19 },
				{ "gamma": 0.37 }
			]
  		},
  		{
		    "featureType": "poi",
		    "elementType": "geometry.fill",
		    "stylers": [
		      { "hue": "#ffbb00" },
		      { "saturation": 83 },
		      { "lightness": 19 },
		      { "gamma": 0.37 }
		    ]
 		},  	
  ]);
}
google.maps.event.addDomListener(window, 'load', initialize);