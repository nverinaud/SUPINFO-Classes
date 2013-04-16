(function(){
	'use strict';

	// DOM
	var form = document.getElementById('new-message-form'),
		$chatroom = $('#chatroom'),
		$messageTemplate = $('#message-template').removeAttr('id'),
		messageTemplate = $chatroom.html(),
		$statusEl = $('#status'),
		$sayItButton = $('#say-it-button'),
		$msgField = $('#msg-field');

	// i18n
	$sayItButton.text(chrome.i18n.getMessage('Send'));
	$msgField.attr('placeholder', chrome.i18n.getMessage('Say_something'));
	$statusEl.text(chrome.i18n.getMessage('Offline'));

	// Mustache template
	$messageTemplate.remove();
	$.Mustache.add('message-template', messageTemplate);

	// Chrome API
	var localStorage = chrome.storage.local;

	// Data
	var messages = [],
		unsentMessages = [];

	localStorage.get('messages', function(rawMessages) {
		if (typeof rawMessages == 'String')
			messages = JSON.parse(rawMessages);

		messages.forEach(function(message) {
			renderMessage(message);
		});
	});

	// Socket.IO
	var host = 'localhost',
		socket = io.connect('http://' + host + ':1337/messages'),
		isOnline = false;

	socket.on('connect', function() {
		// Clear the local storage
		localStorage.remove('messages');
		messages = [];
		
		// Update state
		$statusEl.text(chrome.i18n.getMessage('Online'));
		$statusEl.removeClass('btn-danger').addClass('btn-success');
		isOnline = true;

		// Send unsent messages
		$chatroom.children('.message-unsent').remove();
		sendUnsentMessages();
		localStorage.remove('unsent-messages');
		unsentMessages = [];
	});

	socket.on('disconnect', function() {
		$statusEl.text(chrome.i18n.getMessage('Offline'));
		$statusEl.removeClass('btn-success').addClass('btn-danger');
		isOnline = false;
	});

	socket.on('new message', function(message) {
		messages.push(message);
		localStorage.set({'messages': JSON.stringify(messages)});
		renderMessage(message, false);
		notifyMessage(message);
	});

	// Submit new message
	form.addEventListener('submit', function(event) {
		event.preventDefault();

		var msgField = document.getElementById('msg-field'),
			msg = msgField.value;
		
		if(msg) 
		{
			if (isOnline)
			{
				socket.emit('post message', msg);
			}
			else
			{
				unsentMessages.push(msg);
				localStorage.set({'unsent-messages': JSON.stringify(unsentMessages)});
				renderMessage(msg, true);
			}

			msgField.value = "";
		}
	});

	// Rendering
	function renderMessage(message, isUnsent)
	{
		var now = new Date();
		var nowStr = now.toLocaleTimeString();
		var data = {
			'date': nowStr,
			'message' : message
		};

		var $msgEl = $($.Mustache.render('message-template', data));
		if (isUnsent)
			$msgEl.addClass('message-unsent');

		$chatroom.append($msgEl);

		$chatroom.animate({ 
			scrollTop: $chatroom.prop("scrollHeight") 
		}, 50);
	}

	// Sending unsent messages
	function sendUnsentMessages()
	{
		unsentMessages.forEach(function(msg) {
			socket.emit('post message', msg);
		});
	}

	// Chrome notification
	function notifyMessage(message)
	{
		var notification = webkitNotifications.createNotification(null, 'John Doe', message);
		notification.show();
	}
})();
