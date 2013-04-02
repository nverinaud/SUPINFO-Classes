// Requires
var io	= require('socket.io'); // http://socket.io

// Data
var messages = [];

/*
 * Socket.IO
 */
exports.connectWebsocketWithServer = function(server) {
	io = io.listen(server);

	io.sockets.on('connection', function(socket) {
		if (messages.length > 0)
		{
			messages.forEach(function(message) {
				socket.emit('new message', message);
			});
		}

		socket.on('post message', function(message) {
			messages.push(message);
			io.sockets.emit('new message', message);
		});
	});
};