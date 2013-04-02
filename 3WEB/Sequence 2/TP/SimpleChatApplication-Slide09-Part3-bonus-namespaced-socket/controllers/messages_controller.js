// Data
var messages = [];

/*
 * Socket.IO
 */
exports.connectTo = function(ioSockets) {
	ioSockets.on('connection', function(socket) {
		if (messages.length > 0)
		{
			messages.forEach(function(message) {
				socket.emit('new message', message);
			});
		}

		socket.on('post message', function(message) {
			messages.push(message);
			ioSockets.emit('new message', message);
		});
	});
};