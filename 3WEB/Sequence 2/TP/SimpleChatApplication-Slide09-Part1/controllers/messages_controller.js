// Requires
var url = require('url');

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


exports.newMessage = function(req, res) 
{
	req.on('data', function(chunk) 
	{
		chunkStr = chunk.toString();
		if (!msgBuffer)
			msgBuffer = chunkStr;
		else
			msgBuffer += chunkStr;
	});

	req.on('end', function() 
	{
		if (msgBuffer) 
		{
			messages.push(msgBuffer);
			sendLastMessageToConnectedClients(msgBuffer);
			msgBuffer = null;
		}

		res.statusCode = 201;
		res.end();
	});
};

/*
 * SSE
 * Inspired by: 
 * - http://tomkersten.com/articles/server-sent-events-with-node/
 * - https://github.com/einaros/sse.js/blob/master/lib/sseclient.js
 */
var clients = [];

exports.sseConnect = function(req, res) {
	var client = {};
	client.req = req;
	client.res = res;

	subscribeClient(client);
}


function subscribeClient(client) 
{
	client.req.socket.setNoDelay(true);
	client.res.writeHead(200, {
		'content-type': 'text/event-stream',
		'cache-control': 'no-cache',
		'connection': 'keep-alive'
	});
	client.res.write(':ok\n\n');

	client.res.on('close', function() {
		unsubscribeClient(client);
	});

	clients.push(client);

	console.log(new Date() + ' Client subscribe. (' + clients.length + ' connected clients)');
}


function unsubscribeClient(client) 
{
	client.res.end();
	var index = clients.indexOf(client);
	clients.splice(index, 1);
	console.log(new Date() + ' Client unsubscribe. (' + clients.length + ' connected clients)');
}


function sendLastMessageToConnectedClients(lastmsg) 
{
	console.log(new Date() + ' Sending message to ' + clients.length + ' connected clients.');

	var sseBody  = "event: newmessage\n";
		sseBody += "data: " + lastmsg;
		sseBody += "\n\n";

	clients.forEach(function(client) {
		client.res.write(sseBody);
	});
}