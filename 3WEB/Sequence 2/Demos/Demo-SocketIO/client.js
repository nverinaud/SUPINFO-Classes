

	var client = io.connect(window.location.href);

	client.on('hello', function(data) {

		console.log('Socket says: "' + data.message + '"');

	});

	function sendKikoos() {
		setInterval(function(){
			client.emit('say', {'msg': 'Kikoo'});
		}, 1000);
	};