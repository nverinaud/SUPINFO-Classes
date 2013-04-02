(function(){
	'use strict';

	var form = document.getElementById('new-message-form');
	var $placeholderMessage = $('#placeholder-message');
	var $chatroom = $('#chatroom');
	var refreshURL = "/messages";

	// Update on page load
	updateMessages();

	// Websocket
	var websocket = new WebSocket("ws://localhost:1337/", "simple-chat-protocol");
	websocket.onmessage = function(event) {
		var message = event.data;
		renderMessages([ message ]);
	};

	// Submit new message
	form.addEventListener('submit', function(event) {
		event.preventDefault();

		var msgField = document.getElementById('msg-field');
		var msg = msgField.value;
		
		if(msg && websocket.readyState == WebSocket.OPEN) 
		{
			msgField.value = "";
			websocket.send(msg);
		}
	});

	// Retrieve the last posted message
	function updateMessages() 
	{
		var request = newXHR();
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) 
			{
				var result = JSON.parse(request.responseText);
				refreshURL = result.refresh_url;
				renderMessages(result.messages);
			}
		}

		request.open('GET', refreshURL, true);
		request.send(null);
	}

	// Rendering
	function renderMessages(messages)
	{
		var $bq = null;

		if ($placeholderMessage && messages.length > 0)
		{
			$placeholderMessage.hide();
			$placeholderMessage = null;
		}

		messages.forEach(function(message) {
			$bq = $('<blockquote />');
			$bq.html(message);
			$chatroom.append($bq);
		});
	}

	// Utils
	function newXHR() 
	{
		var xhr = null;
		if (window.XMLHttpRequest) // Mozilla, Safari, ...
		    xhr = new XMLHttpRequest();
		else if (window.ActiveXObject) // IE
		    xhr = new ActiveXObject("Microsoft.XMLHTTP");

		return xhr;
	}

})();
