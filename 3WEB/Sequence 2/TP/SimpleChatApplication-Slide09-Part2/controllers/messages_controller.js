// Requires
var url 			= require('url'),
	WebSocketServer	= require('websocket').server; // https://github.com/Worlize/WebSocket-Node

// Data
var messages 	= [],
	msgBuffer 	= null;

exports.index = function(req, res) 
{
	res.setHeader('content-type', 'application/json');
	var result = {};

	if (messages.length > 0) 
	{
		var params = url.parse(req.url, true).query;
		var sinceId = params.since_id;

		if (sinceId > 0)
			result.messages = messages.slice(sinceId);
		else
			result.messages = messages;

		result.refresh_url = "/messages?since_id=" + (messages.length);
		result.count = result.messages.length;

		res.statusCode = 200;
		res.write(JSON.stringify(result));
	} 
	else 
	{
		result.count = 0;
		result.messages = [];
		result.refresh_url = "/messages";

		res.statusCode = 204;
		res.write(JSON.stringify(result));
	}

	res.end();
};

// Utils
Array.prototype.removeObjectAtIndex = function(index) {
	return this.splice(index, 1);
};

Array.prototype.removeObject = function(object) {
	var index = this.indexOf(object);
	if (index !== -1)
		this.removeObjectAtIndex(index);
	return;
};

/*
 * WebSocket
 */
var wsServer = null;
var connections = [];

exports.connectWebsocketWithServer = function(server) {
	if(!wsServer) 
	{
		wsServer = new WebSocketServer({
			httpServer: server,
			autoAcceptConnections: false
		});

		wsServer.on('request', function(req) {
			var connection = req.accept('simple-chat-protocol', req.origin);
			console.log(new Date() + ' Peer ' + connection.remoteAddress + ' connected.');

			connections.push(connection);
			console.log(new Date() + ' ' + connections.length + ' peers connected.');

			connection.on('message', function(message) {
				var msg = message.utf8Data;
				console.log(new Date() + ' Received message: ' + msg);
				messages.push(msg);

				connections.forEach(function(destination) {
					destination.sendUTF(msg);
				});
			});

			connection.on('close', function(reasonCode, description) {
				console.log(new Date() + ' Peer ' + connection.remoteAddress + ' disconnected.');
				connections.removeObject(connection);
				console.log(new Date() + ' ' + connections.length + ' peers connected.');
			});
		});
	}
}