(function(){
	'use strict';

	window.onload = function(){

		var addressResultView = document.getElementById('address-result');
		var whereAmIButton = document.getElementById('where-am-i-button');

		whereAmIButton.addEventListener('click', function(event){

			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude;
				var lng = position.coords.longitude;

				addressResultView.innerHTML = lat + ',' + lng;

				var geocoder = new google.maps.Geocoder();
				var latlng = new google.maps.LatLng(lat, lng);

				geocoder.geocode({'latLng': latlng}, function(results, status) {

					if (status == google.maps.GeocoderStatus.OK)
					{
						addressResultView.innerHTML = results[0].formatted_address;
					}
					else
					{
						console.log('Geocode failed: ' + status);
					}

				});

			});

		});
	}

})();
