(function(){
	'use strict';

	var videoLoader = document.getElementById('videoLoader')
	, player = document.getElementById('player')
	, videoURLInput = document.getElementById('video_url');

	videoLoader.onsubmit = function(event) {
		event.preventDefault();

		var url = videoURLInput.value;
		
		player.src = url;
	};

	player.addEventListener('loadeddata', function(event) {
		event.target.play();
	}, true);

})();
