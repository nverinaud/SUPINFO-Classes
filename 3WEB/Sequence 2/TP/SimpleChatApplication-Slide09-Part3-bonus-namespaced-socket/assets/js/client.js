(function(){
	'use strict';

	var form = document.getElementById('new-message-form');
	var $placeholderMessage = $('#placeholder-message');
	var $chatroom = $('#chatroom');

	// Socket.IO
	var host = window.location.hostname;
	var socket = io.connect('http://' + host + ':1337/messages');
	socket.on('new message', function(message) {
		renderMessage(message);
	});

	// Submit new message
	form.addEventListener('submit', function(event) {
		event.preventDefault();

		var msgField = document.getElementById('msg-field');
		var msg = msgField.value;
		
		if(msg) 
		{
			socket.emit('post message', msg);
			msgField.value = "";
		}
	});

	// Rendering
	function renderMessage(message)
	{
		var $bq = null;

		if ($placeholderMessage)
		{
			$placeholderMessage.remove();
			$placeholderMessage = null;
		}

		$bq = $('<blockquote />');
		$bq.html(message);
		$chatroom.append($bq);
	}
})();
